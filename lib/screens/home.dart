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
                height: v * 0.0518,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: h * 0.0365),
                      child: FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: v * 0.01844,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        style: TextStyle(fontSize: v * 0.01614),
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
                          padding: EdgeInsets.only(top: v * 0.023),
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
                                    "https://baargeelle.com/grd_imgs/${complaintTypes[index].name}.jpg",
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
