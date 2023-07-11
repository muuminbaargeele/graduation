import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/screens/leave.dart';
import 'package:graduation/screens/turnon.dart';
import '../widgets/custombutton.dart';
import '../widgets/onboardingpage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:country_flags/country_flags.dart';
import 'welcome.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;
  List<String> disc = [
    "If you're looking for an easy-to-use complaint application,\nyou've come to the right place!\n Our application is designed with a simple and user-friendly\n interface that makes it easy for you to submit complaints\n or feedback in just a few simple steps.",
    "Our complaint application is designed to be user-friendly,\n with a simple and intuitive interface that makes it \neasy for you to submit complaints or feedback. \nWe understand that submitting a complaint can be \na frustrating experience.",
    "We welcome all feedback from our users and strive\n to continuously improve our complaint application. \nWe understand that providing a platform \nfor users to submit their complaints \nor feedback is only the first step,",
  ];
  List<String> icon = [
    "assets/icons/easy_to_use.png",
    "assets/icons/user_frnd.png",
    "assets/icons/feedbacks.png",
  ];
  List<String> title = ["Easy To Use", "User Friendly", "soo dhawaw "];

  // Get Location

  String? _currentAddress;
  String? _currentCountry;
  String? _currentisoCountry;
  Position? _currentPosition;
  bool _isNotChacked = true;

  Future<void> _getCurrentPosition() async {
    // final hasPermission = await _handleLocationPermission();
    final hasPermission = await requestLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  showAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.all(0),
      elevation: 0,
      // title: Text("Checking"),
      content: Container(
        height: 210,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: (Platform.isIOS)
              ? CupertinoActivityIndicator(
                  radius: 20,
                )
              : SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );

    // show the dialog
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
        barrierDismissible: false);
  }

  showAlertDialogwithFlack(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.all(0),
      elevation: 0,
      // title: Text("Checking"),
      content: Container(
        height: 210,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CountryFlag.fromCountryCode(
              '$_currentisoCountry',
              height: 50,
              width: 70,
              borderRadius: 8,
            ),
            Text(_currentCountry!)
          ],
        ),
      ),
    );

    // show the dialog
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
            (_currentAddress == "Somalia, Mogadisho")
                ? Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                    (Route<dynamic> route) => false)
                : Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LeaveScreen()),
                    (Route<dynamic> route) => false);
          });
          return alert;
        },
        barrierDismissible: false);
  }

  locationCheck() {
    if (_currentAddress == null) {
      showAlertDialog(context);
    } else {
      _isNotChacked = false;
      Navigator.of(context).pop();
      showAlertDialogwithFlack(context);
    }
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress = '${place.country}, ${place.subAdministrativeArea}';
        _currentCountry = '${place.country}';
        _currentisoCountry = '${place.isoCountryCode}';
      });
      if (_isNotChacked) {
        locationCheck();
      }
    }).catchError((e) {
      debugPrint(e);
    });
  }

  // Request Location

  Future requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Handle the case where the user denies the permission again
        // You can show a dialog or display a message to the user
        print('Location permission denied again');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TurnOn(
                  getCurrentPosition: _getCurrentPosition,
                )));
        return false;
      } else if (permission == LocationPermission.deniedForever) {
        // Handle the case where the user permanently denies the permission
        // Prompt the user to go to app settings and manually enable the location permission
        await openAppSettings();
        print('Location permission permanently denied');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TurnOn(
                  getCurrentPosition: _getCurrentPosition,
                )));
        return false;
      } else {
        // Permission granted, you can proceed with location-related functionality
        print('Location permission granted');
        locationCheck();
        return true;
      }
    } else if (permission == LocationPermission.deniedForever) {
      // Handle the case where the user has already permanently denied the permission
      // Prompt the user to go to app settings and manually enable the location permission
      await openAppSettings();
      print('Location permission permanently denied');
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TurnOn(
                getCurrentPosition: _getCurrentPosition,
              )));
      return false;
    } else {
      // Permission granted, you can proceed with location-related functionality
      print('Location permission granted');
      locationCheck();
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double v = MediaQuery.of(context).size.height;
    final double h = MediaQuery.of(context).size.width;
    PageController _controller = PageController(
      initialPage: currentPage,
    );
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                  print(currentPage);
                });
              },
              controller: _controller,
              children: [
                OnBoardingPage(icon: icon[0], title: title[0], disc: disc[0]),
                Padding(
                  padding: EdgeInsets.only(left: h * 0.049),
                  child: OnBoardingPage(
                      icon: icon[1], title: title[1], disc: disc[1]),
                ),
                OnBoardingPage(icon: icon[2], title: title[2], disc: disc[2]),
              ],
            ),
          ),
          Container(
            height: v * 0.161,
            width: double.infinity,
            child: Center(
              child: Column(
                children: [
                  (currentPage == 2)
                      ? CustomButton(
                          btn: "Get Started",
                          btncl: Color(0xff0084FF),
                          onpressed: () {
                            _getCurrentPosition();
                            // showAlertDialog(context);
                          },
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              _controller.animateToPage(2,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeInOut);
                            });
                          },
                          child: SizedBox(
                            height: v * 0.044,
                            child: Center(
                              child: Text(
                                "Skip",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: v * 0.023,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                  Padding(
                    padding: EdgeInsets.only(top: v * 0.04),
                    child: Container(
                      height: v * 0.007,
                      width: h * 0.34,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => _controller.animateToPage(0,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut),
                            child: Container(
                              height: v * 0.007,
                              width: h * 0.1,
                              decoration: BoxDecoration(
                                  color: (currentPage == 0)
                                      ? Colors.black.withOpacity(0.5)
                                      : Colors.black.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(2)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _controller.animateToPage(1,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut),
                            child: Container(
                              height: v * 0.007,
                              width: h * 0.1,
                              decoration: BoxDecoration(
                                  color: (currentPage == 1)
                                      ? Colors.black.withOpacity(0.5)
                                      : Colors.black.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(2)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _controller.animateToPage(2,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut),
                            child: Container(
                              height: v * 0.007,
                              width: h * 0.1,
                              decoration: BoxDecoration(
                                  color: (currentPage == 2)
                                      ? Colors.black.withOpacity(0.5)
                                      : Colors.black.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(2)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
