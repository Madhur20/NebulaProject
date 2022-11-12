// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../constant.dart';


class Body_HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        
        Container(
          padding: EdgeInsets.only(left: 30),
          child: Text(
          
            "The University of Texas at Dallas".toUpperCase(),
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: kTextcolor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        SizedBox(height: size.height/9,),
        Center(
          child: CircleAvatar(
            radius: size.height/20,
            backgroundImage: AssetImage("utd.jpeg"),
          ),
        )
      ],
    );
  }
}
