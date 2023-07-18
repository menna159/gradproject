import 'dart:convert';
import 'dart:io';
import 'package:final_dart/components/button.dart';
import 'package:final_dart/components/navbar.dart';
import 'package:final_dart/components/navbar_pathient.dart';
import 'package:final_dart/models/doc_accountModel.dart';
import 'package:final_dart/models/signin_docModel.dart';
import 'package:final_dart/screens/cubits/cubit/auth_cubit.dart';
                                           import 'package:final_dart/screens/home_doc.dart';
import 'package:final_dart/screens/home_docc.dart';
import 'package:final_dart/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
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
    
 int isloading=0;

  
    return BlocBuilder<AuthCubit, AuthState>(
      
      builder: (context, state)  {
       if(state is Logincubitloading){ return Center(child: CircularProgressIndicator());}
         else if(state is Logincubitsuccess){return HomeDoctor();} 
         else{return  Scaffold(
          endDrawer: Navbar_Patient(context),
          appBar: AppBar(shadowColor: Colors.transparent,backgroundColor: Colors.transparent,
          title: Text('Welcome Back',style: TextStyle(fontSize: 18),),),
          body: ListView(
            children:[ Form(
              key: _formkey,
              child: Column(
                children: [
                 
                   
                  
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 21.0, right: 22.0),
                    child: SizedBox(
                      width: query.size.width,
                      child: TextFormField(
                          controller: emailcontroller,
                          validator: (value) {
                            if (value == null 
                                ||value.isEmpty 
                                ||!value.endsWith('.com')) {
                              return 'wrong email';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            hintStyle:
                                TextStyle(fontSize: 15, color: Color(0xffA0A0A0)),
                            enabledBorder: OutlineInputBorder(
                              gapPadding: 12,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Color(0xff82C4C3),
                              ),
                            ),focusedBorder: OutlineInputBorder(
                              gapPadding: 12,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Color(0xff82C4C3),
                              ),
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 21.0, right: 22.0),
                    child: SizedBox(
                      width: query.size.width,
                      child: TextFormField(
                        obscureText: true,
                          controller: passwordcontroller,
                          validator: (value) {
                            if (value == null 
                               || value.isEmpty 
                               || value.length < 6) {
                              return 'wrong password';
                            } else {
                              return null;
                            }},
                          decoration: const InputDecoration(
                            
                            hintText: 'password',
                            prefixIcon: Icon(Icons.lock),
                            hintStyle:
                                TextStyle(fontSize: 15, color: Color(0xffA0A0A0)),
                            enabledBorder: OutlineInputBorder(
                              gapPadding: 12,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Color(0xff82C4C3),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              gapPadding: 12,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Color(0xff82C4C3),
                              ),
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      TextButton(
                        child: Text(
                          'Do you have an email',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff82C4C3),
                              fontFamily: 'Inter'),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/');
                        },
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
                         dynamic response  = await BlocProvider.of<AuthCubit>(context).Logindoc(email: emailcontroller.text
                        , password: passwordcontroller.text);
          
        BlocProvider.of<AuthCubit>(context).docc?.tokennn=response['token'];
                       if(response['token']!=null){
                      
                        dynamic email= emailcontroller.text.toString();
                        dynamic password =passwordcontroller.text.toString();
                        
                           logindata?.setBool('login', false);
                        logindata?.setString('email', email);
                        logindata?.setString('password', password);
                        print(logindata?.getString('email'));
                       
                      // print(BlocProvider.of<AuthCubit>(context).docc?.email);
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
                  Align(alignment: Alignment.bottomRight,
                  child: SizedBox(height: 92,width: 105,child: Image.asset('images/note(1).png'))),
                ],
              ),
            ),]
          ),
        );
  }
  
  
  });
      
    
  }
   void check_already_login() async{
  logindata=await SharedPreferences.getInstance();
  newuser=(logindata?.getBool('login')??true);
  //print(newuser);
  }
  void dipose(){
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

 
}