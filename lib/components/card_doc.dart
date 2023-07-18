import 'package:flutter/material.dart';

class CardDoc extends StatelessWidget {
  CardDoc(
      {super.key,
      required this.image,
      required this.docname,
      required this.docspecialization});
  Image? image;
  Text? docname;
  Text? docspecialization;

  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: SizedBox(
        width: query.size.width,
        child: ListTile( 
          leading: image,
          title: docname,
          subtitle: docspecialization,
        ),
      ),
    );
  }
}
