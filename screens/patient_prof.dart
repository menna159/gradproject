import 'package:final_dart/components/textfield%20(2).dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/text_form_field.dart';

class patientProf extends StatelessWidget {
   patientProf({super.key});
TextEditingController phonecontroller = TextEditingController();
final List<Map> myProducts =
      List.generate(100000, (index) => {"id": index, "name": "Product $index"})
          .toList();
  @override
  Widget build(BuildContext context) {
  MediaQueryData query = MediaQuery.of(context);
    return Scaffold(
appBar: AppBar(title: Center(child: Text('Personal information',style: TextStyle(color: Colors.black),)),
backgroundColor: Colors.transparent,
shadowColor: Colors.transparent,),
body:ListView(
  scrollDirection: Axis.vertical,
  children:[   Column(
  
    children: [
  
      Center(child: SizedBox(width: 70,
  
      height: 70
  
        ,child: Image.asset('images/personal-data.png'))),
  
      Padding(
  
        padding: const EdgeInsets.only(bottom: 10),
  
        child: Text('Nada Mohamed',style: TextStyle(color: Colors.black),),
  
      ),
  
      Padding(
  
        padding: const EdgeInsets.only(bottom: 10),
  
        child: Text('@nada_m',style: TextStyle(color: Colors.grey),),
  
      ),
  
      Padding(
  
        padding: const EdgeInsets.only(bottom: 30),
  
        child: Row(
  
          mainAxisAlignment: MainAxisAlignment.center,
  
          children:[
  
          Text('Last date:',style: TextStyle(color: Colors.black),),
  
          Text('Feb24',style: TextStyle(color: Colors.grey),),
  
        ]),
  
      ),
  
      Row(
  
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  
        children: [
  
          Column(
  
            children: [
  
              Text('Cancer Type',style: TextStyle(color: Colors.black),),
  
              Text('Breast',style: TextStyle(color: Colors.grey),),
  
            ],
  
          )
  
          ,Column(
  
             children: [
  
              Text('Gender',style: TextStyle(color: Colors.black),),
  
              Text('female',style: TextStyle(color: Colors.grey),),
  
            ],
  
          )
  
          ,Column(
  
             children: [
  
              Text('Age',style: TextStyle(color: Colors.black),),
  
              Text('29',style: TextStyle(color: Colors.grey),),
  
            ],
  
          )
  
          ,Column(
  
             children: [
  
              Text('Phone',style: TextStyle(color: Colors.black),),
  
              Text('01478944444',style: TextStyle(color: Colors.grey),),
  
            ],
  
          )
  
        ],
  
      ),
  
      Divider(
  
        indent: 10,
  
        endIndent: 10,
  
        color: Color(0xff82C4C3),
  
      ),
  
      Padding(
  
        padding: const EdgeInsets.only(top:5.0,bottom: 5,left: 7,right: 14),
  
        child: TextField(decoration: InputDecoration(
  
  label:Text('Diagnosis'),
  
  border: OutlineInputBorder(),
  
  contentPadding: EdgeInsets.symmetric(vertical: 40,horizontal: 33)
  
        ),),
  
      ),
  
       Row(children:[
  
         SizedBox(width: query.size.width/2.1,child: Padding(
  
           padding: const EdgeInsets.only(left: 7),
  
           child: TextField(
  
            decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Treatment',contentPadding: EdgeInsets.symmetric(vertical: 50,horizontal: 14)),
  
           ),
  
         )),
  
         Padding(
  
           padding: const EdgeInsets.only(left:5.0),
  
           child: SizedBox(width: query.size.width/2,child: Padding(
  
             padding: const EdgeInsets.only(right:2.0),
  
             child: TextField(
  
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Notes',contentPadding: EdgeInsets.symmetric(vertical: 50,horizontal: 14)),
  
             ),
  
           )),
  
         )
  
        ],),
  
        Padding(
  
          padding: const EdgeInsets.only(top:5.0),
  
          child: Row(children:[
  
           SizedBox(width: query.size.width/2.1,child: Padding(
  
             padding: const EdgeInsets.only(left: 7),
  
             child: TextField(
  
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Abnormal symptoms',contentPadding: EdgeInsets.symmetric(vertical: 50,horizontal: 14)),
  
             ),
  
           )),
  
           Padding(
  
             padding: const EdgeInsets.only(left:5.0),
  
             child: SizedBox(width: query.size.width/2,child: Padding(
  
               padding: const EdgeInsets.only(right:2.0),
  
               child: TextField(
  
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Additional information',contentPadding: EdgeInsets.symmetric(vertical: 50,horizontal: 14)),
  
               ),
  
             )),
  
           )
  
          ],),
  
        ),
  
        Padding(
  
          padding: const EdgeInsets.only(right: 602,top: 22),
  
          child: Text('Photos',style: TextStyle(color: Color(0xff82C4C3)),),
  
        ),
       Column(
        children:[ Padding(
          padding: const EdgeInsets.only(left:9),
          child: Row(
            
            children: [
Padding(
  padding: const EdgeInsets.all(2.0),
  child:   Image.asset('images/images (1).jpg'),
),
Padding(
  padding: const EdgeInsets.all(2.0),
  child:   Image.asset('images/images (1).jpg'),
),
Padding(
  padding: const EdgeInsets.all(2.0),
  child:   Image.asset('images/images (1).jpg'),
),
            ],),
        ),
         Padding(
           padding: const EdgeInsets.only(left: 9),
           child: Row(
            children: [
Padding(
  padding: const EdgeInsets.all(2.0),
  child:   Image.asset('images/images (1).jpg'),
),
Padding(
  padding: const EdgeInsets.all(2.0),
  child:   Image.asset('images/images (1).jpg'),
),
Padding(
  padding: const EdgeInsets.all(2.0),
  child:   Image.asset('images/images (1).jpg'),
),
        ],),
         ),
    ])
  
      ]),]
)

    // Column(
    //   children: [
    //     TextFormField(
    //   decoration: InputDecoration(
    //     labelText: 'Diagnosis',
    //     border: OutlineInputBorder()
        
    //   ),
    // ),
   
    //     TextFormField(
    //   decoration: InputDecoration(
    //     labelText: 'Diagnosis',
    //     border: OutlineInputBorder(
           
    //     )
    //   )),
    //   Row(
        
    //     children: [

    //   SizedBox(
    //     width: 280,
    //     child: TextFormField(
          
    //       decoration: InputDecoration(
    //         labelText: 'Diagnosis',
    //         border: OutlineInputBorder()
            
    //       ),
    //     ),
    //   ),
    
    // SizedBox(
    //   width: 280,
    //   height: 400,
    //   child: TextFormField(
          
    //       decoration: InputDecoration(
    //         labelText: 'Diagnosis',
    //         border: OutlineInputBorder()
            
    //       ),
        
    //   ),
    // )
    //   ],)
   
    //   ],),
      
      
    
    );
  

    
  }
}