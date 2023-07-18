import 'dart:core';
import 'dart:convert';

import 'package:final_dart/models/doc_accountModel.dart';
import 'package:final_dart/screens/home_doc.dart';
//import 'package:final_dart/providers/docproviders.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/button.dart';
import '../components/text_form_field.dart';
import 'package:final_dart/components/button.dart';
import 'package:http/http.dart' as http;
// import 'package:http/http.dart'as;
import 'package:flutter/material.dart';

class SignUp_doc extends StatefulWidget {
  const SignUp_doc({super.key});

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
  void initial()async {
     
      logindata= await SharedPreferences.getInstance();
      email=logindata?.getString('email');
    
  }

  Future<http.Response> Createuser(
      String name, String username, String email, String password,String phone,String specialization,String dates) {
    return http.post(
      Uri.parse('https://baby-blue-salmon-toga.cyclic.app/doctor/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'username': username,
        "email": email,
        "password": password,
        "phone":phone,
        "specialization":specialization,
        "Dates":dates
      }),
    );
  }

  @override
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController specializationcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController datescontroller = TextEditingController();

 
  @override
  Widget build(BuildContext context) {
   
    
   
    MediaQueryData query = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(shadowColor: Colors.transparent,backgroundColor:Colors.transparent,),
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
                      padding: EdgeInsets.only(top: 64, left: 18, bottom: 17),
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
                  padding: const EdgeInsets.only(left: 21.0, right: 22.0),
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
                  padding: const EdgeInsets.only(left: 21.0, right: 22.0),
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
                      icon: ImageIcon(AssetImage('images/doctor (3) 1.png')),
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
                          return 'Enter your correct phone please';
                        } else {
                          return null;
                        }
                      },
                      type: TextInputType.datetime,
                      hintText: 'Date',
                      icon: Icon(Icons.date_range),
                    )),
                const SizedBox(
                  height: 22,
                ),
                buttonn(
                    text: ('Sign up'),
                    onPressed: () async{
                      if (_formkey.currentState!.validate()) {
                        
                            http.Response response = await Createuser(
                      namecontroller.text,usernamecontroller.text,emailcontroller.text,passwordcontroller.text,phonecontroller.text,specializationcontroller.text,datescontroller.text);
                  var mn = response.body;
                  print(mn);
    //                        DocAccountModel docc=DocAccountModel(name: namecontroller.text,
    //  username: usernamecontroller.text, 
    //  email: emailcontroller.text, 
    //  password: passwordcontroller.text, 
    //  specialization: specializationcontroller.text, 
    //  phone: phonecontroller.text,
    //   date: datescontroller.text);
    //   Provider.of<docproviders>(context,listen: false).docdata=docc;
    //   print(Provider.of<docproviders>(context,listen: false).docdata!.phone);
    //                      Navigator.of(context)
    //                         .pushReplacementNamed('/view');
                       
                        
                       
                   
                       
                      }
                    }),
                //   http.Response response = await Createuser(
                //       namecontroller.text,
                //       usernamecontroller.text,
                //       emailcontroller.text,
                //       passwordcontroller.text);
                //   var mn = response.body;
                //   print(mn);
                //   print(mn.runtimeType);
                // }),
                Row(
                  children: [
                    TextButton(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 85, top: 69),
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
                       email!=null?Navigator.pushNamed(context,'/home_doc'):Navigator.pushNamed(context,'/login_doc');
                      },
                    )
                  ],
                ),
                Align(alignment: Alignment.bottomRight,
                child: SizedBox(height: 92,width: 105,child: Image.asset('images/note(1).png'))),
              ],
            ),
          ],
        ),
      )
    );
  }
}
