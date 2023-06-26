import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ComplaintsBox extends StatelessWidget {
  const ComplaintsBox({
    super.key,
    required this.image,
    required this.text,
    required this.ontap,
    required this.heroimage,
  });

  final String image;
  final String text;
  final Function() ontap;
  final String heroimage;

  @override
  Widget build(BuildContext context) {
    final double v = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Stack(
          children: [
            Positioned.fill(
              child: Hero(
                tag: heroimage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(image), fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.transparent,
                      blurRadius: 4,
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: v * 0.019,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
                child: new Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10.0),
                    child: new InkWell(
                      splashColor: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: ontap,
                    ))),
          ],
        ));
  }
}
