import 'package:final_dart/components/snack.dart';
import 'package:final_dart/models/appontmentmodel.dart';
import 'package:final_dart/screens/cubits/cubit/auth_cubit.dart';
//import 'package:final_dart/screens/cubits/cubit/cubit/cubit/allapointments_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../components/search.dart';
import 'appontments_weigets.dart';
import 'cubits/cubit/cubit/cubit/cubit/cubit/cubitttt/allapointments_cubit.dart';

class appointments extends StatefulWidget {
  const appointments({super.key});

  @override
  State<appointments> createState() => _appointmentsState();
}

Color search = Color(0xffAFCDCD);
Color iconsearch = Color(0xffB8DFDF);
Color border = Color(0xffD9E7E6);

class _appointmentsState extends State<appointments> {
  @override
  Widget build(BuildContext context) {
    List listofappointments=[];
    int flag=0;
    return BlocBuilder<AllapointmentsCubit, AllapointmentsState>(
      builder: (context, state) {
        if(state is Allappointmentloading){
          return Center(child: CircularProgressIndicator());}
        
        else{
        return Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                  onPressed: ()async {
                   await BlocProvider.of<AllapointmentsCubit>(context).deleteAppointment('64369d55f52cda6cf3a4c2af');
                   BlocProvider.of<AllapointmentsCubit>(context).allapointment.clear();
                    //dynamic msg=BlocProvider.of<AllapointmentsCubit>(context).message;
                    //ShowSnackbar(context, 'All Appointements Deleted successfully!!!');
                  },
                  child: Center(
                    child: Text(
                      'Delete All',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff82C4C3),
                          fontWeight: FontWeight.w400),
                    ),
                  ))
            ],
            leading: IconButton(
                color: Colors.black,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/Scan_Type');
                }),
            title: Center(
              child: Text(
                "Appointment",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
              ),
            ),
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            physics: ScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 24, top: 25),
                    child: TextFormField(
                      onFieldSubmitted: (value)async {
                        
                        dynamic mn= await BlocProvider.of<AllapointmentsCubit>(context)
                            .showspecificAppointment(value,BlocProvider.of<AuthCubit>(context).docc?.id);
                            setState(() {
                          listofappointments= BlocProvider.of<AllapointmentsCubit>(context).allapointment;
                         
                          //print(BlocProvider.of<AllapointmentsCubit>(context).allapointment);
                        });
                            //listofappointments= BlocProvider.of<AllapointmentsCubit>(context).allapointment;
                            print(BlocProvider.of<AllapointmentsCubit>(context).allapointment);
                            
                            
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: border,
                            ),
                          ),
                          labelText: 'search',
                          labelStyle: TextStyle(color: search),
                          prefixIcon: Icon(
                            Icons.search,
                            color: iconsearch,
                          )),
                    )),
                 BlocProvider.of<AllapointmentsCubit>(context).allapointment.isEmpty?Container():
                    ListView.builder(itemCount: BlocProvider.of<AllapointmentsCubit>(context).allapointment.length,
                    scrollDirection: Axis.vertical,
                      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics()
                    
                      ,itemBuilder: (context, index) {
                        //print('done');
                      return 
                         Slidable(
                          endActionPane: ActionPane(
                            motion: StretchMotion(),
                            //dismissible: DismissiblePane(confirmDismiss: dismiss(index)),
                            children: [
                              SlidableAction(icon: Icons.delete,
                              backgroundColor: Colors.red,
                              label: 'Delete',
                              onPressed: (context) => dismiss(index),
                              )
                            ],
                          ),
                           child: New_appointments(
                            name: BlocProvider.of<AllapointmentsCubit>(context).allapointment[index]['patientName'],
                            day: BlocProvider.of<AllapointmentsCubit>(context).allapointment[index]['reservedDay'],
                           ),
                         );
                    
              },)
                // Cancelled(),
                // New_appointments(),
              ],
            ),
          ),
        );
      }
  });
  }
  
  dismiss(int indexx) {
dynamic user =BlocProvider.of<AllapointmentsCubit>(context).allapointment[indexx];
setState(() {
  BlocProvider.of<AllapointmentsCubit>(context).allapointment.remove(user);
  print('done');
});
  }
}
