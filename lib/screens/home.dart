import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation/screens/complain.dart';

import '../widgets/complaintsbox.dart';
import '../widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "HealthCare",
      "Traffic",
      "Education",
      "Waste Management",
      "Police Safety",
      "Firefight",
      "Law Enforcement",
      "Infrastructure",
      "Disability rights",
      "Taxation",
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(builder: (context) {
            return IconButton(
              icon: FaIcon(
                FontAwesomeIcons.bars,
                color: Colors.black,
              ), // Custom drawer icon
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open drawer on icon press
              },
            );
          }),
        ),
        drawer: DrawerWidgit(
          selectedbutton: "home",
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
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
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: 16,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                            hintText: "Search", border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: titles.length, // Number of items
                  itemBuilder: (context, index) {
                    return ComplaintsBox(
                      text: titles[index],
                      image: "assets/images/${titles[index]}.jpg",
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ComplainScreen(
                                      complaint: [
                                        titles[index],
                                        "heroimage${index}"
                                      ],
                                    )));
                      },
                      heroimage: "heroimage${index}",
                    );
                  },
                ),
              ))
            ],
          ),
        ));
  }
}
