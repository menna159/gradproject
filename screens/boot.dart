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

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    // onPressed calls using this URL are not gated on a 'canLaunch' check
    // because the assumption is that every device can launch a web URL.
    final Uri toLaunch =
        Uri(scheme: 'https', host: 'www.cylog.org', path: 'headers/');
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Link(
                uri: Uri.parse('https://t.me/DragonsTeamCancerAssistantBot'),
                target: LinkTarget.blank,
                builder: (BuildContext ctx, FollowLink? openLink) {
                  return GestureDetector(
                      onTap: openLink,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 85),
                        child: Image.asset(
                          'images/problem.png',
                          width: 230,
                          height: 230,
                        ),
                      ));
                },
              ),
              // const Padding(padding: EdgeInsets.all(16.0)),
              FutureBuilder<void>(future: _launched, builder: _launchStatus),
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