import 'package:flutter/material.dart';
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/button.dart';
import '../../components/navbar.dart';
// import '../add_patient.dart';
// import '../allPatient.dart';
// import '../all_doctors.dart';
import '../components/bottomnav.dart';
import '../doctors_data.dart';
import 'forgot_password.dart';
// import '../home_doc.dart';
// import '../information.dart';
import 'package:image_picker/image_picker.dart';

class PatientOrDoc extends StatefulWidget {
  PatientOrDoc({super.key});

  @override
  State<PatientOrDoc> createState() => _PatientOrDocState();
}

class _PatientOrDocState extends State<PatientOrDoc> {
  SharedPreferences? typeperson;
  String? type;
  @override
  void initState() {
    super.initState();
    check_if_selected();
  }

  var pages = <Widget>[AllDocs(),AllDocs(),AllDocs(),AllDocs(),AllDocs()];
  int selectedIndexxxx = 0;
  int counter = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndexxxx = index;
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      bottomNavigationBar:
          Barr(onClicked: onItemTapped, selectedIndex: selectedIndexxxx),
      backgroundColor: Colors.white,
      body: counter == 0
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      // Container(
                      //   width: double.infinity,
                      //   // height: 200,
                      //   child: Text('Get Started',
                      //       style: TextStyle(
                      //         fontSize: 18,
                      //       )),
                      // ),
                      SizedBox(
                        width: 237,
                        height: 240,
                        child: Image.asset('images/Rectangle 1.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Text(
                          'Your doctor any time\n         any where',
                          style:
                              TextStyle(fontSize: 15, color: Color(0xffA0A0A0)),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Center(
                            child: Text(
                              'Sign as',
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xff777777)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      buttonn(
                          text: 'Patient',
                          onPressed: () {
                            typeperson?.setString('type', 'patient');

                            Navigator.pushNamed(context, '/signinpatient');
                          }),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                        'Or',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xff82C4C3)),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      buttonn(
                          text: 'Doctor',
                          onPressed: () {
                            typeperson?.setString('type', 'doctor');
                            Navigator.pushNamed(context, '/sign_updoc');
                          }),
                      SizedBox(
                        height: 57,
                      ),
                    ],
                  ),
                ],
              ))
          : pages[selectedIndexxxx],
    );
  }
  void check_if_selected() async {
  typeperson = await SharedPreferences.getInstance();
  type = (typeperson?.getString('type') ?? '');
}
}


