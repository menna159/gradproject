import 'package:final_dart/screens/communication.dart';
import 'package:final_dart/screens/cubits/cubit/communication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class chat_with_doctor extends StatefulWidget {
   chat_with_doctor({super.key});

  @override
  State<chat_with_doctor> createState() => _chat_with_doctorState();
}

class _chat_with_doctorState extends State<chat_with_doctor> {
   SharedPreferences? links;
    dynamic whatsapp;
    dynamic facebook;
    dynamic telegram;
    dynamic gmail;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  initial()async{
    links=await SharedPreferences.getInstance();
    setState(() {
      whatsapp=links?.getString('whatsapp');
       facebook=links?.getString('facebook');
       telegram=links?.getString('telegram');
       gmail=links?.getString('gmail');
    });
  }
  @override
  Widget build(BuildContext context) {
   
    dynamic whatsapp=Uri.parse('${BlocProvider.of<CommunicationCubit>(context).doc_Links?.WhatsApp_Link}');
    dynamic gmail=Uri.parse('${BlocProvider.of<CommunicationCubit>(context).doc_Links?.Gmail_Link}');
    dynamic facebook=Uri.parse('${BlocProvider.of<CommunicationCubit>(context).doc_Links?.FaceBook_Link}');
    dynamic telegram=Uri.parse('${BlocProvider.of<CommunicationCubit>(context).doc_Links?.Telegram_Link}');
    return Scaffold(
      appBar: AppBar(title: Center(child:Text('Chat with doctor',
      style: TextStyle(color: Colors.black,fontSize: 16),)),
      shadowColor: Colors.transparent,backgroundColor:Colors.transparent,),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center ,
        children: [
        Image.asset('images/Online Doctor-pana.png',width: 200,height: 200,),
        Text('Please select a method of contact',style: TextStyle(color: Color(0XffA0A0A0),fontSize: 10)),
 SizedBox(height: 40,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/whatsapp (1).png',width: 30,height: 30,),
            TextButton(onPressed: (){
         if( BlocProvider.of<CommunicationCubit>(context).doc_Links?.WhatsApp_Link==null){
          launchUrl(whatsapp);}
            }, child: Text(' Open in whatsapp',style: TextStyle(color: Colors.black,fontSize: 15)))
          ],
        ),        SizedBox(height: 8,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/telegram.png',width: 30,height: 30,),
            TextButton(onPressed: (){
if( BlocProvider.of<CommunicationCubit>(context).doc_Links?.Telegram_Link==null){
          launchUrl(telegram);}
            }, child: Text(' Open in telegram',style: TextStyle(color: Colors.black,fontSize: 15)))
          ],
        ),
                SizedBox(height: 8,),

        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/facebook.png',width: 30,height: 30,),
            TextButton(onPressed: ()async{
               if( await canLaunchUrl(facebook)){
               await launchUrl(facebook);
            }
            else{
              print(BlocProvider.of<CommunicationCubit>(context).doc_Links?.FaceBook_Link);
              throw 'could not launch facebook ';
            }
            }, child: Text(' Open in facebook',style: TextStyle(color: Colors.black,fontSize: 15)))
          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/gmail.png',width: 30,height: 30,),
            Padding(padding: EdgeInsets.only(left: 20)),
            TextButton(onPressed: ()async{
         
            if( await canLaunchUrl(gmail)){
               await launchUrl(gmail);
            }
            else{
              print(BlocProvider.of<CommunicationCubit>(context).doc_Links?.Gmail_Link);
              throw 'could not launch gmail';
            }
            // if(gmail!=null){
            //   await launchUrl(gmail);
            // }
          }, child: Text('Open in gmail',style: TextStyle(color: Colors.black,fontSize: 15)))
          ],
        ),        SizedBox(height: 8,),
Align(alignment: Alignment.bottomRight,child: SizedBox(height: 92,width: 105,child: Image.asset('images/note(1).png'))),   
      ]),
    );
  }
}