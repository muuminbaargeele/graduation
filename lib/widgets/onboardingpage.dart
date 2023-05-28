import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.icon,
    required this.title,
    required this.disc,
  });

  final String icon;
  final String title;
  final String disc;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(icon),
          Padding(
            padding: const EdgeInsets.only(top: 66.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    disc,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}