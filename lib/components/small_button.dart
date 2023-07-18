import 'package:flutter/material.dart';

class smallButton extends StatelessWidget {
  smallButton(
      {required this.text, required this.onPressed, required this.colortext,required this.colorbackground});
  Color colortext;
  Color colorbackground;
  String? text;
  VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(140, 60),
            backgroundColor: colorbackground,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: onPressed,
        child: Text(text!,
            style:  TextStyle(fontSize: 18, color: colortext)));
  }
}
