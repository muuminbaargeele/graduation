import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'errorcatch.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.topPaddingError,
    required this.errorName,
    required this.controller,
    required this.text,
    this.icon,
    this.isPassword,
    required this.textInputType,
    required this.padding,
    this.isPhone,
    this.height,
  });

  final String? topPaddingError;
  final String errorName;
  final TextEditingController controller;
  final String text;
  final IconData? icon;
  final bool? isPassword;
  final TextInputType textInputType;
  final double padding;
  final double? height;
  final bool? isPhone;

  @override
  Widget build(BuildContext context) {
    final double v = MediaQuery.of(context).size.height;
    final double h = MediaQuery.of(context).size.width;
    print(v);
    return Padding(
      padding: EdgeInsets.only(
          top: topPaddingError == null
              ? padding
              : (topPaddingError!.isEmpty ? padding : v * 0.009)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height ?? v * 0.052,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: errorName.isEmpty
                  ? null
                  : Border.all(color: Colors.redAccent),
            ),
            child: Row(
              crossAxisAlignment: icon == null
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: h * 0.02),
                  child: Visibility(
                    visible: icon != null,
                    child: Container(
                      height: double.infinity,
                      width: h * 0.073,
                      child: Center(
                        child: FaIcon(
                          icon,
                          size: v * 0.023,
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isPhone ?? false,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: errorName.isEmpty
                            ? v * 0.00495718
                            : v * 0.00288208),
                    child: Text(
                      "+252 ",
                      style: TextStyle(fontSize: v * 0.014),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: v * 0.0034585),
                    child: TextField(
                      controller: controller,
                      style: TextStyle(fontSize: v * 0.014),
                      decoration: InputDecoration(
                        hintText: text,
                        border: InputBorder.none,
                      ),
                      obscureText: isPassword ?? false,
                      keyboardType: textInputType,
                      maxLines: (text == "Description") ? 19 : 1,
                      maxLength: (text == "Description") ? 500 : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ErrorCatch(errorName: errorName)
        ],
      ),
    );
  }
}
