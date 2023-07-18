import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class treatment_card extends StatelessWidget {
  treatment_card(
      {required this.TreatmentName,
      this.TreatmentDescription,
      required this.TreatmentTimes});
  String? TreatmentName;
  String? TreatmentDescription;
  int? TreatmentTimes;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.clear_rounded,
            color: Color(0xff82C4C3),
            size: 28,
          ),
        ),
        Card(
            color: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Container(
              width: 322,
              height: 86,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffD6E2E2),
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: kElevationToShadow[0],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 3, top: 19),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$TreatmentName",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "$TreatmentDescription",
                            style: TextStyle(
                                fontSize: 10, color: Color(0xffA0A0A0)),
                          ),
                        ],
                      ),
                    ),
                    trailing: Text(
                      "$TreatmentTimes Times",
                      style: TextStyle(fontSize: 10, color: Color(0xff82C4C3)),
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
