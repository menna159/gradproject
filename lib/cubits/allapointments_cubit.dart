import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'allapointments_state.dart';

class AllapointmentsCubit extends Cubit<AllapointmentsState> {
  List allapointment=[];
  dynamic? message;
  AllapointmentsCubit() : super(AllapointmentsInitial());
   Future<dynamic>? showspecificAppointment(dynamic reservedDay,dynamic doct_id
   )async {
          emit(Allappointmentloading());
    try {

  dynamic appointResp= await http.post(
    Uri.parse('https://clever-rose-mite.cyclic.app/appointment/apponintment-by-day'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<dynamic, dynamic>{
       
    "reservedDay" : reservedDay,
    "doctorID" :doct_id
    }),

  );

   Map<String, dynamic> dataa = jsonDecode(appointResp.body);
    if(appointResp.statusCode==200){
         emit(Allappointmentsuccess());
    //Map<String, dynamic> dataa = jsonDecode(appointResp.body);
    dynamic allappoint=dataa['response'];
     allapointment.clear();
    for(dynamic i in allappoint){
     
   allapointment.add(i);
    }
    print(allapointment);
   // print(doc_Links?.FaceBook_Link);
   //print(dataa);
   }
  //print(dataa);
   return appointResp;
} on Exception catch (e) {
  emit(Allappointmentfailure());
  int t=0;
 return t;
}
  }
  Future<dynamic>? showAppointment(dynamic d_id
   )async {
          emit(Allappointmentloading());
    try {

  dynamic appresp= await http.post(
    Uri.parse('https://clever-rose-mite.cyclic.app/appointment/all-appointments-for-doctor'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<dynamic, dynamic>{
      "doctorID" :d_id,
     
    }),

  );
  Map<String, dynamic> dataa = jsonDecode(appresp.body);
   if(appresp.statusCode==200){
  emit(Allappointmentsuccess());
 dynamic filedata=dataa['response'];
   print(appresp);
    allapointment.clear();
for(dynamic i in filedata){
  
  //print(i);
allapointment.add(i);
       
       
}

  }
 
   return appresp;
} on Exception catch (e) {
  emit(Allappointmentfailure());
  int t=0;
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
Future<dynamic>? deleteAppointment(dynamic doc_id
   )async {
          emit(Allappointmentloading());
    try {

  dynamic appointResp= await http.post(
    Uri.parse('https://clever-rose-mite.cyclic.app/appointment/delete-all-appointments-by-doctor-id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<dynamic, dynamic>{
       
    "doctorID" : doc_id
    }),

  );
   emit(Allappointmentsuccess());
   Map<String, dynamic> dataa = jsonDecode(appointResp.body);
    if(appointResp.statusCode==200){
    Map<String, dynamic> dataa = jsonDecode(appointResp.body);
    message=dataa['message'];
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
  emit(Allappointmentfailure());
  int t=0;
 return t;
}
  }
}
