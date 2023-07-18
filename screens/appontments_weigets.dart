import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
 
class Cancelled extends StatelessWidget {
  const Cancelled();
   
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset(
                      'images/udikdoido.png',
                    ),
                  ),
                  title: Text(
                    'Appointment Cancelled!',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 14),
                  child: Text(
                    'An appointment with Nada mohamed has been cancelled on monday',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff787B80)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 1,
                  indent: 13,
                  endIndent: 13,
                  color: Color.fromARGB(255, 182, 185, 189),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class New_appointments extends StatelessWidget {
   New_appointments({required this.name, required this.day});
dynamic? day;
 dynamic? name;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset(
                      'images/cifoiyo.png',
                    ),
                  ),
                  title: Text(
                    'New appointment',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 14),
                  child: Text(
                    'You have appointment with $name on $day',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff787B80)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 1,
                  indent: 13,
                  endIndent: 13,
                  color: Color.fromARGB(255, 182, 185, 189),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
