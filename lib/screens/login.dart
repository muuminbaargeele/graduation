import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation/screens/signup.dart';
import 'package:graduation/widgets/primarybutton.dart';

import 'home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Container(
                      height: 120,
                      width: 120,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 50),
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
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
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: FaIcon(
                                FontAwesomeIcons.solidUser,
                                size: 20,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: FaIcon(
                                  FontAwesomeIcons.lock,
                                  size: 20,
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
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: PrimryButton(
                        btntext: "Log in",
                        fontclr: Colors.white,
                        color: Color(0xff0084FF),
                        width: double.infinity,
                        ontap: () {
                          FocusScope.of(context).unfocus();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HomeScreen()));
                        }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignupScreen()));
                      },
                      child: Text(
                        "Sign up",
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
