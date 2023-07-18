import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:vital_care/cubits/authh_cubit/auth_cubit.dart';
import 'package:vital_care/cubits/profil_doc_cubit/edit_profile_cubit_cubit.dart';
import 'package:vital_care/models/doc_accountModel.dart';
import 'dart:io' as io;

import '../components/show_snack_bar.dart';
import '../components/small_button.dart';
import '../components/textfield.dart';
import '../cubits/patientt_cubit/patient_cubit.dart';

class addPatient extends StatefulWidget {
  const addPatient({super.key});

  @override
  State<addPatient> createState() => _addPatientState();
}

class _addPatientState extends State<addPatient> {
  bool isLoading = false;
  String? file_path;
  dynamic? gender;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController treatment = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController? Date = TextEditingController();
  TextEditingController cancertype = TextEditingController();
  TextEditingController diagnosis = TextEditingController();
  TextEditingController Abnormal_syptoms = TextEditingController();
  TextEditingController Notes = TextEditingController();
  TextEditingController age = TextEditingController();

  TextEditingController Additional_information = TextEditingController();
  final image_picker = ImagePicker();
  List<XFile>? images;
  dynamic image;
  final _formkey = GlobalKey<FormState>();
  uploadImage() async {
    var pickedimage = await image_picker.pickImage(source: ImageSource.gallery);
    print(image);
    if (pickedimage != null) {
      // getting a directory path for saving

// copy the file to a new path

      setState(() {
        // image = File(pickedimage.path);
        image = File(pickedimage.path);
        print(image);
      });
    } else {
      image = 'images/Rectangle 3332.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);

    return BlocConsumer<PatientCubit, addPatientState>(
      listener: (context, state) {
        if (state is addPatientloading) {
          isLoading = true;
        } else if (state is addPatientsuccess) {
          // ShowSnackbar(context, BlocProvider.of<PatientCubit>(context).error);
          ShowSnackbar(context, 'patient added successfuly!');

          // ShowSnackbar(context, BlocProvider.of<PatientCubit>(context).msssssg);
          Navigator.pushNamed(context, '/allPatient');
          isLoading = false;
        } else if (state is addPatientfailure) {
          // ShowSnackbar(context, BlocProvider.of<PatientCubit>(context).error);
          ShowSnackbar(context, 'An error occured!');

          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Form(
              key: _formkey,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                ),
                body: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 19, right: 19),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Add Patient',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: textfield(
                              h: 3,
                              func: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter the correct name please';
                                } else {
                                  return null;
                                }
                              },
                              input: fullname,
                              type: TextInputType.name,
                              text: 'Full name',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                          SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: textfield(
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 6) {
                                  return 'Enter the correct user name please';
                                } else {
                                  return null;
                                }
                              },
                              h: 3,
                              input: username,
                              type: TextInputType.name,
                              text: 'User name',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                          SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: textfield(
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !value.endsWith('.com')) {
                                  return 'Enter the correct email please';
                                } else {
                                  return null;
                                }
                              },
                              h: 3,
                              input: email,
                              type: TextInputType.emailAddress,
                              text: 'Email',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                          SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: textfield(
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 6) {
                                  return 'Enter the correct password please';
                                } else {
                                  return null;
                                }
                              },
                              h: 3,
                              input: password,
                              type: TextInputType.visiblePassword,
                              text: 'Password',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                          SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: textfield(
                              func: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter the correct phone please';
                                } else {
                                  return null;
                                }
                              },
                              h: 3,
                              input: phone,
                              type: TextInputType.phone,
                              text: 'Phone',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                          SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: textfield(
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return 'Enter the correct cancer type please';
                                } else {
                                  return null;
                                }
                              },
                              h: 3,
                              input: cancertype,
                              type: TextInputType.text,
                              text: 'Cancer Type',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                          SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: textfield(
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return 'Enter the correct diagnosis please';
                                } else {
                                  return null;
                                }
                              },
                              h: 3,
                              input: diagnosis,
                              type: TextInputType.text,
                              text: 'Diagnosis',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                          SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: textfield(
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return 'Enter the correct treatment please';
                                } else {
                                  return null;
                                }
                              },
                              h: 3,
                              type: TextInputType.text,
                              input: treatment,
                              text: 'Treatment',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                          SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: textfield(
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return 'Enter the correct notes please';
                                } else {
                                  return null;
                                }
                              },
                              h: 3,
                              input: Notes,
                              type: TextInputType.text,
                              text: 'Notes',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                          SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: textfield(
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return 'Enter the correct Abnormal_syptoms please';
                                } else {
                                  return null;
                                }
                              },
                              h: 3,
                              input: Abnormal_syptoms,
                              type: TextInputType.text,
                              text: 'Abnormal syptoms ',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                          SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: textfield(
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return 'Enter the correct Abnormal_syptoms please';
                                } else {
                                  return null;
                                }
                              },
                              h: 3,
                              input: Additional_information,
                              type: TextInputType.text,
                              text: 'Additional information',
                              width: 313.37,
                              height: 56.76,
                            ),
                          ),
                          SizedBox(
                            height: 19,
                          ),
                          SizedBox(
                            width: query.size.width,
                            child: Row(
                              children: [
                                textfield(
                                  func: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 2) {
                                      return 'Enter the correct age please';
                                    } else {
                                      return null;
                                    }
                                  },
                                  h: 3,
                                  input: age,
                                  type: TextInputType.number,
                                  text: 'Age',
                                  width: 140,
                                  height: 60,
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                textfield(
                                  func: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter the correct date please';
                                    } else {
                                      return null;
                                    }
                                  },
                                  h: 3,
                                  input: Date!,
                                  type: TextInputType.datetime,
                                  text: 'Date',
                                  width: 140,
                                  height: 60,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RadioListTile(
                                title: Text("Male"),
                                value: "male",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                              RadioListTile(
                                title: Text("Female"),
                                value: "female",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 68,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 19, bottom: 30),
                          child: smallButton(
                              text: 'Cancel',
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              colortext: const Color(0xff82C4C3),
                              colorbackground: Colors.white),
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15, bottom: 30),
                          child: smallButton(
                              text: 'Save',
                              onPressed: () async {
                                // print(image);
                                if (_formkey.currentState!.validate()) {
                                  DocAccountModel doctor;
                                  BlocProvider.of<PatientCubit>(context)
                                      .addpatient(
                                    // doctor_id: doctor.id,
                                    // doctor_id: '9',
                                    doctor_id:
                                        BlocProvider.of<AuthCubit>(context)
                                            .doctor_id,
                                    fullname: fullname.text,
                                    username: username.text,
                                    email: email.text,
                                    password: password.text,
                                    phone: phone.text,
                                    age: age.text,
                                    cancertype: cancertype.text,
                                    diagnosis: diagnosis.text,
                                    // date: Date?.text,
                                    Abnormal_syptoms: Abnormal_syptoms.text,
                                    Additional_information:
                                        Additional_information.text,
                                    treatment: treatment.text,
                                    notes: Notes.text,
                                    gender: gender.toString(),
                                  );
                                  print(BlocProvider.of<AuthCubit>(context)
                                      .doctor_id);
                                  print(gender);
                                  // BlocProvider.of<PatientCubit>(context)
                                  //     .uploadImage1(imageFile: image!);
                                  // print(BlocProvider.of<AuthCubit>(context)
                                  //     .docc
                                  //     ?.id);
                                }
                              },
                              colortext: Colors.white,
                              colorbackground: const Color(0xff82C4C3)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
