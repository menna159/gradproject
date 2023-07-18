import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../../../../../../models/all.dart';
part 'all_doctor_state.dart';

class AllDoctorCubit extends Cubit<AllDoctorState> {
    List<DoctorsModel> alldoctors=[];
    List allspech=[];
    dynamic name;
    dynamic spech;
    dynamic phone;
    dynamic city;
    dynamic d__id;
  AllDoctorCubit() : super(AllDoctorsInitial());
  Future<dynamic>? alldoctor()async{
    emit(Alldoctorsloading());
 dynamic respo= await http.get(Uri.parse('https://clever-rose-mite.cyclic.app/alldoctors/show-all-doctors'));
 Map<String, dynamic> alldataa = jsonDecode(respo.body);
 if(respo.statusCode==200){
  emit(Alldoctorssuccess());
 dynamic filedata=alldataa['response'];

for(dynamic i in filedata){
  
  //print(i);
alldoctors.add(DoctorsModel(dId: i['d_id'],
 name: i['name'],
  username: i['username'],
   email:  i['email'], 
   password: i['password'],
    phone:i['phone'] ,
     specialization: i['specialization'], 
     dates: i['Dates'],
     city: i['city']
      ));
       
       
}
for(dynamic i in alldoctors){
  allspech.add(i.specialization);
}
 print(alldoctors);
 return alldoctors;}
 else{
  return alldoctors;
 }
 }
//  Future<dynamic>? alldoctorbyspecialization(dynamic spec)async{
//     emit(Alldoctorsloading());
//  dynamic respo= await http.post(Uri.parse('https://clever-rose-mite.cyclic.app/alldoctors/show-doctor-by-specializaion'));
//  Map<String, dynamic> alldataa = jsonDecode(respo.body);
//  if(respo.statusCode==200){
//   emit(Alldoctorssuccess());
//  dynamic filedata=alldataa['response'];
// alldoctors.clear();
// for(dynamic i in filedata){
  
//   //print(i);
// alldoctors.add(DoctorsModel(dId: i['d_id'],
//  name: i['name'],
//   username: i['username'],
//    email:  i['email'], 
//    password: i['password'],
//     phone:i['phone'] ,
//      specialization: i['specialization'], 
//      dates: i['Dates'],
//       ));
       
       
// }
// // for(dynamic i in alldoctors){
// //   //allspech?.add(i.specialization);
// // }
//  print(alldoctors);
//  return alldoctors;}
//  else{
//   return alldoctors;
//  }
//  }
Future<dynamic>? alldoctorbyspecialization(dynamic spec
   )async {
          emit(Alldoctorsloading());
    try {

  dynamic commresp= await http.post(
    Uri.parse('https://clever-rose-mite.cyclic.app/alldoctors/show-doctor-by-specializaion'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<dynamic, dynamic>{
      "doctorSpecializaion":spec,
     
    }),

  );
  Map<String, dynamic> dataa = jsonDecode(commresp.body);
   if(commresp.statusCode==200){
  emit(Alldoctorssuccess());
 dynamic filedata=dataa['response'];
alldoctors.clear();
for(dynamic i in filedata){
  
  //print(i);
alldoctors.add(DoctorsModel(dId: i['d_id'],
 name: i['name'],
  username: i['username'],
   email:  i['email'], 
   password: i['password'],
    phone:i['phone'] ,
     specialization: i['specialization'], 
     dates: i['Dates'],
     city: i['city']
      ));
       
       
}

  }
 
   return commresp;
} on Exception catch (e) {
  emit(Alldoctorsfailure());
  int t=0;
 return t;
}
  }
  Future<dynamic>? alldoctorbyName(dynamic name
   )async {
          emit(Alldoctorsloading());
    try {

  dynamic commresp= await http.post(
    Uri.parse('https://clever-rose-mite.cyclic.app/alldoctors/show-doctor-by-Name'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<dynamic, dynamic>{
      "doctorname":name,
     
    }),

  );
  Map<String, dynamic> dataa = jsonDecode(commresp.body);
   if(commresp.statusCode==200){
  emit(Alldoctorssuccess());
 dynamic filedata=dataa['response'];
alldoctors.clear();
for(dynamic i in filedata){
  
  //print(i);
alldoctors.add(DoctorsModel(dId: i['d_id'],
 name: i['name'],
  username: i['username'],
   email:  i['email'], 
   password: i['password'],
    phone:i['phone'] ,
     specialization: i['specialization'], 
     dates: i['Dates'],
     city: i['city']
      ));
       
       
}

  }
 
   return commresp;
} on Exception catch (e) {
  emit(Alldoctorsfailure());
  int t=0;
 return t;
}
  }

}
