import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/button.dart';
import '../../components/show_snack_bar.dart';
import '../../components/text_form_field.dart';
import '../../cubits/authh_cubit/auth_cubit.dart';
import '../../models/doc_accountModel.dart';
import '../home_doc.dart';

class Signin_doc extends StatefulWidget {
  @override
  State<Signin_doc> createState() => _Signin_docState();
}

class _Signin_docState extends State<Signin_doc> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();
  SharedPreferences? logindata;
  bool? newuser;

  @override
  void initState() {
    super.initState();
    check_already_login();
    print('ok');
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();

    bool isLoading = false;

    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        if (state is Loginloadingdoc) {
          isLoading = true;
        } else if (state is LoginSuccessdoc) {
          Navigator.pushNamed(context, '/home_doc');
          isLoading = false;
        } else if (state is LoginFailuredoc) {
          ShowSnackbar(context, BlocProvider.of<AuthCubit>(context).error);

          isLoading = false;
        }
      }, builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'Welcome Back',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          body: ListView(children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 21.0, right: 22.0),
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
                    padding: const EdgeInsets.only(left: 21.0, right: 22.0),
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
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: TextButton(
                          child: Text(
                            'Forget password?',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff82C4C3),
                                fontFamily: 'Inter'),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/forget_pass');
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  buttonn(
                    text: 'Sign in',
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        dynamic response =
                            await BlocProvider.of<AuthCubit>(context).Logindoc(
                                email: emailcontroller.text,
                                password: passwordcontroller.text);
                        //BlocProvider.of<AuthCubit>(context).docc?.tokennn=response['token'];
                        if (response['token'] != null) {
                          BlocProvider.of<AuthCubit>(context).docc =
                              DocAccountModel.fromjson(response);
                          dynamic email = emailcontroller.text.toString();
                          dynamic password = passwordcontroller.text.toString();

                          logindata?.setBool('login', false);
                          logindata?.setString('email', email);
                          print(logindata?.getString('email'));
                          print(
                              BlocProvider.of<AuthCubit>(context).docc?.email);
                                print(
                              BlocProvider.of<AuthCubit>(context).docc?.id);
                        }
                        //BlocProvider.of<AuthCubit>(context).tokenn=response['token'];
                        // Map<String, dynamic> dataa = jsonDecode(response.body);

                        //dynamic taa=BlocProvider.of<LogincubitCubit>(context).tokenn;
                        //BlocProvider.of<AuthCubit>(context).tokenn=dataa['token'];
                        print(response);
                        // var mn = response.body;

                        // BlocProvider.of<LogincubitCubit>(context).tokenn=mn['token'];
                        // print(response);
                      }
                    },
                  ),
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
                  SizedBox(
                    height: 140,
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                          height: 92,
                          width: 105,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Image.asset(
                              'images/1.jpg',
                              height: 92,
                              width: 105,
                            ),
                          ))),
                ],
              ),
            ),
          ]),
        );
      });
    });
  }

  void check_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata?.getBool('login') ?? true);
    //print(newuser);
  }

  void dipose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }
}
