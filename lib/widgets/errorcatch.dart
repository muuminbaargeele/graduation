import 'package:flutter/material.dart';

class ErrorCatch extends StatelessWidget {
  const ErrorCatch({
    super.key,
    required this.errorName,
  });

  final String errorName;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: errorName.isNotEmpty,
      child: Text(
        errorName,
        style: TextStyle(
            fontSize: 12, color: Colors.redAccent),
      ),
    );
  }
}