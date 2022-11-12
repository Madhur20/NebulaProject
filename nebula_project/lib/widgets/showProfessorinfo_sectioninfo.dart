// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfessorinfoSection extends StatelessWidget {
  var info;
  ProfessorinfoSection({required this.info});

  @override
  Widget build(BuildContext context) {
    // print(info);
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundImage: AssetImage("animated-teacher-image-0090.gif"),
              backgroundColor: Colors.red,
              radius: 25,
            ),
          ),
          Text(info, style: TextStyle(fontSize: 40),),
        ],
      ),
    );
  }
}
