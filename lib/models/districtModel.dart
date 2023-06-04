// To parse this JSON data, do
//
//     final districts = districtsFromJson(jsonString);

import 'dart:convert';

List<Districts> districtsFromJson(String str) => List<Districts>.from(json.decode(str).map((x) => Districts.fromJson(x)));

String districtsToJson(List<Districts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Districts {
    final String districtId;
    final String name;
    final String depId;

    Districts({
        required this.districtId,
        required this.name,
        required this.depId,
    });

    factory Districts.fromJson(Map<String, dynamic> json) => Districts(
        districtId: json["DistrictID"],
        name: json["Name"],
        depId: json["DepID"],
    );

    Map<String, dynamic> toJson() => {
        "DistrictID": districtId,
        "Name": name,
        "DepID": depId,
    };
}
