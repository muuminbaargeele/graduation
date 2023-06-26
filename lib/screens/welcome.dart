import 'package:flutter/material.dart';
import 'package:graduation/screens/login.dart';
import 'package:graduation/screens/signup.dart';

import '../widgets/primarybutton.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double v = MediaQuery.of(context).size.height;
    final double h = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(vertical: v * 0.07),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
              height: v * 0.346, child: Image.asset("assets/images/logo.png")),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: v * 0.012),
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: v * 0.035, fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  "In order to submit a complaint through our application,\n you will need to register for an account first.",
                  style: TextStyle(
                      fontSize: v * 0.014,
                      color: Colors.black.withOpacity(0.5)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Column(
            children: [
              PrimryButton(
                btntext: "Log in",
                color: Color(0xff0084FF),
                fontclr: Colors.white,
                width: h * 0.7,
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LoginScreen()));
                },
              ),
              Container(
                height: v * 0.035,
                width: h * 0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: h * 0.275,
                      color: Colors.black,
                    ),
                    Text(
                      "or",
                      style: TextStyle(
                          fontSize: v * 0.016, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      height: 1,
                      width: h * 0.275,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              PrimryButton(
                btntext: "Sign up",
                color: Colors.white,
                fontclr: Colors.black,
                width: h * 0.7,
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SignupScreen()));
                },
              ),
            ],
          )
        ],
      ),
    ));
  }
}
