import 'dart:convert';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:async/async.dart' as asy;
import 'package:vital_care/cubits/authh_cubit/auth_cubit.dart';
import 'package:vital_care/models/Add_patient_model.dart';

import '../../models/error_message.dart';
part 'patient_state.dart';

class PatientCubit extends Cubit<addPatientState> {
  // PatientCubit(super.initialState);
  String baseUrl = 'https://clever-rose-mite.cyclic.app/api/';
  String endpoints = 'patient/store';
  PatientCubit() : super(addPatientInitial());
  dynamic id;
  dynamic res;
  dynamic resp;
  dynamic msg;
  dynamic mssg;
  dynamic respo;
  dynamic respon;
  AddPatientModel? pat;
  errormessage? error;
  dynamic? message;
  dynamic out;
  List allpatientts = [];
  dynamic idddddd;
  dynamic diagnosis;
  dynamic treatment;
  dynamic nottttte;
  dynamic abnormal;
  dynamic additionall;
  dynamic msag;
  dynamic msssssg;
  dynamic namee;
  dynamic? Emailll;
  dynamic Dateeee;
  dynamic last_date;
  dynamic cancer_typeee;
  dynamic Phoneee;
  dynamic Genderrr;
  dynamic Ageee;
  // List<AddPatientModel> allpatByname = [];
  dynamic flag = 0;

  List allapointment = [];
  // dynamic? message;
  // AllapointmentsCubit() : super(AllapointmentsInitial());
  Future<dynamic>? showspecificAppointment(
      dynamic reservedDay, dynamic doct_id) async {
    emit(addPatientloading());
    try {
      dynamic appointResp = await http.post(
        Uri.parse(
            'https://clever-rose-mite.cyclic.app/appointment/apponintment-by-day'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "reservedDay": reservedDay,
          "doctorID": doct_id
        }),
      );

      Map<String, dynamic> dataa = jsonDecode(appointResp.body);
      if (appointResp.statusCode == 200) {
        emit(addPatientsuccess());
        //Map<String, dynamic> dataa = jsonDecode(appointResp.body);
        dynamic allappoint = dataa['response'];
        allapointment.clear();
        for (dynamic i in allappoint) {
          allapointment.add(i);
        }
        print(allapointment);
        // print(doc_Links?.FaceBook_Link);
        //print(dataa);
      }
      //print(dataa);
      return appointResp;
    } on Exception catch (e) {
      emit(addPatientfailure());
      int t = 0;
      return t;
    }
  }

  Future<dynamic>? showAppointment(dynamic d_id) async {
    emit(addPatientloading());
    try {
      dynamic appresp = await http.post(
        Uri.parse(
            'https://clever-rose-mite.cyclic.app/appointment/all-appointments-for-doctor'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{
          "doctorID": d_id,
        }),
      );
      Map<String, dynamic> dataa = jsonDecode(appresp.body);
      flag = '3';
      if (appresp.statusCode == 200) {
        emit(addPatientsuccess());

        dynamic filedata = dataa['response'];
        print(appresp);
        allapointment.clear();
        for (dynamic i in filedata) {
          //print(i);
          allapointment.add(i);
        }
      }

      return appresp;
    } on Exception catch (e) {
      emit(addPatientfailure());
      int t = 0;
      return t;
    }
  }
//   Future<dynamic>? showAppointment(dynamic doct_id
//    )async {
//           emit(Allappointmentloading());
//     try {

//   dynamic appointResp= await http.post(
//     Uri.parse('https://clever-rose-mite.cyclic.app/appointment/all-appointments-for-doctor'),
//     // headers: <String, String>{
//     //   'Content-Type': 'application/json; charset=UTF-8',
//     // },
//     body: jsonEncode(<dynamic, dynamic>{

//     "doctorID" :'2'
//     }),

//   );

