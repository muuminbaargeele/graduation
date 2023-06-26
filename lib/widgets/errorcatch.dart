import 'package:flutter/material.dart';

class ErrorCatch extends StatelessWidget {
  const ErrorCatch({
    super.key,
    required this.errorName,
  });

  final String errorName;

  @override
  Widget build(BuildContext context) {
    final double v = MediaQuery.of(context).size.height;
    return Visibility(
      visible: errorName.isNotEmpty,
      child: Text(
        errorName,
        style: TextStyle(fontSize: v * 0.013834, color: Colors.redAccent),
      ),
    );
  }
}
