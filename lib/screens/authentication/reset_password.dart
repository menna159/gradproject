
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../components/show_snack_bar.dart';
import '../../components/button.dart';
import '../../components/text_form_field.dart';

class Reset_Password extends StatelessWidget {
  Reset_Password({super.key});
  TextEditingController ResetPassword = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool? isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  height: 68,
                ),
                SizedBox(
                    height: 163.48,
                    width: 163.48,
                    child:
                        Image.asset('images/forgot password illustration.png')),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 42.64, left: 65),
                      child: Text(
                        'Reset your password',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'Inter'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 55,
                ),
                Form(
                  key: _formkey,
                  child: CustomTextField(
                    controller: ResetPassword,
                    hintText: 'New Password',
                    icon: Icon(Icons.lock),
                    func: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return 'wrong password';
                      } else {
                        return null;
                      }
                    },
                    type: TextInputType.visiblePassword,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                buttonn(
                  text: 'Reset Password',
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      // BlocProvider.of<AuthCubit>(context)
                      //     .resetPassword(email: ResetPassword.text);
                      Navigator.pushNamed(context,'/reset_success');
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 255, top: 168),
                  child: SizedBox(
                      width: 105,
                      height: 92,
                      child: Image.asset('images/1.jpg')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
