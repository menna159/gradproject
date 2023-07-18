import 'package:final_dart/components/navbar_pathient.dart';
import 'package:final_dart/screens/cubits/cubit/auth_cubit.dart';
import 'package:final_dart/screens/cubits/cubit/cubit/cubit/cubit/cubit/all_doctor_cubit.dart';
import 'package:final_dart/screens/druggg1.dart';
import 'package:final_dart/screens/information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../components/bottomnav.dart';
import '../doctors_data.dart';

import '../components/features_containers.dart';
import '../components/floatbottom.dart';
import '../components/navbar.dart';

import 'allPatient.dart';

class Home_pat extends StatefulWidget {
  Home_pat({super.key});

  @override
  State<Home_pat> createState() => _Home_patState();
}

class _Home_patState extends State<Home_pat> {
  var pages = <Widget>[AllDocs(), CancerGuide(), allPatient(), AllDocs()];
  int selectedIndexxxx = 0;
  int counter = 0;
  void onItemTapped(int index) async {
    await BlocProvider.of<AllDoctorCubit>(context).alldoctor();
    setState(() {
      selectedIndexxxx = index;
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentwidth = MediaQuery.of(context).size.width;

    return BlocBuilder<AllDoctorCubit, AllDoctorState>(
      builder: (context, state) {
        if(state is Logincubitloading){
          return Center(child: CircularProgressIndicator());
        }
        // else if(State is Logincubitsuccess){
        //  return drugforpatient();
        // }
        else{
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'Home',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            iconTheme: IconThemeData(color: Colors.black),
            shadowColor: Colors.transparent,
            backgroundColor: Colors.white,
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: floatingButton(),
          ),
          bottomNavigationBar:
              Barr(onClicked: onItemTapped, selectedIndex: selectedIndexxxx),
          endDrawer: Navbar_Patient(context,name: 'mennnaaa'),
          body: counter == 0
              ? ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, '/personal_info_to_pat'),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 2,
                                  ),
                                  child: Container(
                                    width: 350,
                                    height: 180,
                                    child: Image.asset(
                                      'images/personal information.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Features(
                                    ontap: () async{
                                     await BlocProvider.of<AuthCubit>(context).showtreatmentsDoc('64b29405d4939192bdc0d374');
                                     Navigator.pushNamed(context, '/drugpatient');
                                    },
                                    image: 'images/Drugs.png',
                                    width: 168,
                                    height: 170,
                                  ),
                                  Features(
                                    image: 'images/Reminder.png',
                                    width: 168,
                                    height: 220,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Features(
                                    ontap: () {
                                      Navigator.pushNamed(context, '/abnormal');
                                    },
                                    image: 'images/abnormal_sym.png',
                                    width: 168,
                                    height: 220,
                                  ),
                                  Features(
                                    ontap: () async {
                                      await canLaunchUrlString(
                                          'https://m.facebook.com/groups/265896269416146/?ref=share&mibextid=NSMWBT');

                                      await launchUrlString(
                                          'https://m.facebook.com/groups/265896269416146/?ref=share&mibextid=NSMWBT');
                                    },
                                    image: 'images/Ask_doctor.png',
                                    width: 168,
                                    height: 170,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 220, left: 225),
                            child: Image.asset(
                              'images/1.jpg',
                              width: 105,
                              height: 100,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : pages[selectedIndexxxx],
        );
      }},
    );
  }
}
