import 'package:flutter/material.dart';

class buttonn extends StatelessWidget {
  buttonn({required this.text, required this.onPressed ,this.width});
    double? width;

  String? text;
  VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(317, 60),
            backgroundColor: const Color(0xff82C4C3),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: onPressed,
        child:
            Text(text!, style: const TextStyle(fontSize: 18, color: Colors.white)));
  }
}
