import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:graduation/databases/services.dart';
import 'package:graduation/screens/home.dart';
import 'package:graduation/widgets/errorcatch.dart';
import 'package:graduation/widgets/otptextfield.dart';
import 'package:graduation/widgets/primarybutton.dart';

class OtpPage extends StatefulWidget {
  OtpPage({super.key, required this.userGmail});
  final String userGmail;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String otp = "";
  String otpError = "";
  bool isLoading = false;

  otpValidate(gmail, otp) async {
    setState(() {
      otpError = otp.isEmpty ? "Please Enter OTP Code" : "";
    });

    if (otpError.isEmpty) {
      try {
        setState(() {
          isLoading = true;
        });
        final responseData = await otpCheck(gmail, otp);
        // Process the response data
        if (responseData == "Success") {
          print('Auth successful! Response: $responseData');
          EasyLoading.showSuccess('Great Success!',
              maskType: EasyLoadingMaskType.black);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen()),
              (route) => false);
        } else {
          setState(() {
            otpError = responseData;
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
        body: Padding(
      padding: const EdgeInsets.only(top: 170.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Verification Code",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Please type verification code send\nto ${widget.userGmail}",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.5)),
                textAlign: TextAlign.center,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 65.0),
                  child: SizedBox(
                    width: 265,
                    child: AdvancedOtpTextField(
                      onOtpEntered: (enteredOtp) {
                        print("Code is " + enteredOtp);
                        setState(() {
                          otp = enteredOtp;
                        });
                      },
                      error: otpError != "",
                    ),
                  ),
                ),
                ErrorCatch(errorName: otpError),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: PrimryButton(
                  btntext: "Verify",
                  fontclr: Colors.white,
                  color: Color(0xff0084FF),
                  width: 265,
                  isLoading: isLoading,
                  ontap: () {
                    FocusScope.of(context).unfocus();
                    otpValidate(widget.userGmail, otp);
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
