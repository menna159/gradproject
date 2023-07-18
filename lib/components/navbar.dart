import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vital_care/cubits/authh_cubit/auth_cubit.dart';
import 'package:vital_care/main.dart';

bool sw_value = false;
SharedPreferences? logindataa;

SharedPreferences? typeperson;
SharedPreferences? links;
String? type;

class Navbar extends StatefulWidget {
  Navbar(this.cont, {this.name});
  dynamic? name;
  BuildContext cont;
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    logindataa = await SharedPreferences.getInstance();
    typeperson = await SharedPreferences.getInstance();
    links = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 60),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/edit_profil_doc');
                  },
                  child: CircleAvatar(
                    child: ClipOval(
                        child: Image.asset('images/Rectangle 3332.png')),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(widget.name ?? 'null')
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(endIndent: 50, indent: 50)

          // UserAccountsDrawerHeader(accountName: Text("menna"), accountEmail: Text("menna.com") ,
          // currentAccountPicture: CircleAvatar(
          //   child: ClipOval(child:Image.asset('images/home.jpg',
          //   // width: 200,height: 200,
          //   fit: BoxFit.cover,)),
          // ),
          // decoration: BoxDecoration(
          //   color: Colors.brown
          // ),),

          ,
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: sw_value,
              onChanged: (value) {
                setState(() {
                  sw_value = value;
                  if (value == false) {
                    vitalCare.themeNotifier.value = ThemeMode.light;
                  } else {
                    vitalCare.themeNotifier.value = ThemeMode.dark;
                  }
                  // BlocProvider.of<AuthCubit>(context).swvalue = value;
                  // print(BlocProvider.of<AuthCubit>(context).swvalue);
                  // BlocProvider.of<AuthCubit>(context).mode=ThemeMode.dark;
                  //print(BlocProvider.of<AuthCubit>(context).mode);

                  //BlocProvider.of<AuthCubit>(widget.cont).mode=value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('profile'),
            leading: Icon(Icons.person_rounded, color: Color(0xff82C4C3)),
            onTap: () {
              Navigator.of(context).pushNamed('/docprof');
            },
          ),
          ListTile(
            title: Text('change password'),
            leading: Icon(Icons.lock_outline_sharp, color: Color(0xff82C4C3)),
            onTap: () {
              Navigator.of(context).pushNamed('/change_pass');
            },
          ),
          ListTile(
            title: Text(
              'CommunicationWays',
            ),
            leading: Image.asset(
              'images/Rectangle 3332.png',
              width: 20,
              height: 20,
            ),
            onTap: () {
              if (links?.getString('whatsapp') == null) {
                Navigator.pushNamed(context, '/communicationway');
              } else {
                //editCommLinks();
                //print('done');
                //editCommLinks();
                // Navigator.pushNamed(context, '/editCommLinks');
              }
            },
          ),
          ListTile(
            title: Text('Help'),
            leading: Icon(Icons.help, color: Color(0xff82C4C3)),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/logo');
            },
          ),
          SizedBox(
            height: 150,
          ),
          Divider(endIndent: 50, indent: 50),
          ListTile(
            title: Text(
              'logout',
              style: TextStyle(color: Color(0xff82C4C3)),
            ),
            leading: Icon(Icons.login_outlined, color: Color(0xff82C4C3)),
            onTap: () {
              openDialog();
            },
          ),
        ],
      ),
    );
  }

  Future openDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.spaceBetween,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            content: SizedBox(
              height: 208,
              width: 220,
              child: Column(
                children: [
                  SizedBox(
                      height: 159,
                      width: 224,
                      child: Image.asset('imagesظRectangle 3332.png')),
                  Text(
                    'Are you sure?',
                    style: TextStyle(color: Color(0XffA0A0A0), fontSize: 15),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Color(0xff82C4C3), fontSize: 18),
                  )),
              TextButton(
                  onPressed: () {
                    logindataa?.remove('email');
                    typeperson?.remove('type');

                    Navigator.of(context)
                        .pushReplacementNamed('/doc_or_patient');
                  },
                  child: Text(
                    'Yes',
                    style: TextStyle(color: Color(0xff82C4C3), fontSize: 18),
                  )),
            ],
          );
        });
  }
}
