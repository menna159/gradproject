import 'package:final_dart/components/snack.dart';
import 'package:final_dart/screens/cubits/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:helloworld/cubits/alldoctors/all_doctors_cubit_cubit.dart';

import '../components/treatment_card.dart';
//import 'cubits/cubit/cubit/cubit/allapointments_cubit.dart';
// import 'components/treatment_card.dart';

class drugforpatient extends StatefulWidget {
  const drugforpatient({super.key});

  @override
  State<drugforpatient> createState() => _drugforpatientState();
}

class _drugforpatientState extends State<drugforpatient> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);
    return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, State) {
      if (State is Logincubitloading) {
        return Center(child: CircularProgressIndicator());
      } else if (State is Logincubitsuccess) {
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(color: Colors.black),
            title: Center(
                child: Text(
              "Treatment",
              style: TextStyle(fontSize: 16, color: Colors.black),
            )),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
             physics: ScrollPhysics(),
            scrollDirection: Axis.vertical,
            child:  Column(
                children: [
                  SizedBox(
                    height: 34,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: SizedBox(
                       height: query.size.height/1.4,
                      child:BlocProvider.of<AuthCubit>(context).alltreatments==null?Container():
                       ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: BlocProvider.of<AuthCubit>(context)
                            .alltreatments.length,
                        itemBuilder: (context, index) {
                          return 
                          Row(
                            children: [
                              
                              treatment_card(
                             
                              
                                  TreatmentTimes: BlocProvider.of<AuthCubit>(context).alltreatments[index].howOften,
                                  TreatmentName: BlocProvider.of<AuthCubit>(context).alltreatments[index].drugName,
                                  TreatmentDescription:
                                      "treatment of mild to moderate pain and fever   "),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  
                  
                ],
              ),
            ),
          
        );
      } else {
        return Text('some thing went wrong');
      }
    });
  }
  dismiss(int indexx) {
dynamic user =BlocProvider.of<AuthCubit>(context).alltreatments[indexx];
setState(() {
  BlocProvider.of<AuthCubit>(context).alltreatments.remove(user);
  print('done');
});
  }
  Future opennnDialog() {
    TextEditingController name = TextEditingController();
  TextEditingController information = TextEditingController();
  TextEditingController num_of_times = TextEditingController();
    final _formkey = GlobalKey<FormState>();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.start,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            content: SizedBox(
              height: 215,
              width: 220,
              child:
            //    SingleChildScrollView(
            //      physics: ScrollPhysics(),
            // scrollDirection: Axis.vertical,
            //     child: 
                Form(
                  key: _formkey,
                  child:  Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 2),
                          child: Text(
                            'Name',
                            style:
                                TextStyle(color: Color(0xff82C4C3), fontSize: 16),
                          ),
                        ),
                        TextFormField(
                          controller: name,
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length < 3) {
                              return 'Please enter name';
                            }
                            return null;
                          },keyboardType: TextInputType.name,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'information',
                          style: TextStyle(color: Color(0xff82C4C3), fontSize: 16),
                        ),
                        TextFormField(
                          controller: information,
                          validator: (value) {
                            if (value == null  ||value.isEmpty||value.length < 6) {
                              return 'Please enter some information';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Num of times',
                          style: TextStyle(color: Color(0xff82C4C3), fontSize: 16),
                        ),
                        TextFormField(
                          controller: num_of_times,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter number of times';
                            }
                            return null;
                          },keyboardType: TextInputType.number,
                        )
                      ],
                    ),
                  ),
              ),
              
            
            title: Center(
                child: Text(
              'Add treatment',
              style: TextStyle(color: Color(0xff82C4C3), fontSize: 16),
            )),
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Color(0xff82C4C3), fontSize: 18),
                    )),
              ),
              SizedBox(
                width: 110,
              ),
              TextButton(
                  onPressed: () async{
                    if(_formkey.currentState!.validate()){
                  await BlocProvider.of<AuthCubit>(context).add_treatments('1',
                   '6458315ccbbe312b637a7fc0', name.text, num_of_times.text, information.text);
                  Navigator.pop(context);
                 
                    }
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(color: Color(0xff82C4C3), fontSize: 18),
                  )),
            ],
          );
        });
  }

}
