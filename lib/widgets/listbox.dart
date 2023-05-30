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
  });

  final String title;
  final String text;
  final String image;
  final String status;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: ontap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 100,
                width: 100,
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
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                      width: 140,
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
                height: 60,
                width: 1,
                color: Colors.black,
              ),
              SizedBox(
                width: 60,
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFF0000),
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
