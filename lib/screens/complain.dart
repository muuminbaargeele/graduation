import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation/widgets/primarybutton.dart';

class ComplainScreen extends StatefulWidget {
  const ComplainScreen({super.key, required this.complaint});

  final List complaint;

  @override
  State<ComplainScreen> createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
  String? selectedDistricts;
  List<String> districts = [
    "Wadajir",
    "Dharkenley",
    "Hodan",
    "Holwadaag",
    "Dayniile"
  ];
  String disc =
      "Complaints regarding healthcare services, such as long wait times, inadequate treatment, billing issues, or improper conduct by healthcare professionals.";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: SizedBox(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Hero(
                          tag: widget.complaint[1],
                          child: Container(
                            height: 270,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/${widget.complaint[0]}.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 140,
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
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    widget.complaint[0],
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: Text(
                                      disc,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      child: Column(
                        children: [
                          Container(
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Container(
                                    height: double.infinity,
                                    width: 30,
                                    child: Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.mapLocationDot,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 18.0),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: selectedDistricts,
                                        isExpanded: true,
                                        icon: FaIcon(
                                          FontAwesomeIcons.caretDown,
                                          size: 14,
                                          color: Colors.black,
                                        ),
                                        hint: Text(
                                          'District',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedDistricts = newValue;
                                          });
                                        },
                                        items: districts
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Container(
                                    height: double.infinity,
                                    width: 30,
                                    child: Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.locationDot,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(fontSize: 12),
                                    decoration: InputDecoration(
                                        hintText: "Address",
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: TextField(
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                style: TextStyle(fontSize: 12),
                                decoration: InputDecoration(
                                    hintText: "Description",
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.upload,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "Upload",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: FaIcon(
                                        FontAwesomeIcons.solidFile,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: PrimryButton(
                      btntext: "Submit",
                      fontclr: Colors.white,
                      color: Color(0xff0084FF),
                      width: double.infinity,
                      ontap: () {}),
                )
              ],
            ),
          ),
        ));
  }
}
