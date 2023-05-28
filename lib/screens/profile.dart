import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation/screens/login.dart';
import 'package:graduation/widgets/primarybutton.dart';

import '../widgets/drawer.dart';
import '../widgets/userinfo.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        selectedbutton: "profile",
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 320,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff0084FF),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            )),
                        child: Center(
                            child: FaIcon(
                          FontAwesomeIcons.userTie,
                          size: 60,
                          color: Colors.white,
                        )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Faahim",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Text(
                        "Faahim144@gmail.com",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // bottom: -400,
                top: 270,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 25),
                      child: Container(
                        child: Column(
                          children: [
                            UserInfo(
                              title: "Name",
                              icon: FontAwesomeIcons.solidFileLines,
                              info: "Faahim",
                            ),
                            UserInfo(
                              title: "Gmail",
                              icon: FontAwesomeIcons.solidEnvelope,
                              info: "Faahim144@gmail.com",
                            ),
                            UserInfo(
                              title: "Username",
                              icon: FontAwesomeIcons.solidUser,
                              info: "faahim144",
                            ),
                            UserInfo(
                              title: "District",
                              icon: FontAwesomeIcons.mapLocationDot,
                              info: "Wadajir",
                            ),
                            UserInfo(
                              title: "Phone",
                              icon: FontAwesomeIcons.phone,
                              info: "616848177",
                            ),
                            UserInfo(
                              title: "Gender",
                              icon: FontAwesomeIcons.venusMars,
                              info: "Male",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: PrimryButton(
              btntext: "Log out",
              fontclr: Colors.white,
              color: Color(0xffFC4E4E),
              width: double.infinity,
              ontap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                    (route) => false);
              },
              icon: FontAwesomeIcons.rightFromBracket,
              iconclr: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
