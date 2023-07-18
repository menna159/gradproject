import 'dart:convert';

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:final_dart/components/snack.dart';
import 'package:final_dart/models/all.dart';
import 'package:final_dart/models/doc_accountModel.dart';
import 'package:final_dart/models/patients.dart';
import 'package:final_dart/models/signin_docModel.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import '../../../models/drugs.dart';
part 'auth_state.dart';


class AuthCubit extends Cubit<AuthState> {
  final dio=Dio();
 List<AddPatientModel> allpatByname=[];
  //List <DocsigninAccountModel>? users=[DocsigninAccountModel(name: name, username: username, email: email, password: password, specialization: specialization, phone: phone, date: date),
  //DocsigninAccountModel(name: name, username: username, email: email, password: password, specialization: specialization, phone: phone, date: date)];
  late String message;
  AuthCubit() : super(LogincubitInitial());
  DocsigninAccountModel? docc;
  String? tokenn;
  bool? swvalue;

  //ThemeMode mode=ThemeMode.light;
  Future<dynamic>? Logindoc(
      {required String email, required String password}) async {
    emit(Logincubitloading());

    dynamic resp = await http.post(
      Uri.parse('https://clever-rose-mite.cyclic.app/doctor/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"email": email, "password": password}),
    );
Map<String, dynamic> dataa = jsonDecode(resp.body);
     if(resp.statusCode==200){
     docc=DocsigninAccountModel.fromjson(dataa);
     tokenn=dataa['token'];
    // docc?.tokennn=dataa['token'];
    //dynamic doctor =docc?.retmodel(dataa);
     //docc?.tokennn=dataa['token'];
    
     //docc?.token=dataa['token'];
     //print(docc?.token);
     //print(tokenn);
    emit(Logincubitsuccess());
      // docc=DocsigninAccountModel.fromjson(dataa);
     
    print(dataa);
    print(docc?.id);

return dataa;
  }


 else{
  message=dataa[1];
  //AlertDialog(title: message,);
  emit(Logincubitfailure());
  return message;
}
      }


//  else{
//   Map<String, dynamic> mn = jsonDecode(resp.body);
//   messege = mn['message'];
//       // AlertDialog(
//       //   title: message,
//       // );
//       emit(Logincubitfailure());
//       return messege;
// //   dynamic i;
// //  for(i in dataa['errors']){
// // messege+=i['msg'];
// //  }
  
//   //ShowSnackbar(context, BlocProvider.of<AuthCubit>(context).messege);
//   //AlertDialog(title: messege,);
//   //emit(Logincubitfailure());
 
//   //return '0';
// }

Future<dynamic>? allpatientbyName(dynamic name) async {
    emit(Logincubitloading());
    try {
      dynamic commresp = await http.post(
        Uri.parse(
            'https://clever-rose-mite.cyclic.app/api/patient/patient-by-patientname'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "patientName": name,
        }),
      );
      Map<String, dynamic> dataa = jsonDecode(commresp.body);
      if (commresp.statusCode == 200) {
        //print(dataa);
                emit(Logincubitsuccess());
        dynamic filedata = dataa['response'];
        allpatByname.clear();
        for (dynamic i in filedata) {
          //print(i);
          allpatByname.add(AddPatientModel(
            patientName: i["patientName"],
          ));
        }
        print(allpatByname[0].patientName);
      }
     
      return commresp;
    } on Exception catch (e) {
      emit(Logincubitfailure());
      int t = 0;
      return t;
    }
  }

Future<dynamic>? add_treatments(dynamic doc_id, dynamic patientID,
      dynamic drug_name, dynamic how_often, dynamic usage_of_drug) async {
    emit(Logincubitloading());
    try {
      dynamic add_treatment = await http.post(
        Uri.parse(
            'https://clever-rose-mite.cyclic.app/drug_times/store-drug'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "d_id":doc_id,
    "patientID":patientID,
    "drug_name":drug_name ,
    "how_often":how_often , 
    "time_one":"12:00:00" , 
    "time_two":"5:00:00" , 
    "time_three":"12:00:00",
    "every_When":"Every 8 Hours" , 
    "usage_of_drug":usage_of_drug
        }),
      );
      Map<String, dynamic> data = jsonDecode(add_treatment.body);
      if (add_treatment.statusCode == 200) {
        print(data);
        emit(Logincubitsuccess());
        //dynamic message = data['message'];

        //print(message);
      }
      return add_treatment;
    } on Exception catch (e) {
      emit(Logincubitfailure());
      int t = 0;
      return t;
    }
  }
  Future<dynamic>? add_abnormalsymptoms(
    // dynamic doc_id, dynamic patientID,
    dynamic abnormalsymptoms,
    dynamic patientName,
    
    // dynamic doctorName
  ) async {
    emit(Logincubitloading());
    try {
      dynamic add_abnormal = await http.post(
        Uri.parse(
            'https://clever-rose-mite.cyclic.app/symptoms/store-Abnormal-Symptoms-By-Patient'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "d_id ": "64542a1b036aca133373235e",
          "patientID": "645cdf802ee3a7a14efe3700",
          "abnormalsymptoms": abnormalsymptoms,
          "patientName": patientName,
          "doctorName": "Ahmed ayman"
        }),
      );
      Map<String, dynamic> data = jsonDecode(add_abnormal.body);
      if (add_abnormal.statusCode == 200) {
        emit(Logincubitsuccess());
        dynamic message = data['message'];
     
        print(message);
      }
      return add_abnormal;
    } on Exception catch (e) {
      emit(Logincubitfailure());
      int t = 0;
      return t;
    }
  }




















  
  Future<dynamic>? editpatient(dynamic doc_id, dynamic name,
      dynamic username) async {
    emit(Logincubitloading());
    try {
      dynamic add_treatment = await http.post(
        Uri.parse(
            'https://clever-rose-mite.cyclic.app/doctorprofile/updatedr'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "d_id": doc_id,
      
         "name":name,
    "username":username
        }),
      );
      Map<String, dynamic> data = jsonDecode(add_treatment.body);
      if (add_treatment.statusCode == 200) {
        print(data);
        emit(Logincubitsuccess());
        //dynamic message = data['message'];

        //print(message);
      }
      return add_treatment;
    } on Exception catch (e) {
      emit(Logincubitfailure());
      int t = 0;
      return t;
    }
  }













