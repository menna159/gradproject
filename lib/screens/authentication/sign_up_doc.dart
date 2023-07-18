import 'dart:core';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vital_care/models/doc_accountModel.dart';

import '../../components/button.dart';
import '../../components/text_form_field.dart';
import 'package:http/http.dart' as http;
// import 'package:http/http.dart'as;
import 'package:flutter/material.dart';

import '../../components/show_snack_bar.dart';
import '../../cubits/authh_cubit/auth_cubit.dart';

class SignUp_doc extends StatefulWidget {
  @override
  State<SignUp_doc> createState() => _SignUp_docState();
}

SharedPreferences? logindata;
String? email;

class _SignUp_docState extends State<SignUp_doc> {
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    email = logindata?.getString('email');
  }

  @override
  final _formkey = GlobalKey<FormState>();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController namecontroller = TextEditingController();

  TextEditingController usernamecontroller = TextEditingController();

  TextEditingController specializationcontroller = TextEditingController();

  TextEditingController phonecontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();

  TextEditingController datescontroller = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is signuploadingdoc) {
          isLoading = true;
        } else if (state is signupSuccessdoc) {
          Navigator.pushNamed(context, '/login_doc');
          isLoading = false;
        } else if (state is signupFailuredoc) {
          ShowSnackbar(context, BlocProvider.of<AuthCubit>(context).error);

          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                // foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              body: Form(
                key: _formkey,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 10, left: 18, bottom: 17),
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: 'Inter'),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 21.0, right: 22.0),
                          child: SizedBox(
                              width: query.size.width,
                              child: CustomTextField(
                                controller: namecontroller,
                                func: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please enter the name';
                                  } else {
                                    return null;
                                  }
                                },
                                type: TextInputType.name,
                                hintText: 'Full name',
                                icon: Icon(Icons.person),
                              )),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 21.0, right: 22.0),
                          child: SizedBox(
                              width: query.size.width,
                              child: CustomTextField(
                                controller: usernamecontroller,
                                func: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length < 6) {
                                    return 'Enter the user name please';
                                  } else {
                                    return null;
                                  }
                                },
                                type: TextInputType.name,
                                hintText: 'user name',
                                icon: Icon(Icons.person),
                              )),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 21.0, right: 22.0),
                          child: SizedBox(
                            width: query.size.width,
                            child: CustomTextField(
                              controller: emailcontroller,
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !value.endsWith('.com')) {
                                  return 'wrong email';
                                } else {
                                  return null;
                                }
                              },
                              type: TextInputType.emailAddress,
                              hintText: 'Email',
                              icon: Icon(Icons.email),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 21.0, right: 22.0),
                          child: SizedBox(
                            width: query.size.width,
                            child: CustomTextField(
                              controller: passwordcontroller,
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 6) {
                                  return 'wrong password';
                                } else {
                                  return null;
                                }
                              },
                              type: TextInputType.visiblePassword,
                              hintText: 'Password',
                              icon: Icon(Icons.lock),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 22, right: 21),
                            child: CustomTextField(
                              controller: specializationcontroller,
                              func: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your specialization please';
                                } else {
                                  return null;
                                }
                              },
                              type: TextInputType.name,
                              hintText: 'Specialization',
                              icon: ImageIcon(
                                  AssetImage('images/doctor (3) 1.png')),
                            )),
                        SizedBox(
                          height: 9,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 22, right: 21),
                            child: CustomTextField(
                              controller: phonecontroller,
                              func: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your correct phone please';
                                } else {
                                  return null;
                                }
                              },
                              type: TextInputType.phone,
                              hintText: 'phone',
                              icon: Icon(Icons.phone),
                            )),
                        SizedBox(
                          height: 9,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 22, right: 21),
                            child: CustomTextField(
                              controller: datescontroller,
                              func: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your correct date please';
                                } else {
                                  return null;
                                }
                              },
                              type: TextInputType.datetime,
                              hintText: 'Date',
                              icon: Icon(Icons.date_range),
                            )),
                        SizedBox(
                          height: 9,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 22, right: 21),
                            child: CustomTextField(
                              controller: citycontroller,
                              func: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your city please';
                                } else {
                                  return null;
                                }
                              },
                              type: TextInputType.name,
                              hintText: 'City',
                              icon: Icon(Icons.location_city_rounded),
                            )),
                        const SizedBox(
                          height: 22,
                        ),
                        buttonn(
                            text: ('Sign up'),
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                dynamic response =
                                    BlocProvider.of<AuthCubit>(context)
                                        .SignUpDoc(
                                            namecontroller.text,
                                            usernamecontroller.text,
                                            emailcontroller.text,
                                            passwordcontroller.text,
                                            phonecontroller.text,
                                            specializationcontroller.text,
                                            datescontroller.text,
                                            citycontroller.text);

                                // if (response['token'] != null) {
                                //   BlocProvider.of<AuthCubit>(context).docc =
                                //       DocAccountModel.fromjson(response);
                                // }
                              }
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Or sign by',
                          style: TextStyle(color: Color(0xff82C4C3)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: (Image.asset('images/Google.png')),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            SizedBox(
                                height: 24,
                                width: 24,
                                child: Image.asset(
                                  'images/Circle.png',
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      'Already have an account?',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffA0A0A0),
                                          fontFamily: 'Inter'),
                                    ),
                                    Text(
                                      'sign in',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff82C4C3),
                                          fontFamily: 'Inter'),
                                    ),
                                  ],
                                ),
                              ),
                              onPressed: () {
                                print(email);

                                email != null
                                    ? Navigator.pushNamed(context, '/home_doc')
                                    : Navigator.pushNamed(
                                        context, '/login_doc');
                              },
                            )
                          ],
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //     left: 257,
                        //   ),
                        //   child: SizedBox(
                        //       width: 105,
                        //       height: 83.49,
                        //       child: Image.asset('images/1.jpg')),
                        // ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: SizedBox(
                                height: 92,
                                width: 105,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Image.asset('images/1.jpg'),
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
