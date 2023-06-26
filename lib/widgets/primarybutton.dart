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
    this.isLoading,
    this.textSize,
  });

  final String btntext;
  final Color fontclr;
  final Color color;
  final double width;
  final Function() ontap;
  final IconData? icon;
  final Color? iconclr;
  final bool? isLoading;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    final double v = MediaQuery.of(context).size.height;
    final double h = MediaQuery.of(context).size.width;
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: isLoading ?? false ? null : ontap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: width,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: v * 0.0115,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLoading ?? false
                    ? SizedBox(
                        height: v * 0.035,
                        width: h * 0.073,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        btntext,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: fontclr,
                          fontWeight: FontWeight.w600,
                          fontSize: textSize == null ? v * 0.023 : textSize,
                        ),
                      ),
                SizedBox(
                  width: 10,
                ),
                Visibility(
                  visible: icon != null,
                  child: FaIcon(
                    icon,
                    size: v * 0.023,
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
