import 'package:flutter/material.dart';

class floatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 48,
      child: FloatingActionButton.extended(
        backgroundColor: Color(0xff82C4C3),
        label: const Text(
          'Chat with doctor',
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
        onPressed: () {},
        icon: Icon(
          Icons.chat,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
      ),
    );
  }
}
