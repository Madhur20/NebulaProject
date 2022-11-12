// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShowSectionDetails extends StatelessWidget {
  var meeting_room;
  var type;
  var sectionnum;
  ShowSectionDetails({required this.meeting_room, required this.type, required this.sectionnum});

  @override
  Widget build(BuildContext context) {
    print(meeting_room);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 20,
            child: Icon(Icons.meeting_room, color: Colors.red,size: 35),
          ),
        ),
        Text(meeting_room["building"]+" "+meeting_room["room"], style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700), ),
        Container(
          padding: EdgeInsets.only(left: 50,right: 20),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 20,
            child: Icon(Icons.person, color: Colors.red,size: 35),
          ),
        ),
        Text(type, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700), ),
        Container(
          padding: EdgeInsets.only(left: 50,right: 20),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 20,
            child: Icon(Icons.info_outline, color: Colors.red,size: 35),
          ),
        ),
        Text("section: "+sectionnum, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700), )
      ]),
    );
  }
}