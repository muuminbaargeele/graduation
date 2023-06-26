import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.btn,
      required this.btncl,
      required this.onpressed});

  final Function() onpressed;
  final String btn;
  final Color btncl;

  @override
  Widget build(BuildContext context) {
    final double v = MediaQuery.of(context).size.height;
    final double h = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onpressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: v * 0.008, horizontal: h * 0.06),
            child: Text(
              btn,
              style: TextStyle(
                color: btncl,
                fontWeight: FontWeight.w600,
                fontSize: v * 0.0184,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