//    Map<String, dynamic> dataa = jsonDecode(appointResp.body);
//    print(appointResp);
//     allapointment.clear();
//     if(appointResp.statusCode==200){
//        emit(Allappointmentsuccess());
//     //Map<String, dynamic> dataa = jsonDecode(appointResp.body);
//     //dynamic allappoint=dataa['response'];
//   //   for(dynamic i in allappoint){
//   //  allapointment.add(i);
//   //   }
//     print(dataa);
//    // print(doc_Links?.FaceBook_Link);
//    //print(dataa);
//    }
//   //print(dataa);
//    return appointResp;
// } on Exception catch (e) {
//   emit(Allappointmentfailure());
//   int t=0;
//  return t;
// }
//   }
  Future<dynamic>? deleteAppointment(dynamic doc_id) async {
    emit(addPatientloading());
    try {
      dynamic appointResp = await http.post(
        Uri.parse(
            'https://clever-rose-mite.cyclic.app/appointment/delete-all-appointments-by-doctor-id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<dynamic, dynamic>{"doctorID": doc_id}),
      );
      emit(addPatientsuccess());
      Map<String, dynamic> dataa = jsonDecode(appointResp.body);
      if (appointResp.statusCode == 200) {
        Map<String, dynamic> dataa = jsonDecode(appointResp.body);
        message = dataa['message'];
        //dynamic allappoint=dataa['response'];
        //   for(dynamic i in allappoint){
        //  allapointment.add(i);
        //   }
        print(message);
        // print(doc_Links?.FaceBook_Link);
        //print(dataa);
      }
      //print(dataa);
      return appointResp;
    } on Exception catch (e) {
      emit(addPatientfailure());
      int t = 0;
      return t;
    }
  }

  List<AddPatientModel> allpat = [];
  Future<dynamic>? addpatient(
      {required dynamic? doctor_id,
      required dynamic? fullname,
      required dynamic? username,
      required dynamic? email,
      required dynamic? password,
      required dynamic? phone,
      required dynamic? cancertype,
      required dynamic? diagnosis,
      required dynamic? treatment,
      required dynamic? notes,
      required dynamic? Abnormal_syptoms,
      // required dynamic? date,
      required dynamic? Additional_information,
      required dynamic? age,
      // required
      // dynamic image,
      required dynamic? gender}) async {
    emit(addPatientloading());
    dynamic response = await post(
      Uri.parse('https://clever-rose-mite.cyclic.app/api/patient/store'),
      headers: <String, String>{
        'Content-Type': "application/json", 'Accept': '*/*'
        //  'contentType': MediaType("image", "jpeg"),
      },
      body: jsonEncode(<dynamic, dynamic>{
        "d_id": doctor_id,
        "patientName": fullname,
        "patientAge": age,
        "patientPhoneNumber": phone,
        "patientUsername": username,
        "patientEmail": email,
        "patientPassword": password,
        "cancerType": cancertype,
        "diagnosisOfDisease": diagnosis,
        "drugs_names": treatment,
        "patientGender": gender,
        "doctorInstructionsAndNotes": notes,
        "abnormal_Symptoms": Abnormal_syptoms,
        "additional_Info": Additional_information
      }
          // {
          //   "d_id": doctor_id,
          //   "patientName": fullname,
          //   "patientAge": age,
          //   "patientPhoneNumber": phone,
          //   "patientUsername": username,
          //   "patientEmail": email,
          //   "patientPassword": password,
          //   "cancerType": cancertype,
          //   "diagnosisOfDisease": diagnosis,
          //   "drugs_names": treatment,
          //   "patientGender": gender,
          //   "doctorInstructionsAndNotes": notes,

          //   // "image": image,
          //   "abnormal_Symptoms": Abnormal_syptoms,
          //   "additional_Info": Additional_information,
          //   // "Dates": date,
          // }
          ),
    );
    // Map<String, dynamic> dataa = jsonDecode(resp.body);
    // Map<String, dynamic> dataa = jsonDecode(respon.body);
    // msg = dataa['response'];
    if (response.statusCode == 200) {
      emit(addPatientsuccess());
      // msg = dataa['message'];
      // msssssg = dataa['message'];
      print(response.body);
    } else {
      emit(addPatientfailure());
      // print(response.body);
    }
  }

  Future<dynamic>? Editpatient({
    // required dynamic? patient_id,
    required dynamic? fullname,
    required dynamic? username,
    required dynamic? email,
    required dynamic? password,
    required dynamic? phone,
    required dynamic? cancertype,
    required dynamic? diagnosis,
    required dynamic? treatment,
    required dynamic? notes,
    required dynamic? Abnormal_syptoms,
    // required dynamic? date,
    required dynamic? Additional_information,
    required dynamic? age,
    // required
    // dynamic image,
    required dynamic? gender,
  }) async {
    emit(addPatientloading());
    dynamic response = await put(
      Uri.parse('https://clever-rose-mite.cyclic.app/api/patient/update/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',

        // 'Content-Type': 'multipart/form-data; charset=UTF-8', 'Accept': '*/*'
        //  'contentType': MediaType("image", "jpeg"),
      },
      body: jsonEncode(<dynamic, dynamic>{
        // "d_id": patient_id,
        "patientName": fullname,
        "patientUsername": username,
        "patientEmail": email,
        "patientPassword": password,
        "patientPhoneNumber": phone,
        "patientAge": age,
        "cancerType": cancertype,
        "diagnosisOfDisease": diagnosis,
        // "Dates": date,
        // "image": image,
        "abnormal_Symptoms": Abnormal_syptoms,
        "additional_Info": Additional_information,
        "doctorInstructionsAndNotes": notes,
        "drugs_names": treatment,
        "patientGender": gender,
      }),
    );
    // Map<String, dynamic> dataa = jsonDecode(resp.body);
    // Map<String, dynamic> dataa = jsonDecode(respo.body);
    // out = dataa['response'];
    if (response.statusCode == 200) {
      print(response.body);

      emit(addPatientsuccess());
      //  id = allpat[indexx].id;
      // print(dataa);
      // mssg = out['message'];
    } else {
      emit(addPatientfailure());
      // print(response.body);
    }
  }

  Future<dynamic>? allpatientbyName(dynamic name) async {
    emit(allpatient_byNameloading());
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
        emit(allpatient_byNamesuccess());
        dynamic filedata = dataa['response'];
        allpat.clear();
        for (dynamic i in filedata) {
          //print(i);
          allpat.add(AddPatientModel(
            id: i["_id"],
            dId: i["d_id"],
            patientName: i["patientName"],
            patientAge: i["patientAge"],
            patientPhoneNumber: i["patientPhoneNumber"],
            patientUsername: i["patientUsername"],
            patientEmail: i["patientEmail"],
            patientPassword: i["patientPassword"],
            cancerType: i["cancerType"],
            diagnosisOfDisease: i["diagnosisOfDisease"],
            drugsNames: i["drugs_names"],
            patientGender: i["patientGender"],
            dateofVisit: DateTime.parse(
              i["dateofVisit"],
            ),
            doctorInstructionsAndNotes: i["doctorInstructionsAndNotes"],
            abnormalSymptoms: i["abnormal_Symptoms"],
            additionalInfo: i["additional_Info"],
          ));
          print(allpat);
        }
      }

      return commresp;
    } on Exception catch (e) {
      emit(allpatient_byNamefailure());
      int t = 0;
      return t;
    }
  }

  Future<dynamic>? Showw_allPatients({required dynamic d_id}) async {
    emit(showall_Patientloading());

    dynamic resp = await http.post(
      Uri.parse('https://clever-rose-mite.cyclic.app/api/patient/all-patients'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{"d_id": d_id}),
    );
    Map<String, dynamic> dataa = jsonDecode(resp.body);
    dynamic filedata = dataa['response'];
    if (resp.statusCode == 200) {
      emit(showall_Patientsuccess());
      for (dynamic i in filedata) {
        allpat.add(AddPatientModel(
          id: i["_id"],
          dId: i["d_id"],
          patientName: i["patientName"],
          patientAge: i["patientAge"],
          patientPhoneNumber: i["patientPhoneNumber"],
          patientUsername: i["patientUsername"],
          patientEmail: i["patientEmail"],
          patientPassword: i["patientPassword"],
          cancerType: i["cancerType"],
          diagnosisOfDisease: i["diagnosisOfDisease"],
          drugsNames: i["drugs_names"],
          patientGender: i["patientGender"],
          dateofVisit: DateTime.parse(
            i["dateofVisit"],
          ),
          doctorInstructionsAndNotes: i["doctorInstructionsAndNotes"],
          abnormalSymptoms: i["abnormal_Symptoms"],
          additionalInfo: i["additional_Info"],
        ));
      }
      print(allpat[0].patientName);

      return dataa;
    } else {
      message = resp.body;
      msag = dataa['message'];
      emit(showall_Patientfailure());
      return dataa['message'];
    }
  }

  // Future<dynamic>? deletepati(indexxx) async {
  //   emit(showall_Patientloading());
  //   dynamic id = allpat[indexxx].id;
  //   dynamic resp = await http.delete(
  //     Uri.parse('https://clever-rose-mite.cyclic.app/api/patient/delete/$id'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );
  //   Map<String, dynamic> dataa = jsonDecode(resp.body);

  //   dynamic? filedata = dataa['response'];

  //   if (resp.statusCode == 200) {
  //     emit(showall_Patientsuccess());
  //     // docc=DocsigninAccountModel.fromjson(dataa);
  //     for (dynamic i in allpat) {
  //       if (allpat.indexOf(i) == indexxx) {
  //         allpat.removeAt(indexxx);
  //       }
  //     }
  //     ;
  //     // mssag = filedata['message'];
  //     print('deleted done');
  //     print(dataa);
  //     print(filedata);
  //     return dataa;
  //   } else {
  //     //AlertDialog(title: message,);
  //     emit(showall_Patientfailure());
  //     return message;
  //   }
  // }
}

//   Future<dynamic> uploadImage1(
//       {required File imageFile,  String? endPoint}) async {
//     try {
//       String url = '${baseUrl}$endPoint';
//       var request = http.MultipartRequest("POST", Uri.parse(url));
//       var stream =
//           http.ByteStream(asy.DelegatingStream.typed(imageFile.openRead()));
//       var length = await imageFile.length();
//       var multipartFile = http.MultipartFile('image', stream, length,
//           filename: basename(imageFile.path));
//       request.files.add(multipartFile);
//       var response = await request.send();
//       final respStr = await response.stream.bytesToString();
//       return http.Response(respStr, response.statusCode);
//     } catch (e) {
//       debugPrint('Error => $e');
//       return http.Response('Failed', 700);
//     }
//   }

//   late String message;
// }

// class DelegatingStream {}

