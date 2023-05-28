import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrimryButton extends StatelessWidget {
  const PrimryButton({
    super.key,
    required this.btntext,
    required this.fontclr,
    required this.color,
    required this.width,
    required this.ontap,
    this.icon,
    this.iconclr,
  });

  final String btntext;
  final Color fontclr;
  final Color color;
  final double width;
  final Function() ontap;
  final IconData? icon;
  final Color? iconclr;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: ontap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  btntext,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: fontclr,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Visibility(
                  visible: icon != null,
                  child: FaIcon(
                    icon,
                    size: 20,
                    color: iconclr,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
