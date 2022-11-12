// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nebula_project/screens/Login.dart';

import '../constant.dart';


class Body_LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            "Course Planner".toUpperCase(),
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: kTextcolor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          width: size.width/2,
          child: Center(
            child: Text(
              textAlign: TextAlign.left,
              "One app for viewing past grades, professor review, and class details",
              style: TextStyle(
                fontSize: 28,
                color: kTextcolor.withOpacity(0.6),
              ),
            ),
          ),
        ),
        InkWell(
          // Now it just take the required spaces
          onTap: () {
            Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Login()),
                                      );
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color(0xFF372930),
              borderRadius: BorderRadius.circular(34),
            ),
            width: 250,
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF372930),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  "Get Started".toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                SizedBox(width: 15),
              ],
            ),
          ),
        )
      ],
    );
  }
}
