import 'dart:math';

import 'package:final_dart/models/appontmentmodel.dart';
import 'package:final_dart/screens/appointments.dart';
import 'package:final_dart/screens/cubits/cubit/auth_cubit.dart';
//import 'package:final_dart/screens/cubits/cubit/cubit/cubit/allapointments_cubit.dart';
import 'package:final_dart/screens/cubits/cubit/cubit/cubit/cubit/cubit/all_doctor_cubit.dart';
import 'package:final_dart/screens/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import '../components/features_containers.dart';
import '../components/features_containers.dart';
import '../components/navbar.dart';
import 'cubits/cubit/cubit/cubit/cubit/cubit/cubitttt/allapointments_cubit.dart';

class HomeDoctor extends StatefulWidget {
  const HomeDoctor({super.key});

  @override
  State<HomeDoctor> createState() => _HomeDoctorState();
}

class _HomeDoctorState extends State<HomeDoctor> {
  @override
  Widget build(BuildContext context) {
    final currentwidth = MediaQuery.of(context).size.width;
    int flag=0;
    return BlocBuilder<AllapointmentsCubit, AllapointmentsState>(
      builder: (context, state) {
        if(state is Allappointmentloading){
          return Center(child: CircularProgressIndicator());
        }
        else if(state is Allappointmentsuccess){
          if(BlocProvider.of<AuthCubit>(context).docc?.id!=null){
            return appointments();
          }
          else{
            return Logo();
          }
        }
       
        else{
        return Scaffold(
          
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'Home',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
            iconTheme: IconThemeData(color: Colors.black),
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
          ),
          endDrawer: Navbar(context,name: BlocProvider.of<AuthCubit>(context).docc?.name,),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22, top: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Features(
                              
                              image: 'images/photo_2023-07-10_22-45-47 (2).jpg',
                              width: 168,
                              height: 170,
                            ),
                            Features(
                              image: 'images/photo_2023-07-10_22-45-48.jpg',
                              width: 168,
                              height: 220,
                              ontap: (){
                                 print('done');
                              },
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Features(
                              image: 'images/photo_2023-07-10_22-45-48 (2).jpg',
                              width: 168,
                              height: 220,
ontap: () {
                                setState(() {
                                  flag=3;
                                });
                                print('done');
                                dynamic doctor_id =
                                    BlocProvider.of<AuthCubit>(context)
                                        .docc
                                        ?.id;
                                        print(BlocProvider.of<AuthCubit>(context).docc?.id);
                                BlocProvider.of<AllapointmentsCubit>(context)
                                    .showAppointment(BlocProvider.of<AuthCubit>(context).docc?.id);

                                    
                               
                              },
                            ),
                            Features(
                              image: 'images/photo_2023-07-10_22-45-47.jpg',
                              width: 168,
                              height: 170,
                              ontap: (){BlocProvider.of<AllDoctorCubit>(context).alldoctors;}
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 200, left: 225),
                      child: Image.asset(
                        'images/1.jpg',
                        width: 105,
                        height: 100,
                      ),
                    ),
          //           ElevatedButton(onPressed: ()async{
          // await BlocProvider.of<AuthCubit>(context).alldoctors;
          //           }, child: Text('tap'))
                  ],
                ),
              ),
            ],
          ),
        );
      }
  });
  }
}