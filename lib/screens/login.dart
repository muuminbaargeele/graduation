import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation/databases/services.dart';
import 'package:graduation/screens/home.dart';
import 'package:graduation/screens/signup.dart';
import 'package:graduation/widgets/primarybutton.dart';

import '../widgets/mytextfield.dart';

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
          EasyLoading.showSuccess('Great Success!',
              maskType: EasyLoadingMaskType.black);
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
                      MyTextField(
                        controller: usernameController,
                        errorName: usernameError,
                        padding: 25.0,
                        icon: FontAwesomeIcons.solidUser,
                        text: "Username",
                        textInputType: TextInputType.name,
                      ),
                      MyTextField(
                          controller: passwordController,
                          errorName: passwordError,
                          padding: 25.0,
                          icon: FontAwesomeIcons.lock,
                          text: "Password",
                          textInputType: TextInputType.visiblePassword,
                          isPassword: true,
                          topPaddingError: usernameError),
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
