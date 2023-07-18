import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../components/button.dart';
import '../../components/text_form_field.dart';
import '../../components/show_snack_bar.dart';
import '../../cubits/authh_cubit/auth_cubit.dart';

class Signin_Patient extends StatelessWidget {
  Signin_Patient({super.key});
  final _formkey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  Map<String, dynamic>? data;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Loginloadingpat) {
          isLoading = true;
        } else if (state is LoginSuccesspat) {
          // ShowSnackbar(context, BlocProvider.of<AuthCubit>(context).message);
          ShowSnackbar(context, 'login success');
          Navigator.of(context).pushReplacementNamed('/home_pati');
          isLoading = false;
        } else if (state is LoginFailurepat) {
          ShowSnackbar(context, BlocProvider.of<AuthCubit>(context).message);

          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                color: Colors.black,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Form(
                    key: _formkey,
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const SizedBox(
                          height: 15,
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
                          hintText: 'Email',
                          icon: const Icon(Icons.email),
                          controller: email,
                          func: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !value.endsWith('.com') ||
                                !value.contains('@')) {
                              return 'please enter correct email';
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
                          hintText: 'Password',
                          icon: const Icon(Icons.lock),
                          controller: password,
                          func: (p0) {
                            if (p0 == null || p0.isEmpty || p0.length < 6) {
                              return 'please enter correct password';
                            } else {
                              return null;
                            }
                          },
                          type: TextInputType.visiblePassword,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/forget_pass');
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
                          height: 80,
                        ),
                        buttonn(
                          text: 'Sign in',
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              print(
                                  BlocProvider.of<AuthCubit>(context).docc?.id);
                              BlocProvider.of<AuthCubit>(context).Loginpat(
                                  email: email.text, password: password.text);
                            } else {}
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Or sign by',
                          style: TextStyle(color: Color(0xff82C4C3)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: (Image.asset('images/Google.png')),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            SizedBox(
                                height: 24,
                                width: 24,
                                child: Image.asset(
                                  'images/Circle.png',
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 255, top: 120),
                          child: SizedBox(
                              width: 105,
                              height: 92,
                              child: Image.asset('images/1.jpg')),
                        ),
                      ],
                    ),
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
