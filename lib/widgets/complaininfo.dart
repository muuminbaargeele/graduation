import 'package:flutter/material.dart';

class ComplainInfo extends StatelessWidget {
  const ComplainInfo({
    super.key,
    required this.title,
    required this.info,
  });

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${title}:",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 135,
              child: Text(
                info,
                style: TextStyle(
                  fontSize: 8,
                  color: Colors.black.withOpacity(0.5),
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.black,
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}