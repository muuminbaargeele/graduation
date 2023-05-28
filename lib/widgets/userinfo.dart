import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key, required this.icon, required this.title, required this.info,
  });

  final IconData icon;
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Container(
            height: 60,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: FaIcon(
                        icon,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "${title}:",
                      style: TextStyle(
                          fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                Text(
                  info,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
