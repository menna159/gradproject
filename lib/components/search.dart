

import 'package:flutter/material.dart';
class Search extends StatelessWidget {
   Search({super.key});
 Color search = Color(0xffAFCDCD);
  Color iconsearch = Color(0xffB8DFDF);
  Color border = Color(0xffD9E7E6);
  @override
  Widget build(BuildContext context) {
         MediaQueryData query = MediaQuery.of(context);

    return  TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: border,
                      ),
                    ),
                    labelText: 'search',
                    labelStyle: TextStyle(color: search),
                    prefixIcon: Icon(
                      Icons.search,
                      color: iconsearch,
                    )),
              );
  }
}
