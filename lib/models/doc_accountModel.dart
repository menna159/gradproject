import 'package:flutter/material.dart';

class DocAccountModel {
  String id;
  int dId;
  String name;
  String username;
  String email;
  String password;
  String phone;
  String specialization;
  List<String> dates;
  String city;
  String token;

  DocAccountModel(
      {required this.id,
      required this.dId,
      required this.name,
      required this.username,
      required this.email,
      required this.password,
      required this.phone,
      required this.specialization,
      required this.dates,
      required this.city,
      required this.token});

  factory DocAccountModel.fromjson(Map<dynamic, dynamic> jsonData) {
    return DocAccountModel(
        id: jsonData["user"]["_id"],
        dId: jsonData["user"]["d_id"],
        name: jsonData["user"]["name"],
        username: jsonData["user"]["username"],
        email: jsonData["user"]["email"],
        password: jsonData["user"]["password"],
        phone: jsonData["user"]["phone"],
        specialization: jsonData["user"]["specialization"],
        dates: List<String>.from(jsonData["user"]["Dates"].map((x) => x)),
        city: jsonData["user"]["city"],
        token: jsonData["token"]);
  }
}
