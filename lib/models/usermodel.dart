// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    final String name;
    final String gmail;
    final String username;
    final String phone;
    final String gender;
    final String dname;

    User({
        required this.name,
        required this.gmail,
        required this.username,
        required this.phone,
        required this.gender,
        required this.dname,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["Name"],
        gmail: json["Gmail"],
        username: json["Username"],
        phone: json["Phone"],
        gender: json["Gender"],
        dname: json["dname"],
    );

    Map<String, dynamic> toJson() => {
        "Name": name,
        "Gmail": gmail,
        "Username": username,
        "Phone": phone,
        "Gender": gender,
        "dname": dname,
    };
}
