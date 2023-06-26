import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation/models/usermodel.dart';
import 'package:graduation/screens/login.dart';
import 'package:graduation/widgets/primarybutton.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../databases/services.dart';
import '../widgets/drawer.dart';
import '../widgets/userinfo.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Box box;
  List<User> user = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    box = Hive.box('local_storage');
    callAPIFunction();
  }

  callAPIFunction() {
    String username = box.get("username");
    // Fetch compliaints and update the state
    fetchuser(username).then((fetchuser) {
      setState(() {
        user = fetchuser;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double v = MediaQuery.of(context).size.height;
    final double h = MediaQuery.of(context).size.width;
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
                height: v * 0.3375,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff0084FF),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: Padding(
                  padding: EdgeInsets.only(top: v * 0.092),
                  child: Column(
                    children: [
                      Container(
                        width: h * 0.194,
                        height: v * 0.092,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(
                              color: Colors.white,
                              width: h * 0.0072,
                            )),
                        child: Center(
                            child: FaIcon(
                          FontAwesomeIcons.userTie,
                          size: v * 0.057,
                          color: Colors.white,
                        )),
                      ),
                      SizedBox(
                        height: v * 0.0125,
                      ),
                      isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white.withOpacity(0.5),
                            )
                          : Column(
                              children: [
                                Text(
                                  user[0].name,
                                  style: TextStyle(
                                      fontSize: v * 0.018,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                Text(
                                  user[0].gmail,
                                  style: TextStyle(
                                      fontSize: v * 0.015,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white.withOpacity(0.5)),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // bottom: -400,
                top: v * 0.275,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: h * 0.0486),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: v * 0.035, horizontal: h * 0.0608),
                      child: Container(
                        child: isLoading
                            ? Center(child: CircularProgressIndicator())
                            : Column(
                                children: [
                                  UserInfo(
                                    title: "Name",
                                    icon: FontAwesomeIcons.solidFileLines,
                                    info: user[0].name,
                                  ),
                                  UserInfo(
                                    title: "Gmail",
                                    icon: FontAwesomeIcons.solidEnvelope,
                                    info: user[0].gmail,
                                  ),
                                  UserInfo(
                                    title: "Username",
                                    icon: FontAwesomeIcons.solidUser,
                                    info: user[0].username,
                                  ),
                                  UserInfo(
                                    title: "District",
                                    icon: FontAwesomeIcons.mapLocationDot,
                                    info: user[0].dname,
                                  ),
                                  UserInfo(
                                    title: "Phone",
                                    icon: FontAwesomeIcons.phone,
                                    info: user[0].phone,
                                  ),
                                  UserInfo(
                                    title: "Gender",
                                    icon: FontAwesomeIcons.venusMars,
                                    info: user[0].gender,
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
            padding: EdgeInsets.symmetric(
                vertical: v * 0.035, horizontal: h * 0.0608),
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
