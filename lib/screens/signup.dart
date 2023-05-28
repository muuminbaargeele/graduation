import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation/screens/login.dart';
import 'package:graduation/screens/otp.dart';
import '../widgets/primarybutton.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? selectedDistricts;
  String? selectedGender;
  List<String> districts = [
    "Wadajir",
    "Dharkenley",
    "Hodan",
    "Holwadaag",
    "Dayniile"
  ];
  List<String> gender = ["Male", "Female"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              height: double.infinity,
                              width: 30,
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.solidFileLines,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              style: TextStyle(fontSize: 12),
                              decoration: InputDecoration(
                                  hintText: "Name", border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              height: double.infinity,
                              width: 30,
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.solidEnvelope,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              style: TextStyle(fontSize: 12),
                              decoration: InputDecoration(
                                  hintText: "Gmail", border: InputBorder.none),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              height: double.infinity,
                              width: 30,
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.solidUser,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              style: TextStyle(fontSize: 12),
                              decoration: InputDecoration(
                                  hintText: "Username",
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              height: double.infinity,
                              width: 30,
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.lock,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              style: TextStyle(fontSize: 12),
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  border: InputBorder.none),
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              height: double.infinity,
                              width: 30,
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.mapLocationDot,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedDistricts,
                                  isExpanded: true,
                                  icon: FaIcon(
                                    FontAwesomeIcons.caretDown,
                                    size: 14,
                                    color: Colors.black,
                                  ),
                                  hint: Text(
                                    'District',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedDistricts = newValue;
                                    });
                                  },
                                  items: districts
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              height: double.infinity,
                              width: 30,
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.phone,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              style: TextStyle(fontSize: 12),
                              decoration: InputDecoration(
                                  hintText: "Phone", border: InputBorder.none),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              height: double.infinity,
                              width: 30,
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.venusMars,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedGender,
                                  isExpanded: true,
                                  icon: FaIcon(
                                    FontAwesomeIcons.caretDown,
                                    size: 14,
                                    color: Colors.black,
                                  ),
                                  hint: Text(
                                    'Gender',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedGender = newValue;
                                    });
                                  },
                                  items: gender.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: PrimryButton(
                        btntext: "Sign up",
                        fontclr: Colors.white,
                        color: Color(0xff0084FF),
                        width: double.infinity,
                        ontap: () {
                          FocusScope.of(context).unfocus();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => OtpPage()));
                        }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Alredy have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff0084FF),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
