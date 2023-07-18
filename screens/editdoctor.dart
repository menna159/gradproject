
import 'package:final_dart/screens/cubits/cubit/cubit/cubit/cubit/cubit/all_doctor_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:final_dart/components/button.dart';
import 'package:final_dart/components/button2.dart';
//import 'package:final_dart/components/textfield%20(2).dart';
import 'package:flutter/material.dart';

import '../components/txt.dart';
import 'cubits/cubit/appointment_cubit.dart';
import 'cubits/cubit/auth_cubit.dart';
import 'cubits/cubit/edit_profile_cubit_cubit.dart';

//import 'package:horizontal_calendar/horizontal_calendar.dart';
DateTime? dateTime;
String? dateform;

//  dynamic? id;
//  dynamic? spechi;
//  dynamic? name;
//   dynamic? city;
//  dynamic? phonee;
class editdoctor extends StatefulWidget {
  editdoctor({super.key});

  @override
  State<editdoctor> createState() => _editdoctorState();
}

class _editdoctorState extends State<editdoctor> {
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    //dateform= DateFormat('EEE').format(dateTime!);
    MediaQueryData query = MediaQuery.of(context);
bool isLoading = false;
    //bool select=false;
    //int days = 10;
    TextEditingController namecontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController specializationcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController from_controller = TextEditingController();
  TextEditingController to_controller = TextEditingController();
  TextEditingController city_controller = TextEditingController();
  TextEditingController dates_controller = TextEditingController();
    final _formkey = GlobalKey<FormState>();
return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(children: [
              Card(
                child: Image.asset(
                  'images/Vector 2.png',
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                clipBehavior: Clip.antiAlias,
              ),
              SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Stack(children: [
                      Card(
                        color: Color(0XffF5F5F5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        clipBehavior: Clip.antiAlias,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
  SizedBox(
                                  height: 12,
                                ),
                                SizedBox(
                                    width: query.size.width,
                                    // ignore: missing_required_param
                                    child: textfield(
                                      // h: 5,
                                      h: 3,
                                      width: 316,
                                      height: 60,
                                      input: namecontroller,
                                      func: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'please enter the name';
                                        } else {
                                          return null;
                                        }
                                      },
                                      text: 'Name',
                                      type: TextInputType.name,
                                    )),
                                SizedBox(
                                  height: 9,
                                ),
                                SizedBox(
                                    width: query.size.width,
                                    child: textfield(
                                      // h: 5,
                                      h: 3,

                                      width: 316,
                                      height: 60,
                                      input: usernamecontroller,
                                      func: (value) {
                                        if (value == null 
                                            ||value.isEmpty 
                                           || value.length < 6) {
                                          return 'Enter the user name please';
                                        } else {
                                          return null;
                                        }
                                      },
                                      text: 'User name',
                                      type: TextInputType.name,
                                    )),
                                SizedBox(
                                  height: 9,
                                ),
                                textfield(
                                  input: specializationcontroller,
                                  func: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter your specialization please';
                                    } else {
                                      return null;
                                    }
                                  },
                                  type: TextInputType.name,
                                  text: 'Specialization',
                                  h: 3, width: 316,
                                  height: 60,
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                textfield(
                                  input: addresscontroller,
                                  func: (value) {
                                    if (value == null ||value.isEmpty) {
                                      return 'Enter your correct address please';
                                    } else {
                                      return null;
                                    }
                                  },
                                  type: TextInputType.streetAddress,
                                  text: 'Address',
                                  h: 3,

                                  // h: 5,
                                  width: 316,
                                  height: 60,
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                textfield(
                                  input: city_controller,
                                  func: (value) {
                                    if (value == null  ||value.isEmpty) {
                                      return 'Enter your correct city please';
                                    } else {
                                      return null;
                                    }
                                  },
                                  type: TextInputType.text,
                                  text: 'City',
                                  h: 3,

                                  // h: 5,
                                  width: 316,
                                  height: 60,
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 22, right: 21),
                                    child: textfield(
                                      // h: 5,
                                      width: 316,
                                      h: 3,

                                      height: 60,
                                      input: phonecontroller,
                                      func: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter your correct phone please';
                                        } else {
                                          return null;
                                        }
                                      },
                                      type: TextInputType.phone,
                                      text: 'Phone',
                                    )),
                                SizedBox(
                                  height: 9,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 22, right: 21),
                                    child: textfield(
                                        input: dates_controller,
                                        func: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Enter your correct dates please';
                                          } else {
                                            return null;
                                          }
                                        },
                                        h: 3,width: 316,
                                        height: 60,
                                        type: TextInputType.text,
                                        text: 'Dates')),
                                SizedBox(
                                  height: 9,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                          left: 22,
                                        ),
                                        child: textfield(
                                          h: 3,

                                          // h: 5,
                                          height: 60,
                                          input: from_controller,
                                          type: TextInputType.datetime,
                                          text: 'Start time',
                                          func: (value) {
                                            if (value == null ||  value.isEmpty) {
                                              return 'please enter correct Start time';
                                            } else {
                                              return null;
                                            }
                                          },
                                          width: 141,
                                        )),
                                    // SizedBox(
                                    //   width: 12,
                                    // ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(right: 19),
                                        child: textfield(
                                          // h: 5,
                                          h: 3,
                                          width: 141,
                                          height: 60,
                                          input: to_controller,
                                          type: TextInputType.datetime,
                                          text: 'End time',
                                          func: (value) {
                                            if (value == null 
                                                ||value.isEmpty) {
                                              return 'please enter correct end time';
                                            } else {
                                              return null;
                                            }
                                          },
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 25),
                                  child: buttonn(
                                      text: 'save',
                                      onPressed: () {
                                        if (_formkey.currentState!.validate()) {
                                          //
                                          BlocProvider.of<
                                                      EditProfileCubitCubit>(
                                                  context)
                                              .Edit_profile(
                                                  doc_id: BlocProvider.of<AuthCubit>(context)
                                                      .docc?.id,
                                                  name: namecontroller.text,
                                                  username:
                                                      usernamecontroller.text,
                                                  phone: phonecontroller.text,
                                                  specialization:
                                                      specializationcontroller
                                                          .text,
                                                  dates: dates_controller.text,
                                                  city_name:
                                                      city_controller.text);
                                        }
                                      }),
                                )
                              ],
                            ),
                          )
                        ]),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 500),
                      child: Center(
                          child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.asset(
                                'images/doctor (2).png',
                              )))),
                ]),
              );
  }
}




             