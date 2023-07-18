import 'package:final_dart/screens/home_patient.dart';
import 'package:flutter/material.dart';

import '../components/button.dart';
import '../components/text_form_field.dart';

class Signin_Patient extends StatelessWidget {
  Signin_Patient({super.key});
  TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(
                  height: 112,
                ),
                Row(
                  children: const [
                    Text(
                      'Hello',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'Inter'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 78,
                ),
                CustomTextField(
                    hintText: 'Email', icon: const Icon(Icons.email),
                    controller: email,func: (value) {
                        if (value == null ||
                              value.isEmpty ||
                              !value.endsWith('.com')) {
                            return 'wrong email';
                          } else {
                            return null;
                          }
                    },
                    type: TextInputType.emailAddress,
                    ),
                const SizedBox(
                  height: 20,
                  
                ),
                CustomTextField(
                    hintText: 'Password', icon: const Icon(Icons.lock),
                    controller: password,
                    func: (p0) {
                       if (p0 == null ||
                              p0.isEmpty ||
                              p0.length < 6) {
                            return 'wrong password';
                          } else {
                            return null;
                          }
                    },type: TextInputType.visiblePassword,
                    ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed('/forget_pass');
                      },
                      child: const Text(
                        'forgot password?',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff82C4C3),
                            fontFamily: 'Inter'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 136,
                ),
                buttonn(
                  text: 'Sign in',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Homepatient();
                      },
                    ));
                  },
                ),
               Align(alignment: Alignment.bottomRight,child: SizedBox(height: 92,width: 105,child: Image.asset('images/note(1).png'))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
