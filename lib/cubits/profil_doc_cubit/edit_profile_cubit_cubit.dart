import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'edit_profile_cubit_state.dart';

class EditProfileCubitCubit extends Cubit<EditProfileCubitState> {
  EditProfileCubitCubit() : super(edit_doc_pro_initial());
  dynamic resp;
  dynamic msg;
  dynamic messg;
  Future Edit_profile(
      {dynamic doc_id,
      dynamic name,
      dynamic username,
      // dynamic email,
      // dynamic password,
      dynamic phone,
      dynamic specialization,
      dynamic dates,
      dynamic city_name}) async {
    emit(edit_doc_pro_loading());
    http.Response response = await post(
      Uri.parse('https://clever-rose-mite.cyclic.app/doctorprofile/updatedr'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "doctorID": doc_id,
        'name': name,
        'username': username,
        // "email": email,
        // "password": password,
        "phone": phone,
        "specialization": specialization,
        "Dates": dates,
        "city": city_name,
      }),
    );
    Map<String, dynamic> dataa = jsonDecode(response.body);

    if (response.statusCode == 200) {
      emit(edit_doc_pro_success());
      // dynamic id = docc?.id;
      // doctor_id = docc?.id;
      msg = dataa['message'];
      print(response.body);
    } else {
      emit(edit_doc_pro_failure());
      print(response.body);
    }
  }

  
}
