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
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onpressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
            child: Text(
              btn,
              style: TextStyle(
                color: btncl,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
