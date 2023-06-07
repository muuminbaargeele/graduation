import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/complaininfo.dart';
import '../widgets/customalert.dart';
import '../widgets/drawer.dart';
import '../widgets/listbox.dart';

class ComplaintsScreen extends StatelessWidget {
  const ComplaintsScreen({super.key});

  showAlertDialog(BuildContext context, title, image, status) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.all(0),
      elevation: 0,
      content: Container(
          height: 550,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                height: 215,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: CustomAlert(
                  text: title,
                  image: image,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      ComplainInfo(
                        title: "Complaint Type",
                        info: "Waste Management",
                      ),
                      ComplainInfo(
                        title: "District",
                        info: "Wadajir",
                      ),
                      ComplainInfo(
                        title: "Address",
                        info: "Suuqa Weyn",
                      ),
                      ComplainInfo(
                        title: "Description",
                        info: "Gurigeyga Hortisa Waxa Lagu So daadiyay Qashin",
                      ),
                      ComplainInfo(
                        title: "Date",
                        info: "2 days ago",
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Status:",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 135,
                                child: Text(
                                  status,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xffFF0000),
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
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
    List<String> titles = [
      "HealthCare",
      "Traffic Jam",
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
              itemCount: titles.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                child: ListBox(
                  title: titles[index],
                  text:
                      "The complaint has been fully investigated,  and closed,  indicating that no further action is required or possible.",
                  image: "assets/images/${titles[index]}.jpg",
                  status: "Closed",
                  ontap: () {
                    showAlertDialog(
                      context,
                      titles[index],
                      "assets/images/${titles[index]}.jpg",
                      "Closed",
                    );
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
