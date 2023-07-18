import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Features extends StatelessWidget {
  Features(
      {this.ontap,
      required this.width,
      required this.height,
      required this.image});
  double? height;
  double? width;
  String? image;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  ontap,
       // Navigator.of(context).pushReplacementNamed('/logo');
       
     
      child: Image.asset(
        '$image',
        width: width,
        height: height,
      ),
    );
  }
}