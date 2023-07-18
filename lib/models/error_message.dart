import 'package:flutter/material.dart';

class errormessage {
  String? message;

  errormessage({this.message});
  factory errormessage.fromjson(Map<String, dynamic> jsonData) {
    return errormessage(
      message: jsonData['message'],
    );
  }
}
