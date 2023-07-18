import 'package:final_dart/models/doc_accountModel.dart';
import 'package:final_dart/screens/cubits/cubit/auth_cubit.dart';
import 'package:final_dart/screens/cubits/cubit/communication_cubit.dart';
import 'package:final_dart/screens/home_doc.dart';
import 'package:final_dart/screens/home_docc.dart';
import 'package:final_dart/screens/sign_up_doc.dart';
import 'package:final_dart/screens/signin_doctor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyWidget extends StatefulWidget {
   MyWidget({super.key});

 
  @override
  State<MyWidget> createState() => _MyWidgetState();
}
class _MyWidgetState extends State<MyWidget> {
 SharedPreferences? logindata;
 String? email;
 String? password;
 dynamic docc;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial() async{
     logindata= await SharedPreferences.getInstance();
    
    // setState(() {
      email=logindata?.getString('email');
      password=logindata?.getString('password');
                 if(email!=null){
BlocProvider.of<AuthCubit>(context).Logindoc(email: email!, password: password!);
                 }
               
             // BlocProvider.of<AuthCubit>(context).docc=DocsigninAccountModel.fromjson(data);
               //print(BlocProvider.of<AuthCubit>(context).docc?.name);
      //print(BlocProvider.of<AuthCubit>(context).docc);
    // });
   
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if(state is Logincubitloading){
          return  Center(child: CircularProgressIndicator());
        }else if(state is Logincubitsuccess){
          //print(BlocProvider.of<AuthCubit>(context).docc?.id);
       return HomeDoctor();
      }else{
        return SignUp_doc();
      }
      }
    );
   // email=='null'?SignUp_doc():HomeDoc();
  }
}
// void() login{
//   BlocProvider.of<AuthCubit>(widget.context).Logindoc(email: email, password: password)
// }