import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation/screens/complaints.dart';
import 'package:graduation/screens/profile.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../databases/services.dart';
import '../models/usermodel.dart';
import '../screens/home.dart';
import 'selectedbutton.dart';

class DrawerWidgit extends StatefulWidget {
  const DrawerWidgit({super.key, required this.selectedbutton});

  final String selectedbutton;

  @override
  State<DrawerWidgit> createState() => _DrawerWidgitState();
}

class _DrawerWidgitState extends State<DrawerWidgit> {
  late Box box;
  List<User> user = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    box = Hive.box('local_storage');
    callAPIFunction();
  }

  callAPIFunction() {
    String username = box.get("username");
    // Fetch compliaints and update the state
    fetchuser(username).then((fetchuser) {
      setState(() {
        user = fetchuser;
        isLoading = false;
      });
    });
  }

  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    final double v = MediaQuery.of(context).size.height;
    final double h = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: v * 0.0576, horizontal: h * 0.048),
        child: Container(
          // color: Colors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: FaIcon(FontAwesomeIcons.xmark),
              ),
              SizedBox(
                height: v * 0.0576,
              ),
              Row(
                children: [
                  Container(
                    width: h * 0.146,
                    height: v * 0.07,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        )),
                    child: Center(
                        child: FaIcon(
                      FontAwesomeIcons.userTie,
                      size: v * 0.04,
                    )),
                  ),
                  SizedBox(
                    width: h * 0.024,
                  ),
                  Expanded(
                    child: isLoading
                        ? Center(child: CircularProgressIndicator())
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                capitalizeFirstLetter(user[0].name),
                                style: TextStyle(
                                  fontSize: v * 0.0207,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                user[0].gmail,
                                style: TextStyle(
                                    fontSize: v * 0.013,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black.withOpacity(0.5)),
                              )
                            ],
                          ),
                  ),
                ],
              ),
              SizedBox(
                height: v * 0.0288,
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black,
              ),
              SizedBox(
                height: v * 0.0288,
              ),
              SelectButton(
                text: "Home",
                backgroundColor: (widget.selectedbutton == "home")
                    ? Color(0xff0084FF)
                    : Colors.white,
                icon: FontAwesomeIcons.house,
                ontap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomeScreen()));
                },
                padding: (widget.selectedbutton == "home") ? 10 : 0,
                selectedColor: (widget.selectedbutton == "home")
                    ? Colors.white
                    : Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              SelectButton(
                text: "Complaints",
                backgroundColor: (widget.selectedbutton == "complaints")
                    ? Color(0xff0084FF)
                    : Colors.white,
                icon: Icons.folder_copy_rounded,
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ComplaintsScreen()));
                },
                padding: (widget.selectedbutton == "complaints") ? 10 : 0,
                selectedColor: (widget.selectedbutton == "complaints")
                    ? Colors.white
                    : Colors.black,
              ),
              SizedBox(
                height: v * 0.023,
              ),
              SelectButton(
                text: "Profile",
                backgroundColor: (widget.selectedbutton == "profile")
                    ? Color(0xff0084FF)
                    : Colors.white,
                icon: FontAwesomeIcons.solidUser,
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ProfileScreen()));
                },
                padding: (widget.selectedbutton == "profile") ? 10 : 0,
                selectedColor: (widget.selectedbutton == "profile")
                    ? Colors.white
                    : Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
