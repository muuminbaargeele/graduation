// To parse this JSON data, do
//
//     final complaintTypes = complaintTypesFromJson(jsonString);

import 'dart:convert';

List<ComplaintTypes> complaintTypesFromJson(String str) => List<ComplaintTypes>.from(json.decode(str).map((x) => ComplaintTypes.fromJson(x)));

String complaintTypesToJson(List<ComplaintTypes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ComplaintTypes {
    final String compTypeId;
    final String name;
    final String compTypeDisc;
    final String titleId;

    ComplaintTypes({
        required this.compTypeId,
        required this.name,
        required this.compTypeDisc,
        required this.titleId,
    });

    factory ComplaintTypes.fromJson(Map<String, dynamic> json) => ComplaintTypes(
        compTypeId: json["CompTypeID"],
        name: json["Name"],
        compTypeDisc: json["Comp_type_disc"],
        titleId: json["TitleID"],
    );

    Map<String, dynamic> toJson() => {
        "CompTypeID": compTypeId,
        "Name": name,
        "Comp_type_disc": compTypeDisc,
        "TitleID": titleId,
    };
}
