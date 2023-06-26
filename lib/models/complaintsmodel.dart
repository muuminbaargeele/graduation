// To parse this JSON data, do
//
//     final complaints = complaintsFromJson(jsonString);

import 'dart:convert';

List<Complaints> complaintsFromJson(String str) => List<Complaints>.from(json.decode(str).map((x) => Complaints.fromJson(x)));

String complaintsToJson(List<Complaints> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Complaints {
    final String compId;
    final DateTime dateTime;
    final String compDesc;
    final String compImg;
    final String address;
    final String ctname;
    final String compTypeDisc;
    final String dname;
    final String sname;
    final String statusDesc;
    final String hexCode;

    Complaints({
        required this.compId,
        required this.dateTime,
        required this.compDesc,
        required this.compImg,
        required this.address,
        required this.ctname,
        required this.compTypeDisc,
        required this.dname,
        required this.sname,
        required this.statusDesc,
        required this.hexCode,
    });

    factory Complaints.fromJson(Map<String, dynamic> json) => Complaints(
        compId: json["CompID"],
        dateTime: DateTime.parse(json["Date_Time"]),
        compDesc: json["Comp_desc"],
        compImg: json["Comp_img"],
        address: json["Address"],
        ctname: json["ctname"],
        compTypeDisc: json["Comp_type_disc"],
        dname: json["dname"],
        sname: json["sname"],
        statusDesc: json["Status_desc"],
        hexCode: json["Hex_code"],
    );

    Map<String, dynamic> toJson() => {
        "CompID": compId,
        "Date_Time": dateTime.toIso8601String(),
        "Comp_desc": compDesc,
        "Comp_img": compImg,
        "Address": address,
        "ctname": ctname,
        "Comp_type_disc": compTypeDisc,
        "dname": dname,
        "sname": sname,
        "Status_desc": statusDesc,
        "Hex_code": hexCode,
    };
}
