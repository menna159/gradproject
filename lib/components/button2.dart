import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class button2 extends StatelessWidget {
   button2({required this.textt,required this.tcolor,required this.bcolor, required this.widthh});
String textt;
int tcolor;
double widthh;
int bcolor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(textt,style: TextStyle(color: Color(tcolor),fontSize: 17),),
      onPressed: () {
        
      },
      style: ElevatedButton.styleFrom(
         fixedSize: Size(widthh ??150, 40),
         backgroundColor: Color(bcolor)
      ),
    );
  }
}