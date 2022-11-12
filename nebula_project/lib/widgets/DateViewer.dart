// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DateViewer extends StatelessWidget {
  var days;
  DateViewer({required this.days});

  @override
  Widget build(BuildContext context) {
    // print(days);
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 10),
      child: Row(children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(border: Border.all(), color: days.contains("Sunday")?Colors.amber[500]:Colors.white,),
          // margin: EdgeInsets.all(5),
          child: Center(
              child: Text(
            "S",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
          )),
        ),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(border: Border.all(), color: days.contains("Monday")?Colors.amber[500]:Colors.white,),
          // margin: EdgeInsets.all(5),
          
          child: Center(
              child: Text(
            "M",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
          )),
        ),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(border: Border.all(), color: days.contains("Tuesday")?Colors.amber[500]:Colors.white,),
          // margin: EdgeInsets.all(5),
          child: Center(
              child: Text(
            "T",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
          )),
        ),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(border: Border.all(), color: days.contains("Wednesday")?Colors.amber[500]:Colors.white,),
          // margin: EdgeInsets.all(5),
          child: Center(
              child: Text(
            "W",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
          )),
        ),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(border: Border.all(), color: days.contains("Thursday")?Colors.amber[500]:Colors.white,),
          // margin: EdgeInsets.all(5),
          child: Center(
              child: Text(
            "T",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
          )),
        ),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(border: Border.all(), color: days.contains("Friday")?Colors.amber[500]:Colors.white,),
          // margin: EdgeInsets.all(5),
          child: Center(
              child: Text(
            "F",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
          )),
        ),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(border: Border.all(), color: days.contains("Saturday")?Colors.amber[500]:Colors.white,),
          // margin: EdgeInsets.all(5),
          child: Center(
              child: Text(
            "S",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
          )),
        ),

      ]),
    );
  }
}
