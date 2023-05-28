import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({
    super.key,
    required this.backgroundColor,
    required this.padding,
    required this.selectedColor,
    required this.text,
    required this.icon,
    required this.ontap,
  });
  final Color backgroundColor;
  final double padding;
  final Color selectedColor;
  final String text;
  final IconData icon;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: ontap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              FaIcon(
                icon,
                size: 27,
                color: selectedColor,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: selectedColor,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
