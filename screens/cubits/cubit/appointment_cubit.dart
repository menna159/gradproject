import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit() : super(AppointmentInitial());
  String? appointnum;
  String? appointname;
  List output=[];
  Future<dynamic>? addAppointment(dynamic d_id,dynamic doc_name, dynamic patientName, dynamic reservedDay
   )async {
          emit(Appointmentloading());
    try {

  dynamic appointResp= await http.post(
    Uri.parse('https://clever-rose-mite.cyclic.app/appointment/add-new-appointment'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<dynamic, dynamic>{
        "doctorID":d_id,
    "doctorName":doc_name,
    "patientName":patientName,
    "reservedDay" : reservedDay
    }),

  );
   emit(Appointmentsuccess());
   Map<String, dynamic> dataa = jsonDecode(appointResp.body);
   output.clear();
    if(appointResp.statusCode==200){
      print(dataa);
    //Map<String, dynamic> dataa = jsonDecode(appointResp.body);
    for(dynamic i in dataa['appointmentno'].values){
       output.add(i);
    }
    print(output);
        appointnum=output[4];
    // print(mn);
     print(appointnum);
   // appointnum=dataa['appointmentno']['appointmentNo1'];
    appointname=dataa['appointmentno']['patientName'];
   // print(doc_Links?.FaceBook_Link);
   //print(dataa);
   }
  //print(dataa);
   return appointResp;
} on Exception catch (e) {
  emit(Appointmentfailure());
  int t=0;
 return t;
}
  }
}
