import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'communication_state.dart';

class CommunicationCubit extends Cubit<CommunicationState> {
  CommunicationCubit() : super(CommunicationInitial());
  late String message;
 Future<dynamic>? communicaton(dynamic id,dynamic whats, dynamic telegram, dynamic facebookk, dynamic gmail,
   )async {
          emit(communicationloading());
    try {

  dynamic commresp= await http.post(
    Uri.parse('https://project-zxjs.onrender.com/communicationWays/store-ways'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<dynamic, dynamic>{
      'd_id':id,
      "WhatsApp_Link":whats,
   "Telegram_Link":telegram,
   "FaceBook_Link":facebookk,
   "Gmail_Link":gmail
    }),

  );
   emit(communicationSuccess());
    Map<String, dynamic> dataa = jsonDecode(commresp.body);
   print(dataa);
  
   return commresp;
} on Exception catch (e) {
  emit(communicationFailure(errorMessage: 'something went wrong'));
  int t=0;
 return t;
}
  }



}
