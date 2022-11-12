// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nebula_project/screens/Login.dart';
import 'package:nebula_project/screens/Register.dart';
import 'package:nebula_project/screens/landing_screen.dart';

import './menu_item.dart';

class CustomAppBar_Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(46),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.16),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LandingScreen()),
              );
            },
            child: Row(
              children: [
                Image.asset(
                  "e4cd0639b5a5c1e164aeff4370ed2365.gif",
                  fit: BoxFit.fill,
                  height: 25,
                  alignment: Alignment.topCenter,
                ),
                SizedBox(width: 20),
                Text(
                  "Course Planner",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Spacer(),
          MenuItemC(
            title: "Home",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LandingScreen()),
              );
            },
          ),
          MenuItemC(
            title: "about",
            press: () {},
          ),
          MenuItemC(
            title: "contact",
            press: () {},
          ),
          MenuItemC(
            title: "Login",
            press: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );},
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
