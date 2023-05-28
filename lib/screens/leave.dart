import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/checkingpage.dart';

class LeaveScreen extends StatelessWidget {
  const LeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String map =
        "We apologize for any confusion, \nbut our complaint application is currently\n designed and available exclusively for \ncitizens of Somalia.";

    return Scaffold(
        body: CheckingPAge(
      map: map,
      btnclr: Color(0xffFC4E4E),
      btntext: "Leave",
      img: "assets/icons/map.png",
      onpressed: () {
        print("OUUUUUUTTT");
        (Platform.isIOS) ? exit(0) : SystemNavigator.pop();
      },
    ));
  }
}
