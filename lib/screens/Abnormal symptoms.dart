import 'package:flutter/material.dart';

import '../components/button.dart';
import '../components/textfield.dart';

class AbnormalSymptoms extends StatelessWidget {
  const AbnormalSymptoms({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController docname = TextEditingController();
    TextEditingController abnormalsypm = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Abnormal symptoms',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 7,
              ),
              Image.asset(
                'images/symptoms.png',
                width: 100,
                height: 100,
              ),
              SizedBox(
                height: 40,
              ),
              textfield(
                // b: 10,
                // r: 5,
                text: 'Doctor name',
                h: 70,
                width: 316,
                height: 70,
                input: docname,
                type: TextInputType.name,
                func: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'Enter the correct doctor name please';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              textfield(
                  // b: 70,
                  // r: 316,
                  h: 144,
                  text: 'Abnormal symptoms',
                  width: 316,
                  height: 144,
                  input: abnormalsypm,
                  type: TextInputType.text,
                  func: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Enter the correct Abnormal symptoms please';
                    } else {
                      return null;
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              buttonn(text: 'send', onPressed: () {}),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 130),
                  child: Image.asset(
                    'images/1.jpg',
                    width: 105,
                    height: 92,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
