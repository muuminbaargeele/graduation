import 'package:flutter/material.dart';

import 'custombox.dart';

class ListBox extends StatelessWidget {
  const ListBox({
    super.key,
    required this.title,
    required this.text,
    required this.image,
    required this.status,
    required this.ontap,
    required this.hex,
  });

  final String title;
  final String text;
  final String image;
  final String status;
  final Function() ontap;
  final String hex;

  @override
  Widget build(BuildContext context) {
    final double v = MediaQuery.of(context).size.height;
    final double h = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: ontap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: v * 0.1153,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: v * 0.1153,
                width: h * 0.2433,
                child: CustomBox(
                  text: title,
                  images: image,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Description",
                      style: TextStyle(
                          fontSize: v * 0.0138, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                      width: h * 0.34,
                      child: Text(
                        text,
                        style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.5)),
                      )),
                ],
              ),
              Container(
                height: v * 0.07,
                width: 1,
                color: Colors.black,
              ),
              SizedBox(
                width: h * 0.146,
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: v * 0.0138,
                    fontWeight: FontWeight.w600,
                    color: Color(int.parse(hex, radix: 16) + 0xFF000000),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
