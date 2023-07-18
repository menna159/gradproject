import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class customcard extends StatelessWidget {
  customcard({required this.image, required this.text, required this.ontap});
  @override
  String? image;
  String? text;
  VoidCallback? ontap;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 150,
        height: 143.05,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 6,
          child: Column(
            children: [
              Image.asset(image!) // Image(
              //   image:// AssetImage(image!),
              //   width: 100,
              //   height: 150,
              // ),
              ,
              Text(
                text!,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
