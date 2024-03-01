import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation/models/complaintsmodel.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../databases/services.dart';
import '../widgets/complaininfo.dart';
import '../widgets/customalert.dart';
import '../widgets/drawer.dart';
import '../widgets/listbox.dart';
import 'package:timeago/timeago.dart' as timeago;

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({super.key});

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  late Box box;
  List<Complaints> complaints = [];
  bool isLoading = true;
  Timer? timer;

  showAlertDialog(BuildContext context, index) {
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
                  text: complaints[index].ctname,
                  image:
                      "https://graduation-hu.000webhostapp.com/backEnd/uploads/${complaints[index].compImg}",
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      ComplainInfo(
                        title: "Complaint Type",
                        info: complaints[index].ctname,
                      ),
                      ComplainInfo(
                        title: "District",
                        info: complaints[index].dname,
                      ),
                      ComplainInfo(
                        title: "Address",
                        info: complaints[index].address,
                      ),
                      ComplainInfo(
                        title: "Description",
                        info: complaints[index].compDesc,
                      ),
                      ComplainInfo(
                        title: "Date",
                        info: timeago.format(complaints[index].dateTime),
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
                                  complaints[index].sname,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Color(int.parse(
                                              complaints[index].hexCode,
                                              radix: 16) +
                                          0xFF000000),
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
  void initState() {
    super.initState();
    box = Hive.box('local_storage');
    startAPICalls();
    // callAPIFunction();
  }

  void startAPICalls() {
    timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      callAPIFunction();
    });
  }

  callAPIFunction() {
    String username = box.get("username");
    // Fetch compliaints and update the state
    fetchComplaints(username).then((fetchComplaints) {
      setState(() {
        complaints = fetchComplaints;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double v = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0084FF),
        elevation: 0,
        title: Text(
          "Complaints",
          style: TextStyle(
            fontSize: v * 0.0276,
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
                height: v * 0.0807,
                width: double.infinity,
                color: Color(0xff0084FF),
              ),
              Container(
                height: v * 0.0461,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff7ABCFA),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
              )
            ],
          ),
          isLoading
              ? Expanded(child: Center(child: CircularProgressIndicator()))
              : Expanded(
                  child: complaints.isEmpty
                      ? Center(
                          child: Text(
                          "No Complaints",
                          style: TextStyle(fontSize: v * 0.035),
                        ))
                      : ListView.builder(
                          itemCount: complaints.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                            child: ListBox(
                              title: complaints[index].ctname,
                              text: complaints[index].statusDesc,
                              image:
                                  "https://graduation-hu.000webhostapp.com/backEnd/uploads/${complaints[index].compImg}",
                              status: complaints[index].sname,
                              hex: complaints[index].hexCode,
                              ontap: () {
                                showAlertDialog(context, index);
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
