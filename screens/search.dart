import 'package:final_dart/screens/home_doc.dart';
import 'package:final_dart/screens/information.dart';
import 'package:final_dart/screens/logo.dart';
import 'package:final_dart/screens/patient_or_doctor.dart';
import 'package:flutter/material.dart';
import 'forgot_password.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var pages = <Widget>[
    PatientOrDoc(),
    Forgot_Password(),
    CancerGuide(),
    Logo(),
  ];
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Business',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: School',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 3: Settings',
  //     style: optionStyle,
  //   ),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey, // Fixed
        backgroundColor: Color(0xff82C4C3),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/doctor (2).png')),
            label: 'Doctors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Instructions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Cancer guide',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,

        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
