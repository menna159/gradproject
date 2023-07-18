import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Bot_Page extends StatefulWidget {
  Bot_Page({super.key});

  @override
  State<Bot_Page> createState() => Bot_PageState();
}

class Bot_PageState extends State<Bot_Page> {
  Future<void>? _launched;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // onPressed calls using this URL are not gated on a 'canLaunch' check
    // because the assumption is that every device can launch a web URL.

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 85),
                child: GestureDetector(
                  child: Image.asset(
                    'images/chatbot (9).png',
                    width: 230,
                    height: 230,
                  ),
                  onTap: () async {
                    launchUrl(
                      Uri.parse('https://t.me/DragonsTeamCancerAssistantBot'),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                ),
              ),
              // const Padding(padding: EdgeInsets.all(16.0)),
              Text(
                "Welcome to chat bot",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ],
      ),
    );
  }
}
