import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation/databases/services.dart';
import 'package:graduation/models/complainttypesmodel.dart';
import 'package:graduation/screens/complain.dart';

import '../models/districtModel.dart';
import '../widgets/complaintsbox.dart';
import '../widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ComplaintTypes> complaintTypes = [];
  List<Districts> districts = [];

  @override
  void initState() {
    super.initState();
    // Fetch districts and update the state
    fetchDistricts().then((fetchedDistricts) {
      setState(() {
        districts = fetchedDistricts;
      });
    });
    // Fetch ComplaintTypes and update the state
    fetchComplaintTypes().then((fetchComplaintTypes) {
      setState(() {
        complaintTypes = fetchComplaintTypes;
      });
    });
  }

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
                  child: complaintTypes.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: complaintTypes.length, // Number of items
                            itemBuilder: (context, index) {
                              return ComplaintsBox(
                                text: complaintTypes[index].name,
                                image:
                                    "assets/images/${complaintTypes[index].name}.jpg",
                                ontap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => ComplainScreen(
                                                heroimage: "heroimage${index}",
                                                complaintTypes: complaintTypes,
                                                index: index,
                                                districts: districts,
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
