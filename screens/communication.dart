import 'package:final_dart/components/button.dart';
import 'package:final_dart/components/text_form_field.dart';
import 'package:final_dart/screens/cubits/cubit/auth_cubit.dart';
import 'package:final_dart/screens/cubits/cubit/communication_cubit.dart';
import 'package:final_dart/screens/edit_communication.dart';
import 'package:final_dart/screens/home_doc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/snack.dart';
import 'home_docc.dart';

class comunicationWays extends StatefulWidget {
   comunicationWays({super.key});

  @override
  State<comunicationWays> createState() => _comunicationWaysState();
}

class _comunicationWaysState extends State<comunicationWays> {
SharedPreferences? links;
bool? isLoading = false;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial()async{
links=await SharedPreferences.getInstance();
  }
  @override
  Widget build(BuildContext context) {
    
    TextEditingController Whatsapp=TextEditingController(text: BlocProvider.of<CommunicationCubit>(context).doc_Links?.WhatsApp_Link);
    TextEditingController telegram=TextEditingController(text: BlocProvider.of<CommunicationCubit>(context).doc_Links?.Telegram_Link);
    TextEditingController facebookk=TextEditingController(text: BlocProvider.of<CommunicationCubit>(context).doc_Links?.FaceBook_Link);
    TextEditingController gmaill=TextEditingController(text: BlocProvider.of<CommunicationCubit>(context).doc_Links?.Gmail_Link);
    
     MediaQueryData query = MediaQuery.of(context);
      final _formkey = GlobalKey<FormState>();
      
        return
         BlocBuilder<CommunicationCubit, CommunicationState>(
      
      builder: (context, state)  {
       if(state is communicationloading){ return Center(child: CircularProgressIndicator());}
         else if(state is communicationSuccess){
          links ?.setString('whatsapp',BlocProvider.of<CommunicationCubit>(context).doc_Links?.WhatsApp_Link);
     links?.setString('facebook', BlocProvider.of<CommunicationCubit>(context).doc_Links?.FaceBook_Link);
     links?.setString('gmail', BlocProvider.of<CommunicationCubit>(context).doc_Links?.Gmail_Link);
     links?.setString('telegram', BlocProvider.of<CommunicationCubit>(context).doc_Links?.Telegram_Link);
   
          return HomeDoctor();} 
         else{return 
          Scaffold(
      
appBar: AppBar(title: Center(child:Text('Communication ways',style: TextStyle(color: Colors.black),)),shadowColor: Colors.transparent,backgroundColor:Colors.transparent,),
body: Form(
  key: _formkey,
  child:   ListView(
    children:[ Column(children: [
    
    Image.asset('images/undraw_Online_messaging_re_qft3.png', height: 163.48,
                            width: 163.48,),
    Padding(
      padding: const EdgeInsets.only(left: 21.0, right: 22.0),
      child: SizedBox(
        width: query.size.width,
        child: TextFormField(
          controller: Whatsapp,
           validator: (value) {
                            if (value == null 
                               || value.isEmpty 
                              ) {
                              return 'enter the link';
                            } else {
                              return null;
                            }},
          decoration: InputDecoration(labelText: ' |  Whatsapp Link',
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left:15.0,right: 5),
            child: Image.asset('images/whatsapp (1).png',width: 16,height: 16,),
          ),
          border: OutlineInputBorder(),enabledBorder: OutlineInputBorder(
                                  gapPadding: 12,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Color(0xff82C4C3),
                                  ),
                                ),
                                 contentPadding: EdgeInsets.symmetric(horizontal: 90),
          ),
        ),
      ),
    ), const SizedBox(
                  height: 5,
                ), Padding(
      padding: const EdgeInsets.only(left: 21.0, right: 22.0),
      child: SizedBox(
        width: query.size.width,
        child: TextFormField(
          controller: telegram,
          validator: (value) {
                            if (value == null 
                               || value.isEmpty 
                              ) {
                              return 'enter the link';
                            } else {
                              return null;
                            }},
          decoration: InputDecoration(labelText: ' |  Telegram Link',
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left:15.0,right: 5),
            child: Image.asset('images/telegram.png',width: 16,height: 16,),
          ),
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
                                  gapPadding: 12,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Color(0xff82C4C3),
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 90),
          ),
        ),
      ),
    ),const SizedBox(
                  height: 5,
                ), Padding(
      padding: const EdgeInsets.only(left: 21.0, right: 22.0),
      child: SizedBox(
        width: query.size.width,
        child: TextFormField(
          controller: facebookk,
          validator: (value) {
                            if (value == null 
                               || value.isEmpty 
                              ) {
                              return 'enter the link';
                            } else {
                              return null;
                            }},
          decoration: InputDecoration(labelText: ' |  Facebook Link',
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left:15.0,right: 5),
            child: Image.asset('images/facebook.png',width: 16,height: 16,),
          ),
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
                                  gapPadding: 12,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Color(0xff82C4C3),
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 90),
          ),
        ),
      ),
    ),
    const SizedBox(
                  height: 5,
                ),
     Padding(
      padding: const EdgeInsets.only(left: 21.0, right: 22.0),
       child: SizedBox(
        width: query.size.width,
         child: TextFormField(
            controller: gmaill,
            validator: (value) {
                            if (value == null 
                               || value.isEmpty 
                              ) {
                              return 'enter the link';
                            } else {
                              return null;
                            }},
          decoration: InputDecoration(labelText: ' |  Email Link',
          prefixIcon:  Padding(
            padding: const EdgeInsets.only(left:15.0,right: 5),
            child: Image.asset('images/gmail.png',width: 16,height: 16,),
            
          ),
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
                                  gapPadding: 12,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Color(0xff82C4C3),
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 90),
          ),
    ),
       ),
     ),
    Padding(
      padding: const EdgeInsets.only(top:70,left: 21.0, right: 22.0),
      child: buttonn(text: 'Save', width: query.size.width,onPressed: (){
  if(_formkey.currentState!.validate()){
      dynamic d_id=BlocProvider.of<AuthCubit>(context).docc?.id;
      BlocProvider.of<CommunicationCubit>(context).communicaton(d_id,Whatsapp.text, telegram.text, facebookk.text, gmaill.text);
     
    ShowSnackbar(context, 'done');
    
  }
      }),
    ),
    
    Align(alignment: Alignment.bottomRight,child: SizedBox(height: 92,width: 105,child: Image.asset('images/note(1).png'))),
    
    
    ]),
  ]),
),


    );
         }} 
          
          );
      }
}