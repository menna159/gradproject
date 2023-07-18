import 'dart:convert';
import 'package:final_dart/models/doc_link_model.dart';
import "package:http/http.dart" as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'communication_state.dart';

class CommunicationCubit extends Cubit<CommunicationState> {
  CommunicationCubit() : super(CommunicationInitial());
   String? message;
  doc_links_model? doc_Links;
 Future<dynamic>? communicaton(dynamic id,dynamic whats, dynamic telegram, dynamic facebookk, dynamic gmail,
   )async {
          emit(communicationloading());
    try {

  dynamic commresp= await http.post(
    Uri.parse('https://clever-rose-mite.cyclic.app/communicationWays/store-ways'),
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
    if(commresp.statusCode==200){
    Map<String, dynamic> dataa = jsonDecode(commresp.body);
    doc_Links=doc_links_model.fromjson(dataa);
      return dataa;
   }
  
   return commresp;
} on Exception catch (e) {
  emit(communicationFailure());
  int t=0;
 return t;
}
  }
Future<dynamic>? editcommunication(dynamic id,dynamic whats, dynamic telegram, dynamic facebookk, dynamic gmail,
   )async {
          emit(communicationloading());
    try {

  dynamic commresp= await http.put(
    Uri.parse('https://clever-rose-mite.cyclic.app/communicationWays/update-ways'),
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
   if(commresp.statusCode==200){
   emit(communicationSuccess());
    Map<String, dynamic> dataa = jsonDecode(commresp.body);
    message=dataa['message'];
   return message;
  }
  
   return commresp;
} on Exception catch (e) {
  emit(communicationFailure());
  int t=0;
 return t;
}
  }
  Future<dynamic>? getCommunication(dynamic id
   )async {
          emit(communicationloading());
    try {

  dynamic commresp= await http.post(
    Uri.parse('https://clever-rose-mite.cyclic.app/communicationWays/show-ways'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<dynamic, dynamic>{
      'd_id':id,
     
    }),

  );
  Map<String, dynamic> dataa = jsonDecode(commresp.body);
   if(commresp.statusCode==200){
   emit(communicationSuccess());
     //print(dataa);
     //print(dataa);
     dynamic alllinkss=dataa['response'];
     //print(alllinkss);
    dynamic links=alllinkss[alllinkss.length-1];
    //print(links);
    doc_Links=doc_links_model(FaceBook_Link: links['FaceBook_Link'],
    Gmail_Link: links['Gmail_Link'],
    Telegram_Link:links['Telegram_Link'],
    WhatsApp_Link:links ['WhatsApp_Link'] );
    print(doc_Links?.WhatsApp_Link);
   // message=dataa['message'];
   
   return dataa;

  }
 
   return commresp;
} on Exception catch (e) {
  emit(communicationFailure());
  int t=0;
 return t;
}
  }



}
