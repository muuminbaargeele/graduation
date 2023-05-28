import 'package:flutter/material.dart';
import 'package:graduation/widgets/checkingpage.dart';

class TurnOn extends StatelessWidget {
  const TurnOn({super.key, required this.getCurrentPosition});
  final Function() getCurrentPosition;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CheckingPAge(map: "Location access is off", img: "assets/icons/location.png", onpressed: getCurrentPosition, btnclr: Color(0xff0084FF), btntext: "Turn on")
    );
  }
}
