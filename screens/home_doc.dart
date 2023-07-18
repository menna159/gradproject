
import 'dart:io';
import 'dart:math';

import 'package:final_dart/components/navbar.dart';
import 'package:final_dart/components/navbar_pathient.dart';
import 'package:final_dart/models/doc_accountModel.dart';
import 'package:final_dart/models/signin_docModel.dart';
import 'package:final_dart/screens/cubits/cubit/auth_cubit.dart';
import 'package:final_dart/screens/cubits/cubit/cubit/cubit/cubit/cubit/all_doctor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDoc extends StatefulWidget {
  const HomeDoc({super.key});

  @override
  State<HomeDoc> createState() => _HomeDocState();
}
class _HomeDocState extends State<HomeDoc> {
  SharedPreferences? logindata;
  
  dynamic email;
  
  @override
  void initState() {

    super.initState();
    initial();
  }
  @override
  void initial() async{
     logindata= await SharedPreferences.getInstance();
    setState(() {
      email=logindata?.getString('email');
      //print(BlocProvider.of<AuthCubit>(context).docc?.name);
    });
   
  }
  @override
  Widget build(BuildContext context) {
    //DocsigninAccountModel doctor=BlocProvider.of<AuthCubit>(context).docc;
    return WillPopScope(
      onWillPop: ()async{
        
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return false;
        },
      child:
       Scaffold(
         appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          shadowColor: Colors.transparent,
          
        ),
      endDrawer: Navbar(context,name: BlocProvider.of<AuthCubit>(context).docc?.name),
       body:
       Column(
         children: [
           Text('${BlocProvider.of<AuthCubit>(context).docc?.name}'),
           ElevatedButton(onPressed: (){
            print(BlocProvider.of<AuthCubit>(context).docc?.email);
            BlocProvider.of<AllDoctorCubit>(context).alldoctor();
            Navigator.pushNamed(context, '/chat_with_doctor');
           }, child: Text('+'))
         ],
       ),
       
      
      ),
    );
  }
}
