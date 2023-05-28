import 'package:flutter/material.dart';
import 'package:graduation/screens/home.dart';
import 'package:graduation/widgets/otptextfield.dart';
import 'package:graduation/widgets/primarybutton.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

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
                "Please type verification code send\nto example@gmail.com",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.5)),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 65.0),
              child: SizedBox(
                width: 265,
                child: AdvancedOtpTextField(onOtpEntered: (otp) {
                  print("Code is " + otp);
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: PrimryButton(
                  btntext: "Verify",
                  fontclr: Colors.white,
                  color: Color(0xff0084FF),
                  width: 265,
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
