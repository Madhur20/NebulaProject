// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TimeViewer extends StatelessWidget {
  var starttime;
  var endtime;
  TimeViewer({required this.starttime, required this.endtime});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 10,
        child: Container(
          width: 315,
          height: 45,
          child: Center(
              child: Text(
            starttime + "-" + endtime,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          )),
        ),
      ),
    );
  }
}
