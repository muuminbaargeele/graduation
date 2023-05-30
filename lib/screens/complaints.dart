import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/drawer.dart';
import '../widgets/listbox.dart';

class ComplaintsScreen extends StatelessWidget {
  const ComplaintsScreen({super.key});

  showAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.all(0),
      elevation: 0,
      // title: Text("Checking"),
      content: Container(
        height: 210,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: (Platform.isIOS)
              ? CupertinoActivityIndicator(
                  radius: 20,
                )
              : SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0084FF),
        elevation: 0,
        title: Text(
          "Complaints",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: FaIcon(
              FontAwesomeIcons.bars,
              color: Colors.white,
            ), // Custom drawer icon
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open drawer on icon press
            },
          );
        }),
      ),
      drawer: DrawerWidgit(
        selectedbutton: "complaints",
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 70,
                width: double.infinity,
                color: Color(0xff0084FF),
              ),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff7ABCFA),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                child: ListBox(
                  title: "Firefight",
                  text:
                      "The complaint has been fully investigated,  and closed,  indicating that no further action is required or possible.",
                  image: "assets/images/Firefight.jpg",
                  status: "Closed",
                  ontap: () {
                    showAlertDialog(context);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
