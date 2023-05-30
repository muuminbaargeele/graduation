import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation/screens/complaints.dart';
import 'package:graduation/screens/profile.dart';

import '../screens/home.dart';
import 'selectedbutton.dart';

class DrawerWidgit extends StatelessWidget {
  const DrawerWidgit({super.key, required this.selectedbutton});

  final String selectedbutton;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Container(
          // color: Colors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: FaIcon(FontAwesomeIcons.xmark),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        )),
                    child: Center(
                        child: FaIcon(
                      FontAwesomeIcons.userTie,
                      size: 34,
                    )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Faahim",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Faahim144@gmail.com",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.black.withOpacity(0.5)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black,
              ),
              SizedBox(
                height: 25,
              ),
              SelectButton(
                text: "Home",
                backgroundColor: (selectedbutton == "home")
                    ? Color(0xff0084FF)
                    : Colors.white,
                icon: FontAwesomeIcons.house,
                ontap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomeScreen()));
                },
                padding: (selectedbutton == "home") ? 10 : 0,
                selectedColor:
                    (selectedbutton == "home") ? Colors.white : Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              SelectButton(
                text: "Complaints",
                backgroundColor: (selectedbutton == "complaints")
                    ? Color(0xff0084FF)
                    : Colors.white,
                icon: Icons.folder_copy_rounded,
                ontap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ComplaintsScreen()));
                },
                padding: (selectedbutton == "complaints") ? 10 : 0,
                selectedColor:
                    (selectedbutton == "complaints") ? Colors.white : Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              SelectButton(
                text: "Profile",
                backgroundColor: (selectedbutton == "profile")
                    ? Color(0xff0084FF)
                    : Colors.white,
                icon: FontAwesomeIcons.solidUser,
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ProfileScreen()));
                },
                padding: (selectedbutton == "profile") ? 10 : 0,
                selectedColor:
                    (selectedbutton == "profile") ? Colors.white : Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
