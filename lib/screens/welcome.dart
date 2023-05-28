import 'package:flutter/material.dart';
import 'package:graduation/screens/login.dart';
import 'package:graduation/screens/signup.dart';

import '../widgets/primarybutton.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 60.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset("assets/images/logo.png"),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Welcome",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  "In order to submit a complaint through our application,\n you will need to register for an account first.",
                  style: TextStyle(
                      fontSize: 12, color: Colors.black.withOpacity(0.5)),
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
                width: 284,
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LoginScreen()));
                },
              ),
              Container(
                height: 30,
                width: 284,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: 113,
                      color: Colors.black,
                    ),
                    Text(
                      "or",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      height: 1,
                      width: 113,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              PrimryButton(
                btntext: "Sign up",
                color: Colors.white,
                fontclr: Colors.black,
                width: 284,
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
