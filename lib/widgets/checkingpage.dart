import 'package:flutter/material.dart';

import 'custombutton.dart';

class CheckingPAge extends StatelessWidget {
  const CheckingPAge({
    super.key,
    required this.map,
    required this.img,
    required this.onpressed,
    required this.btnclr,
    required this.btntext,
  });

  final String map;
  final String img;
  final Function() onpressed;
  final Color btnclr;
  final String btntext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(img),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      map,
                      style: TextStyle(fontSize: 16,color: Colors.black.withOpacity(0.5)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomButton(btn: btntext, btncl: btnclr, onpressed: onpressed)
        ],
      ),
    );
  }
}
