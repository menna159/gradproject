import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";
import '../screens/add_patient.dart';
import '../screens/allPatient.dart';
import '../screens/all_doctors.dart';
import '../screens/authentication/forgot_password.dart';
import '../screens/home_doc.dart';
import '../screens/information.dart';
import '../screens/authentication/patient_or_doctor.dart';

class Barr extends StatelessWidget {
  Barr({this.selectedIndex, this.onClicked});
  final selectedIndex;
  ValueChanged<int>? onClicked;
  @override
  Widget build(BuildContext context) {
    var pages = <Widget>[AllDocs(), CancerGuide(), allPatient(), addPatient()];
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: Color(0xff82C4C3),
        unselectedItemColor: Colors.grey, // Fixed
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/doctor (3) 1.png',
              width: 24,
              height: 24,
            ),
            label: 'Doctors',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/scanner.png',
              width: 24,
              height: 24,
            ),
            // icon: Icon(Icons.qr_code_scanner),
            label: 'scan',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/chatbot (8).png',
              width: 24,
              height: 24,
            ),
            label: 'Chat bot',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/manual-book 1.png',
              width: 24,
              height: 24,
            ),
            label: 'Cancer guide',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/chat (1) 1.png',
              width: 24,
              height: 24,
            ),
            label: 'Ask doctor',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onClicked);
  }
}
