import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AdvancedOtpTextField extends StatelessWidget {
  final ValueChanged<String> onOtpEntered;

  AdvancedOtpTextField({required this.onOtpEntered});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      onChanged: onOtpEntered,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8.0),
        fieldHeight: 60.0,
        fieldWidth: 60.0,
        activeFillColor: Colors.white,
        selectedColor: Colors.blue,
        selectedFillColor: Colors.white.withOpacity(0.1),
        inactiveColor: Colors.white,
        inactiveFillColor: Colors.white,
        activeColor: Colors.blue,
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
