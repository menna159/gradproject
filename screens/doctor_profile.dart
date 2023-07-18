
import 'package:final_dart/screens/patient_prof.dart';
import 'package:intl/intl.dart';
import 'package:final_dart/components/button.dart';
import 'package:final_dart/components/button2.dart';
import 'package:final_dart/components/textfield%20(2).dart';
import 'package:final_dart/screens/cubits/cubit/appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/cubit/cubit/cubit/cubit/cubit/all_doctor_cubit.dart';

//import 'package:horizontal_calendar/horizontal_calendar.dart';
DateTime dateTime = DateTime.now();

class docProf extends StatefulWidget {
  const docProf({super.key});

  @override
  State<docProf> createState() => _docProfState();
}

String? dateform;

class _docProfState extends State<docProf> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);
    //bool select=false;
    //int days = 10;
    final _formkey = GlobalKey<FormState>();
    String? appointname;
    TextEditingController name = TextEditingController(text: appointname);

    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        if(state is Appointmentloading){
          return Center(child: CircularProgressIndicator());
        }
        else{
        return Scaffold(
          appBar: AppBar(shadowColor: Colors.transparent,backgroundColor:Colors.white,),
            
            body: Stack(children: [
              Card(
                child: Image.asset(
                  'images/Vector 2.png',
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                clipBehavior: Clip.antiAlias,
              ),
              SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Stack(children: [
                      Card(
                        color: Color(0XffF5F5F5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        clipBehavior: Clip.antiAlias,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            SizedBox(
                              height: 65,
                            ),
                            Center(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                physics: ScrollPhysics(),
                                child: Form(
                                    key: _formkey,
                                    child: Wrap(
                                      spacing: 8.0, // gap between adjacent chips
  runSpacing: 4.0, // gap between lines
  direction: Axis.horizontal,
                                      children: [
                                        Text(
                                          'Dr : ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${BlocProvider.of<AllDoctorCubit>(context).name}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Center(
                              child: Text(
                                '${BlocProvider.of<AllDoctorCubit>(context).spech}',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0XffA0A0A0)),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Center(
                              child: Text(
                                '${BlocProvider.of<AllDoctorCubit>(context).city}',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0XffA0A0A0)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 45.0),
                              child: 
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded( 
                                      child:  Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left:.0),
                                          child: Text(
                                              '${BlocProvider.of<AllDoctorCubit>(context).phone}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0Xff82C4C3)),
                                            ),
                                        ),
                                      ),
                                      ),
                                    
                                     Padding(
                                       padding: const EdgeInsets.only(right:110.0),
                                       child: ElevatedButton(
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Icon(
                                                  Icons.phone,
                                                  color: Color(0xff82C4C3),
                                                ),
                                              ),
                                              Text(
                                                'Call now',
                                                style: TextStyle(
                                                    color: Color(0xff82C4C3)),
                                              )
                                            ],
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white70,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            fixedSize: Size(110, 40),
                                          ),
                                        ),
                                     ),
                                    
                                  ],
                                ),
                              ),
                            
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'From ',
                                  style: TextStyle(
                                    color: Color(0XffA0A0A0),
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'Monday ',
                                  style: TextStyle(
                                    color: Color(0XffAFCDCD),
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'To ',
                                  style: TextStyle(
                                    color: Color(0XffA0A0A0),
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'Friday',
                                  style: TextStyle(
                                    color: Color(0XffAFCDCD),
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      'Start time',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      '1:00 PM',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                  ),
                                ]),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Divider(
                                    indent: 10,
                                    endIndent: 10,
                                    color: Color(0xff82C4C3),
                                  ),
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                Column(children: [
                                  Text(
                                    'End time',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                  Text(
                                    '5:00 PM',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                ])
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Divider(
                              indent: 20,
                              endIndent: 20,
                              color: Color(0xff82C4C3),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Appointment ',
                                    style: TextStyle(
                                      color: Color(0XffAFCDCD),
                                      fontSize: 15,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3.0),
                                    child: Icon(
                                      Icons.calendar_month,
                                      color: Color(0XffAFCDCD),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          
                              TextFormField(
                                  controller: name,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'wrong name';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Name',
                                    hintStyle: TextStyle(
                                        fontSize: 15, color: Color(0xffA0A0A0)),
                                    enabledBorder: OutlineInputBorder(
                                      gapPadding: 12,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                        color: Color(0xff82C4C3),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      gapPadding: 12,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                        color: Color(0xff82C4C3),
                                      ),
                                    ),
                                  )),
                          
                            SizedBox(
                              height: 35,
                            ),
                            TextButton(
                              onPressed: () {
                                showdate();
                                print(dateform.runtimeType);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Select your date',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0XffAFCDCD),
                                        fontFamily: 'Inter'),
                                  ),
                                  Icon(
                                    Icons.menu_book_outlined,
                                    color: Color(0XffAFCDCD),
                                  ),
                                ],
                              ),
                            ),
                         
                            Center(child: Column(
                              children: [
                                Text('Your appointment number is : '
                                ,style: TextStyle(fontSize: 20,color: Colors.grey),),
                                BlocProvider.of<AppointmentCubit>(context).appointnum!=null?
                                Text('${BlocProvider.of<AppointmentCubit>(context).appointnum}'
                                ,style: TextStyle(fontSize: 20,color: Colors.black),):
                                Text('0'
                                ,style: TextStyle(fontSize: 20,color: Colors.black),),
                              ],
                            )),
                            
                            
                            SizedBox(
                              height: 10,
                            ),
                            
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  button2(
                                    textt: 'cancel',
                                    tcolor: 0XffAFCDCD,
                                    bcolor: 0XffFFFFFF,
                                    widthh: 150,
                                    func: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  button2(
                                      textt: 'Appointment',
                                      tcolor: 0XffFFFFFF,
                                      bcolor: 0XffAFCDCD,
                                      widthh: 150,
                                      func: () {
                                        if (_formkey.currentState!.validate()) {
                                          BlocProvider.of<AppointmentCubit>(
                                                  context)
                                              .addAppointment(
                                                  BlocProvider.of<AllDoctorCubit>(context).d__id,
                                                  'ahmed',
                                               name.text,
                                                  dateform);
                                                  print(dateform);
                                                  setState(() {
                                              //     print(BlocProvider.of<AppointmentCubit>(
                                              //     context)
                                              // .appointname);
                                                  });
                                                  
                                        }
                                      }),
                                  SizedBox(
                                    width: 15,
                                  )
                                ],
                              ),
                            
                            SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                      )
                    ]),
                  )),
              Padding(
                  padding: const EdgeInsets.only(bottom: 360),
                  child: Center(
                      child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            'images/doctor (2).png',
                          )))),
            ]));
      }
  });
  }

  dynamic showdate() {
    return showDatePicker(
            context: context,
            firstDate: DateTime(2000),
            lastDate: DateTime(2030),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                    primary: Color(0xff82C4C3),
                    onPrimary: Colors.white,

                    //surface: Color(0xff82C4C3),
                    onSurface: Colors.black,
                    background: Colors.white,
                  ),
                  dialogBackgroundColor: Color(0xffD8D8D8),
                  textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                    foregroundColor: Color(0xff82C4C3),
                  )),
                ),
                child: child!,
              );
            },
            initialDate: DateTime.now())
        .then((value) {
      dateTime = value!;
      dateform = DateFormat('EEE').format(dateTime);
    });
  }
}
