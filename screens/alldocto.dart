// import 'dart:core';


// import 'package:final_dart/components/search.dart';
// import 'package:flutter/material.dart';

// import '../components/carddoc.dart';

// class Alldocts extends StatelessWidget {
//   Alldocts({super.key});
//   Color search = Color(0xffAFCDCD);
//   Color iconsearch = Color(0xffB8DFDF);
//   Color border = Color(0xffD9E7E6);

//   @override
//   Widget build(BuildContext context) {
//     MediaQueryData query = MediaQuery.of(context);

//     return Scaffold(
//       body: 
//           Stack(
//             children: [
//               Card(
                
//                 child: Image.asset(
//                   'images/telegram.png',
//                   fit: BoxFit.fitWidth,
//                   width: double.infinity,
//                   height: 197,
//                 ),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 clipBehavior: Clip.antiAlias,
//               ),
              
//               Column(
                
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top: 99, left: 24),
//                               child: Text(
//                                 'Hi,',
//                                 style: TextStyle(color: Colors.white, fontSize: 20),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 23),
//                               child: Text(
//                                 'find your doctor',
//                                 style: TextStyle(color: Colors.white, fontSize: 20),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 23),
//                               child: Text(
//                                 'by name',
//                                 style: TextStyle(color: Colors.white, fontSize: 20),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),

//                        Padding(
//                          padding: const EdgeInsets.only(top: 77.0,right: 5),
//                          child: SizedBox(
//                       width: 100,
//                       height: 50,
//                       child: Image.asset(
//                           'images/telegram.png',
//                           width: 182,
//                           height: 182,
//                       ),
//                     ),
//                        ),
                  
//                     ],
//                   ),
                  
//             Card(
                    
//                       color: Color(0XffF5F5F5),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20)),
//                       clipBehavior: Clip.antiAlias,
//                       child: Column(children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 22, right: 22,top:20),
//                           child: SizedBox(width: query.size.width, child: Search()),
//                         ),
//                         SizedBox(
//                           height: 17,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 18.0),
//                           child: Text('All Doctors',
//                               style: TextStyle(
//                                 color: Color(0xff82C4C3),
//                               )),
//                         ),
//                         Padding(
//                             padding: const EdgeInsets.only(left: 17, right: 17),
//                             child: CardDoc(
//                                 image: Image.asset(
//                                  'images/telegram.png',
//                                 ),
//                                 docname: Text('Dr: Mohamed sameh'),
//                                 docspecialization: Text(
//                                   'Speialization',
//                                   style: TextStyle(fontSize: 10),
//                                 ))),
//                         SizedBox(
//                           height: 12,
//                         ),
//                         Padding(
//                             padding: const EdgeInsets.only(left: 17, right: 17),
//                             child: CardDoc(
//                                 image: Image.asset('images/telegram.png'),
//                                 docname: Text('Dr: Ahmed Mohamed'),
//                                 docspecialization: Text(
//                                   'Speialization',style: TextStyle(fontSize: 10),
//                                 ))),
//                         SizedBox(
//                           height: 12,
//                         ),
//                         Padding(
//                             padding: const EdgeInsets.only(left: 17, right: 17),
//                             child: CardDoc(
//                                 image: Image.asset('images/telegram.png'),
//                                 docname: Text('Dr: Sara Sameh'),
//                                 docspecialization: Text(
//                                   'Speialization',
//                                   style: TextStyle(fontSize: 10),
//                                 ))),
//                         SizedBox(
//                           height: 12,
//                         ),
//                         Padding(
//                             padding: const EdgeInsets.only(left: 17, right: 17),
//                             child: CardDoc(
//                                 image: Image.asset('images/telegram.png'),
//                                 docname: Text('Dr: Eslam Ahmed'),
//                                 docspecialization: Text(
//                                   'Speialization',
//                                   style: TextStyle(fontSize: 10),
//                                 ))),
              
//                       ])
                      
//                       ),
//                   ]),
            
                
//           ]),
               
              
         
          
          
//           // SizedBox(
//           //   height: 25,
//           // ),
        
      
//     );
//   }
// }