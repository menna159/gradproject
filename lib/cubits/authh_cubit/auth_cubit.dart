import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:vital_care/models/signin_patientModel.dart';
import 'package:vital_care/screens/authentication/signin_patient.dart';

import '../../models/doc_accountModel.dart';
import '../../models/error_message.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  dynamic resp;
  // AuthCubit(super.initialState);
  dynamic? doctor_id;
  dynamic? id;
  // String? _token;
  Future SignUpDoc(
      String name,
      String username,
      String email,
      String password,
      String phone,
      String specialization,
      String dates,
      String city_name) async {
    emit(signuploadingdoc());
    http.Response response = await post(
      Uri.parse('https://clever-rose-mite.cyclic.app/doctor/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'username': username,
        "email": email,
        "password": password,
        "phone": phone,
        "specialization": specialization,
        "Dates": dates,
        "city": city_name,
      }),
    );
    if (response.statusCode == 200) {
      emit(signupSuccessdoc());
      // dynamic id = docc?.id;
      // doctor_id = docc?.id;
      print(response.body);
    } else {
      emit(signupFailuredoc(errorMessage: 'Something went wrong'));
      print(response.body);
    }
  }

  late String message;
  errormessage? error;

  AuthCubit() : super(LoginInitialdoc());
  DocAccountModel? docc;
  patientSigninModel? patient;

  Future<dynamic>? Logindoc(
      {required String email, required String password}) async {
    emit(Loginloadingdoc());

    dynamic resp = await http.post(
      Uri.parse('https://clever-rose-mite.cyclic.app/doctor/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"email": email, "password": password}),
    );
    Map<dynamic, dynamic> dataa = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      docc = DocAccountModel.fromjson(dataa);

      //  tokenn=dataa['token'];
      // docc?.tokennn=dataa['token'];
      //dynamic doctor =docc?.retmodel(dataa);
      //docc?.tokennn=dataa['token'];

      //docc?.token=dataa['token'];
      //print(docc?.token);
      //print(tokenn);
      emit(LoginSuccessdoc());
      // docc=DocAccountModel.fromjson(dataa);
      doctor_id = docc?.dId;
      id = docc?.id;
      print(dataa);
      print(docc?.id);

      return dataa;
    } else {
      // message = dataa[1];
      //AlertDialog(title: message,);
      emit(LoginFailuredoc(errorMessage: 'wrong'));
      return message;
    }
  }
  // Future<dynamic>? Logindoc(
  //     {required String email, required String password}) async {
  //   emit(Loginloadingdoc());

  //   dynamic resp = await http.post(
  //     Uri.parse('https://clever-rose-mite.cyclic.app/doctor/signin'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{"email": email, "password": password}),
  //   );
  //   Map<String, dynamic> dataa = jsonDecode(resp.body);

  //   if (resp.statusCode == 200) {
  //     // tokenn = dataa['token'];

  //     // // docc?.tokennn=dataa['token'];
  //     //dynamic doctor =docc?.retmodel(dataa);
  //     //docc?.tokennn=dataa['token'];

  //     //docc?.token=dataa['token'];
  //     //print(docc?.token);
  //     //print(tokenn);
  //     emit(LoginSuccessdoc());
  //     return dataa;
  //   } else {
  //     message = resp.body;
  //     // AlertDialog(
  //     //   title: message,
  //     // );
  //     emit(LoginFailuredoc(errorMessage: "something went wrong"));
  //     return dataa;
  //   }
  // }

  Future<dynamic>? Loginpat(
      {required String email, required String password}) async {
    emit(Loginloadingdoc());

    dynamic resp = await http.post(
      Uri.parse('https://clever-rose-mite.cyclic.app/patient/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{"patientEmail": email, "patientPassword": password}),
    );
    Map<String, dynamic> dataa = jsonDecode(resp.body);

    if (resp.statusCode == 200) {
      patient = patientSigninModel.fromjson(dataa);
      print(patient);
      emit(LoginSuccesspat());
      return dataa;
    } else {
      message = resp.body;

      emit(LoginFailurepat(errorMessage: "something went wrong"));
      return dataa;
    }
  }

  Future resetPassword({required String email}) async {
    emit(Forgetpasswordloading());
    http.Response response = await post(
      Uri.parse('https://project-zxjs.onrender.com/setting/req-reset-password'),
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

Future<void> changePassword(String newPassword) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  print(newPassword);
  // _token = sharedPreferences.getString("token");
  final String url = 'https://project-zxjs.onrender.com/setting/new-password';
  try {
    await http.post(
      Uri.parse(url),
      body: json.encode(
        {
          // 'idToken': _token,
          'password': newPassword,
          'returnSecureToken': true,
        },
      ),
    );
  } catch (error) {
    throw error;
  }
}

  //   } else if (response.statusCode == 400 &&
  //       response.body == 'User Not Exist') {
  //     emit(LoginFailure(errorMessage: 'User Not Exist'));
  //   } else if (response.body == 'Incorrect Password !' &&
  //       response.statusCode == 400) {
  //     emit(LoginFailure(errorMessage: 'Incorrect Password !'));
  //   }
  // } catch (e) {
  //   emit(LoginFailure(errorMessage: 'something went wrong'));
  // }

