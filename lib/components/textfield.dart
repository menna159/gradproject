import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class textfield extends StatelessWidget {
  textfield(
      {this.text,
      required this.width,
      required this.height,
      required this.input,
      required this.type,
      this.func,
      @required this.h
      //this.b,this.r
      });
  String? text;
  double width;
  double height;
  TextInputType? type;
  TextEditingController input = TextEditingController();
  String? Function(String?)? func;
  // double? b;
  double? h;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        keyboardType: type,
        controller: input,
        validator: func,
        decoration: InputDecoration(
          // hintMaxLines: int.fromEnvironment(name),
          contentPadding: EdgeInsets.symmetric(vertical: h!, horizontal: 10),
          labelText: text,
          focusedBorder: OutlineInputBorder(
            gapPadding: 12,
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(
              color: Color(0xff0A9A9A),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            gapPadding: 12,
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(
              color: Color(0xff0A9A9A),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(
              color: Color(0xff0A9A9A),
            ),
          ),
        ),
      ),
    );
  }
}
