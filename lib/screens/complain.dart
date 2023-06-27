import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation/screens/complaints.dart';
import 'package:graduation/widgets/mytextfield.dart';
import 'package:graduation/widgets/primarybutton.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../databases/services.dart';
import '../models/complainttypesmodel.dart';
import '../models/districtModel.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/errorcatch.dart';

class ComplainScreen extends StatefulWidget {
  const ComplainScreen(
      {super.key,
      required this.complaintTypes,
      required this.heroimage,
      required this.index,
      required this.districts});

  final List<ComplaintTypes> complaintTypes;
  final List<Districts> districts;
  final String heroimage;
  final int index;

  @override
  State<ComplainScreen> createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
  Districts? selectedDistrict;
  File? imageFile;
  String? imageName;
  DateTime currentDateTime = DateTime.now();
  TextEditingController addressController = TextEditingController();
  TextEditingController descController = TextEditingController();
  String districtError = "";
  String addressError = "";
  String descError = "";
  String imageError = "";
  bool isLoading = false;
  late Box box;

  complainValidate(district, address, desc, image) {
    setState(() {
      districtError = district.isEmpty ? "Please Select District" : "";
      addressError = address.isEmpty ? "Please Enter a Address" : "";
      descError = desc.isEmpty ? "Please Enter a Description" : "";
      imageError = image.isEmpty ? "Please Enter a Image" : "";
    });
  }


