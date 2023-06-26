import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AdvancedOtpTextField extends StatelessWidget {
  final ValueChanged<String> onOtpEntered;
  final bool error;

  AdvancedOtpTextField({required this.onOtpEntered, required this.error});

  @override
  Widget build(BuildContext context) {
    final double v = MediaQuery.of(context).size.height;
    final double h = MediaQuery.of(context).size.width;
    return PinCodeTextField(
      appContext: context,
      length: 4,
      onChanged: onOtpEntered,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8.0),
        fieldHeight: v * 0.07,
        fieldWidth: h * 0.146,
        activeFillColor: Colors.white,
        selectedColor: error ? Colors.red : Colors.blue,
        selectedFillColor: Colors.white.withOpacity(0.1),
        inactiveColor: error ? Colors.red : Colors.white,
        inactiveFillColor: Colors.white,
        activeColor: error ? Colors.red : Colors.blue,
        borderWidth: 2.0,
      ),
      cursorColor: Colors.blue,
      animationDuration: Duration(milliseconds: 300),
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      boxShadows: [
        BoxShadow(
          offset: Offset(0, 1),
          color: Colors.black12,
          blurRadius: 10,
        )
      ],
    );
  }
}
