// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.hintText,
    this.icon,
    // this.imageIcon,
    required this.controller,
    required this.func,
    required this.type,
    this.changefunc,
  });
  //, @required this.keyboard
  String? hintText;
  TextEditingController controller = TextEditingController();
  String? Function(String?)? func;
  String? Function(String?)? changefunc;

  TextInputType? type;
  dynamic? icon;
  // ImageIcon? imageIcon;
  Text? keyboard;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: false,
      onChanged: changefunc,
      keyboardType: type,
      controller: controller,
      validator: func,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: icon,
        prefixIconColor: Color(0xff82C4C3),
        hintStyle: TextStyle(fontSize: 15, color: Color(0xffA0A0A0)),
        focusedBorder: OutlineInputBorder(
          gapPadding: 12,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Color(0xff82C4C3),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          gapPadding: 12,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Color(0xff82C4C3),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Color(0xff82C4C3),
          ),
        ),
      ),
    );
  }
}
