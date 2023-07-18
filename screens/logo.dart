import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logo extends StatefulWidget {
  Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  SharedPreferences? typeperson;
 String? type;
  @override
  void initState() {
    initial();
    Timer(Duration(seconds: 5), (() {
     if(type==null){
      Navigator.pushNamed(context,'/doc_or_patient');}
     else if(type=='doctor') {
      
      Navigator.pushNamed(context, '/m');
     }else{
      Navigator.pushNamed(context, '/signinpatient');
     }
    }));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('images/home.jpg'),
        Text('Doctor Home')],
      ),
    ));
  }
  
  void initial() async{
    typeperson= await SharedPreferences.getInstance();
    setState(() {
      
      type=typeperson?.getString('type');
    });
  }
}
