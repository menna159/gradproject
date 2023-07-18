
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../components/button.dart';
import '../../components/text_form_field.dart';
import '../../components/show_snack_bar.dart';
import '../../cubits/authh_cubit/auth_cubit.dart';

class Forgot_Password extends StatelessWidget {
  Forgot_Password({super.key});
  TextEditingController email = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool? isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Forgetpasswordloading) {
          isLoading = true;
        } else if (state is ForgetpasswordSuccess) {
          Navigator.of(context).pushReplacementNamed('/home_doc');
          isLoading = false;
        } else if (state is ForgetpasswordFailure) {
          ShowSnackbar(context, BlocProvider.of<AuthCubit>(context).message);

          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading!,
          child: Scaffold(
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
                          child: Image.asset('images/illustration.png')),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 42.64, left: 88),
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: 'Inter'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 49),
                            child: Text(
                              'Don’t worry! It happens. Please enter the email  \n            associated with your account.',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xff777777),
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
                          controller: email,
                          hintText: 'Email',
                          icon: Icon(Icons.email),
                          func: (value) {
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
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      buttonn(
                        text: 'Continue',
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context)
                                .resetPassword(email: email.text);
                            Navigator.pushNamed(context,'/checkemail');
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
          ),
        );
      },
    );
  }
}
