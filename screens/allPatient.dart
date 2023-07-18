//import 'dart:html';


import 'dart:io' as io;
import 'package:final_dart/screens/cubits/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:image_picker/image_picker.dart';
import '../components/navbar.dart';

class allPatient extends StatefulWidget {
   allPatient({super.key});

  @override
  State<allPatient> createState() => _allPatientState();
}

class _allPatientState extends State<allPatient> {
ImagePicker picker = ImagePicker();

      List<XFile>? images;

  @override
  Widget build(BuildContext context) {
    
      
    //             late Future <XFile?> PickedFileee;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
      ),
      endDrawer: Navbar(context,name: BlocProvider.of<AuthCubit>(context).docc?.name,),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'search',
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
          Text(
            'All patients',
            style: TextStyle(color: Colors.blue),
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
              ),
              onPressed: () async{
                images = await picker.pickMultiImage();
                  setState(() {
                        //update UI
                      });
                  }, 
               //PickedFileee=picker.pickImage(source: ImageSource.camera);
              
              child: Icon(Icons.add)),
            //  FutureBuilder<XFile?>(
            //   future: PickedFileee,
              
            //   builder:(context, snapshot) {
            //      if (snapshot.hasData) {
            //       return Container(
            //         color: Colors.blue,
            //         child: Image.file(File:snapshot.data.path);
            //           fit: BoxFit.contain,
            //         ),
            //       );
              
            
              images==null?CircularProgressIndicator():
             Image.file(io.File(images![0].path))
        ],
      ),
    
    );
  }
}
