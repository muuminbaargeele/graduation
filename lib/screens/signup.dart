import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation/models/districtModel.dart';
import 'package:graduation/screens/login.dart';
import 'package:graduation/screens/otp.dart';
import '../databases/services.dart';
import '../widgets/errorcatch.dart';
import '../widgets/mytextfield.dart';
import '../widgets/primarybutton.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}



class _SignupScreenState extends State<SignupScreen> {
  List<Districts> districts = []; // List to store the items for the dropdown
  Districts? selectedDistrict; // Selected district
  String? selectedGender;
  List<String> gender = ["Male", "Female"];
  TextEditingController nameController = TextEditingController();
  TextEditingController gmailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String nameError = "";
  String gmailError = "";
  String usernameError = "";
  String passwordError = "";
  String districtError = "";
  String phoneError = "";
  String genderError = "";
  bool isLoading = false;

  validation(name, gmail, username, pass, district, phone, gender) {
    final RegExp nameRegex = RegExp(r'^[a-zA-Z ]+$');
    final RegExp gmailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@gmail.com$');
    final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_]{4,16}$');
    final RegExp passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d@!$%^&*()\-_=+{};:,<.>]{8,}$');
    final RegExp phoneRegex = RegExp(r"^[6]\d{8}$");

    setState(() {
      nameError = name.isEmpty
          ? "Please Enter a Name"
          : nameRegex.hasMatch(name)
              ? ""
              : "Invalid Name";
      gmailError = gmail.isEmpty
          ? "Please Enter a Gmail"
          : gmailRegex.hasMatch(gmail)
              ? ""
              : "Invalid Gmail";
      usernameError = username.isEmpty
          ? "Please Enter a Username"
          : usernameRegex.hasMatch(username)
              ? ""
              : "Invalid Username";
      passwordError = pass.isEmpty
          ? "Please Enter a Password"
          : passwordRegex.hasMatch(pass)
              ? ""
              : "Week Password";
      districtError = district.isEmpty ? "Please Select a District" : "";
      phoneError = phone.isEmpty
          ? "Please Enter a Phone Number"
          : phoneRegex.hasMatch(phone)
              ? ""
              : "Invalid Phone Number";
      ;
      genderError = gender.isEmpty ? "Please Select a Gender" : "";
    });
  }

  signUpValidate(name, gmail, username, pass, district, phone, gender) async {
    validation(name, gmail, username, pass, district, phone, gender);

    bool check = nameError.isEmpty &&
        gmailError.isEmpty &&
        usernameError.isEmpty &&
        passwordError.isEmpty &&
        districtError.isEmpty &&
        phoneError.isEmpty &&
        genderError.isEmpty;

    if (check) {
      try {
        setState(() {
          isLoading = true;
        });
        final responseData =
            await SendOTP(name, gmail, username, pass, district, phone, gender);
        // Process the response data
        if (responseData == "Success") {
          print('Auth successful! Response: $responseData');
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => OtpPage(
                      userGmail: gmail,
                    )),
          );
        } else {
          setState(() {
            usernameError =
                responseData == "Username Already exists" ? responseData : "";
            gmailError =
                responseData == "Gmail Already exists" ? responseData : "";
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
  void initState() {
    super.initState();
    // Fetch districts and update the state
    fetchDistricts().then((fetchedDistricts) {
      setState(() {
        districts = fetchedDistricts;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: height,
        child: Padding(
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
                  MyTextField(
                    controller: nameController,
                    errorName: nameError,
                    padding: 15.0,
                    icon: FontAwesomeIcons.solidFileLines,
                    text: "Name",
                    textInputType: TextInputType.name,
                  ),
                  MyTextField(
                      controller: gmailController,
                      errorName: gmailError,
                      padding: 15.0,
                      icon: FontAwesomeIcons.solidEnvelope,
                      text: "Gmail",
                      textInputType: TextInputType.emailAddress,
                      topPaddingError: nameError),
                  MyTextField(
                    controller: usernameController,
                    errorName: usernameError,
                    padding: 15.0,
                    icon: FontAwesomeIcons.solidUser,
                    text: "Username",
                    textInputType: TextInputType.name,
                    topPaddingError: gmailError,
                  ),
                  MyTextField(
                      controller: passwordController,
                      errorName: passwordError,
                      padding: 15.0,
                      icon: FontAwesomeIcons.lock,
                      text: "Password",
                      textInputType: TextInputType.visiblePassword,
                      isPassword: true,
                      topPaddingError: usernameError),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: passwordError.isEmpty ? 15 : 8.0),
                        child: Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: districtError.isEmpty
                                  ? null
                                  : Border.all(color: Colors.redAccent)),
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
                                    child: DropdownButton<Districts>(
                                      value: selectedDistrict,
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
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedDistrict = newValue;
                                        });
                                        print(selectedDistrict!.districtId);
                                      },
                                      items: districts
                                          .map<DropdownMenuItem<Districts>>(
                                              (Districts value) {
                                        return DropdownMenuItem<Districts>(
                                          value: value,
                                          child: Text(
                                            value.name,
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
                      ErrorCatch(errorName: districtError)
                    ],
                  ),
                  MyTextField(
                    controller: phoneController,
                    errorName: phoneError,
                    padding: 15.0,
                    icon: FontAwesomeIcons.phone,
                    text: "Phone",
                    textInputType: TextInputType.phone,
                    topPaddingError: districtError,
                    isPhone: true,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: phoneError.isEmpty ? 15.0 : 8.0),
                        child: Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: genderError.isEmpty
                                  ? null
                                  : Border.all(color: Colors.redAccent)),
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
                                      items: gender
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
                      ErrorCatch(errorName: genderError)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: PrimryButton(
                        btntext: "Sign up",
                        fontclr: Colors.white,
                        color: Color(0xff0084FF),
                        width: double.infinity,
                        isLoading: isLoading,
                        ontap: () {
                          FocusScope.of(context).unfocus();
                          signUpValidate(
                              nameController.text,
                              gmailController.text,
                              usernameController.text,
                              passwordController.text,
                              selectedDistrict == null
                                  ? ""
                                  : selectedDistrict!.districtId,
                              phoneController.text,
                              selectedGender ?? "");
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
        ),
      ),
    ));
  }
}
