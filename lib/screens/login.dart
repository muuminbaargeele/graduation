import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation/databases/services.dart';
import 'package:graduation/screens/home.dart';
import 'package:graduation/screens/signup.dart';
import 'package:graduation/widgets/primarybutton.dart';

import '../widgets/errorcatch.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String usernameError = "";
  String passwordError = "";
  bool isLoading = false;

  loginValidate(username, pass) async {
    setState(() {
      usernameError = username.isEmpty ? "Please Enter a Username" : "";
      passwordError = pass.isEmpty ? "Please Enter a Password" : "";
    });

    if (usernameError.isEmpty && passwordError.isEmpty) {
      try {
        setState(() {
          isLoading = true;
        });
        final responseData = await login(username, pass);
        // Process the response data
        if (responseData == "Success") {
          print('Login successful! Response: $responseData');
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen()),
              (route) => false);
        } else {
          setState(() {
            passwordError =
                responseData == "Incorrect password" ? responseData : "";
            usernameError =
                responseData == "Incorrect username" ? responseData : "";
          });
        }
        setState(() {
          isLoading = false;
        });
      } catch (error) {
        // Handle login failure or error
        print('Login failed or error occurred. Error: $error');
      }
    }
  }

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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: usernameError.isEmpty
                                  ? null
                                  : Border.all(color: Colors.redAccent),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.solidUser,
                                    size: 20,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 3),
                                    child: TextField(
                                      controller: usernameController,
                                      style: TextStyle(fontSize: 12),
                                      decoration: InputDecoration(
                                          hintText: "Username",
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ErrorCatch(errorName: usernameError)
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: usernameError.isEmpty ? 25.0 : 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 45,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: passwordError.isEmpty
                                    ? null
                                    : Border.all(color: Colors.redAccent),
                              ),
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
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 3),
                                      child: TextField(
                                        controller: passwordController,
                                        style: TextStyle(fontSize: 12),
                                        decoration: InputDecoration(
                                            hintText: "Password",
                                            border: InputBorder.none),
                                        obscureText: true,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ErrorCatch(errorName: passwordError)
                          ],
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
                        isLoading: isLoading,
                        ontap: () {
                          FocusScope.of(context).unfocus();
                          loginValidate(
                              usernameController.text, passwordController.text);
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