  submit(district, address, desc, image) async {
    complainValidate(district, address, desc, image);

    bool check = districtError.isEmpty &&
        addressError.isEmpty &&
        descError.isEmpty &&
        imageError.isEmpty;

    if (check) {
      try {
        setState(() {
          isLoading = true;
        });
        final responseData = await submitComplaint(
            box.get("username"),
            widget.complaintTypes[widget.index].compTypeId,
            currentDateTime.toString(),
            desc,
            image,
            district,
            address);
        final imageResponse = await uploadImage(imageFile!.path);
        // Process the response data
        if (responseData == "Success" && imageResponse == true) {
          print('Auth successful! Response: $responseData');
          EasyLoading.showSuccess('Submit Success!',
              maskType: EasyLoadingMaskType.black);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => ComplaintsScreen()));
        } else {
          print(responseData);
        }
        setState(() {
          isLoading = false;
        });
      } catch (error) {
        // Handle login failure or error
        print('Login failed or error occurred. Error: $error');
      }
    }
  }

  Future<void> takePicture() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      // Use the captured image file
      setState(() {
        imageFile = File(pickedFile.path);
        imageName = pickedFile.name;
      });
    }
  }

  Future<void> selectImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Use the captured image file
      setState(() {
        imageFile = File(pickedFile.path);
        imageName = pickedFile.name;
      });
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.all(0),
      elevation: 0,
      content: Container(
        height: 120,
        width: 400,
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PrimryButton(
              btntext: "Take Picture",
              fontclr: Colors.black,
              color: Colors.white,
              width: double.infinity,
              textSize: 18,
              icon: FontAwesomeIcons.camera,
              iconclr: Colors.black,
              ontap: () {
                takePicture();
                Navigator.of(context).pop();
              },
            ),
            PrimryButton(
              btntext: "Select Image",
              fontclr: Colors.black,
              color: Colors.white,
              width: double.infinity,
              textSize: 18,
              icon: FontAwesomeIcons.solidImage,
              iconclr: Colors.black,
              ontap: () {
                selectImage();
                Navigator.of(context).pop();
              },
            ),
          ],
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
  void initState() {
    super.initState();
    box = Hive.box('local_storage');
  }

  @override
  Widget build(BuildContext context) {
    final double v = MediaQuery.of(context).size.height;
    final double h = MediaQuery.of(context).size.width;
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: SizedBox(
            height: v,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Hero(
                          tag: widget.heroimage,
                          child: Container(
                            height: v * 0.31126,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://baargeelle.com/grd_imgs/${widget.complaintTypes[widget.index].name}.jpg",
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: v * 0.1614,
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
                              padding: EdgeInsets.fromLTRB(
                                  h * 0.0486, 0, 0, v * 0.0115),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    widget.complaintTypes[widget.index].name,
                                    style: TextStyle(
                                      fontSize: v * 0.0276,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: h * 0.73,
                                    child: Text(
                                      widget.complaintTypes[widget.index]
                                          .compTypeDisc,
                                      style: TextStyle(
                                        fontSize: v * 0.0115,
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
                      padding: EdgeInsets.symmetric(
                          vertical: v * 0.035, horizontal: h * 0.048),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: v * 0.0518,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: districtError.isEmpty
                                        ? null
                                        : Border.all(color: Colors.redAccent)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: h * 0.02),
                                      child: Container(
                                        height: double.infinity,
                                        width: h * 0.073,
                                        child: Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.mapLocationDot,
                                            size: v * 0.023,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(right: h * 0.0438),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<Districts>(
                                            value: selectedDistrict,
                                            isExpanded: true,
                                            icon: FaIcon(
                                              FontAwesomeIcons.caretDown,
                                              size: v * 0.01614,
                                              color: Colors.black,
                                            ),
                                            hint: Text(
                                              'District',
                                              style: TextStyle(
                                                  fontSize: v * 0.0138),
                                            ),
                                            onChanged: (newValue) {
                                              setState(() {
                                                selectedDistrict = newValue;
                                              });
                                              print(
                                                  selectedDistrict!.districtId);
                                            },
                                            items: widget.districts.map<
                                                    DropdownMenuItem<
                                                        Districts>>(
                                                (Districts value) {
                                              return DropdownMenuItem<
                                                  Districts>(
                                                value: value,
                                                child: Text(
                                                  value.name,
                                                  style: TextStyle(
                                                      fontSize: v * 0.0138),
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
                              ErrorCatch(errorName: districtError)
                            ],
                          ),
                          SizedBox(
                            height: v * 0.023,
                          ),
                          MyTextField(
                              errorName: addressError,
                              controller: addressController,
                              text: "Address",
                              icon: FontAwesomeIcons.locationDot,
                              textInputType: TextInputType.streetAddress,
                              padding: 0),
                          SizedBox(
                            height: v * 0.023,
                          ),
                          MyTextField(
                            errorName: descError,
                            controller: descController,
                            text: "Description",
                            textInputType: TextInputType.text,
                            padding: 0,
                            height: v * 0.173,
                          ),
                          SizedBox(
                            height: v * 0.023,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  showAlertDialog(context);
                                },
                                child: Container(
                                  height: v * 0.0518,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: imageError.isEmpty
                                          ? null
                                          : Border.all(
                                              color: Colors.redAccent)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: h * 0.0365),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.upload,
                                          size: v * 0.023,
                                        ),
                                        SizedBox(
                                          width: h * 0.0365,
                                        ),
                                        SizedBox(
                                          width: h * 0.486,
                                          child: Text(
                                            maxLines: 1,
                                            imageName ?? "Upload",
                                            style: TextStyle(
                                                fontSize: v * 0.0138,
                                                color: Colors.black
                                                    .withOpacity(0.5)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: FaIcon(
                                              FontAwesomeIcons.camera,
                                              size: v * 0.023,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              ErrorCatch(errorName: imageError),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: v * 0.035, horizontal: h * 0.0486),
                  child: PrimryButton(
                      btntext: "Submit",
                      fontclr: Colors.white,
                      color: Color(0xff0084FF),
                      width: double.infinity,
                      isLoading: isLoading,
                      ontap: () {
                        print(box.get("username"));
                        submit(
                          selectedDistrict == null
                              ? ""
                              : selectedDistrict!.districtId,
                          addressController.text,
                          descController.text,
                          imageName ?? "",
                        );
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