List<TreatmentModel> alltreatments = [];
//TreatmentModel? trtmodel;
  Future<dynamic>? showtreatmentsDoc(dynamic doc_id) async {
    emit(Logincubitloading());
    try {
      dynamic appointResp = await http.post(
        Uri.parse(
            'https://clever-rose-mite.cyclic.app/drug_times/all-drugs-for-patient'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "patientID":doc_id
        }),
      );

      Map<dynamic, dynamic> data = jsonDecode(appointResp.body);
      if (appointResp.statusCode == 200) {
        print(data);
        emit(Logincubitsuccess());
        for(dynamic i in data['response']){
          alltreatments.add(TreatmentModel(
          
            drugName : i['drug_name'],
    howOften : i['how_often'],
    timeOne : i['time_one'],
    timeTwo : i['time_two'],
    timeThree : i['time_three'],
    everyWhen : i['every_When'],
    usageOfDrug : i['usage_of_drug'],
          ));
        }
        print(alltreatments[0].drugName);
      
      }
      //print(dataa);
      return appointResp;
    } on Exception catch (e) {
      emit(Logincubitfailure());
      int t = 0;
      return t;
    }
  }























 



 Future<dynamic>? Createpatient()async {
  
  dynamic map=  Map<String, dynamic>();
   map['d_id']= 'dfghjk';
      map['patientName'] = 'dfghjk';
      map["patientAge"]=  'dfghjk';
      map["patientPhoneNumber"]='dfghjk';
      map["patientUsername"]= 'dfghjk';
      map["patientEmail"]='dfghjk';
      map["patientPassword"]= 'dfghjk';
map["cancerType"]='dfghjk';
map["drugs_names"]='dfghjk';
map["patientGender"]= 'dfghjk';
map["doctorInstructionsAndNotes"]= 'dfghjk';
map["abnormal_Symptoms"]= 'dfghjk';
map["additional_Info"]= 'dfghjk';
var formdata=FormData.fromMap(map);
//print(map);
         emit(Registercubitloading());
    try {
  dynamic regresp= await dio.post(
    'https://clever-rose-mite.cyclic.app/api/patient/store'
    , options: Options(
        //contentType: 'text/html; charset=utf-8',
        followRedirects: true
    )
    // headers: <String, String>{
         
    //     },
        
  //   ,options: Options(headers: {
  //   HttpHeaders.contentTypeHeader: "application/json",
  // }),
  ,data: formdata

  );
  // Map<dynamic, dynamic> data = jsonDecode(regresp.body);
  if(regresp.statusCode==200){
     print(regresp);
    emit(Registercubitsuccess());
   
  }
   
   return regresp;
} on Exception catch (e) {
  int t=0;
   emit(Registercubitfailure());
   return t;
}
  }




  Future<dynamic>? Createuser(String name, String username, String email,
   String password,String phone,String specialization,String dates)async {
         emit(Registercubitloading());
    try {
  dynamic regresp= await http.post(
    Uri.parse('https://clever-rose-mite.cyclic.app/doctor/signup'),
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
   emit(Registercubitsuccess());
   return regresp;
} on Exception catch (e) {
  int t=0;
   emit(Registercubitfailure());
   return t;
}
  }

Future resetPassword({required String email}) async {
    emit(Forgetpasswordloading());
    http.Response response = await http.post(
      Uri.parse(
          'https://baby-blue-salmon-toga.cyclic.app/setting/req-reset-password'),
      body: jsonEncode(<String, String>{
        "email": email,
      }),
    );
    headers:
    <String, String>{
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Connection': 'keep-alive'
    };
    if (response.statusCode == 200) {
      emit(ForgetpasswordSuccess());
      print(response.body);

      return response;
    } else {
      message = response.body;

      emit(ForgetpasswordFailure(errorMessage: 'something went wrong'));
      print(response.body);

      return response;
    }
  }
}






