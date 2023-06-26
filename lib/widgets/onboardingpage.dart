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
    final double vh = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: vh * 0.3344, child: Image.asset(icon)),
          Padding(
            padding: EdgeInsets.only(top: vh * 0.076),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: vh * 0.0346, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: vh * 0.0115),
                  child: Text(
                    disc,
                    style: TextStyle(fontSize: vh * 0.015),
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