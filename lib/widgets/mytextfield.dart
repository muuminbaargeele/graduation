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
    return Padding(
      padding: EdgeInsets.only(
          top: topPaddingError == null
              ? padding
              : (topPaddingError!.isEmpty ? padding : 8.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height ?? 45,
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
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Visibility(
                    visible: icon != null,
                    child: Container(
                      height: double.infinity,
                      width: 30,
                      child: Center(
                        child: FaIcon(
                          icon,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isPhone ?? false,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: errorName.isEmpty ? 4.3 : 2.5),
                    child: Text(
                      "+252 ",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: TextField(
                      controller: controller,
                      style: TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                        hintText: text,
                        border: InputBorder.none,
                      ),
                      obscureText: isPassword ?? false,
                      keyboardType: textInputType,
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
