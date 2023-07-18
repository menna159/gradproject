import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Patient_Card extends StatelessWidget {
  Patient_Card({this.name, this.cancerType,this.func});
  String? name;
  String? cancerType;
  VoidCallback? func;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: func,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
        child: SingleChildScrollView(
          child: Container(
            width: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(width: 1, color: Color(0xff82C4C3)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$name',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      // SizedBox(width: 40,),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        '$cancerType',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/edit_pati');
                          },
                          child: Text(
                            'Edit',
                            style: TextStyle(
                              color: Color(0xff82C4C3),
                              fontSize: 16,
                            ),
                          )),
                      // SizedBox(
                      //   width: 3,
                      // ),
                      Row(
                        children: [
                          Text(
                            'Add Treatment',
                            style: TextStyle(
                              color: Color(0xff82C4C3),
                              fontSize: 16,
                            ),
                          ),
                          Image.asset('images/Edit 3.png')
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
