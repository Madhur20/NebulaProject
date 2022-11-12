// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nebula_project/screens/Homepage.dart';
import 'package:nebula_project/widgets/customButton.dart';
import 'package:nebula_project/widgets/app_bar_Login.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/gender.dart';
import '../widgets/input_field.dart';
import 'landing_screen.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";

  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 60.0, bottom: 60.0, left: 120.0, right: 120.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
              elevation: 5.0,
              child: Stack(
                children: [
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow[600],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                bottomLeft: Radius.circular(40.0)),
                          ),
                          width: MediaQuery.of(context).size.width / 3.3,
                          height: MediaQuery.of(context).size.height,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 70.0, right: 50.0, left: 50.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black87,
                                    backgroundImage: AssetImage("user.jpg"),
                                    radius: 100.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 60.0,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  child: Text(
                                    "Hey! Welcome Back",
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  child: Text(
                                    "log back in, to continue where you left off",
                                    style: TextStyle(
                                      fontSize: 22.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 50.0,
                                ),
                                Container(
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.black87,
                                    child: Text(
                                      "😊",
                                      style: TextStyle(
                                          fontSize: 36, color: Colors.yellow),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 40.0,
                              right: 70.0,
                              left: size.width/15,
                              bottom: 40.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              error == ""
                                  ? SizedBox()
                                  : (Center(
                                      child: Container(
                                        width: size.width / 3.7 + 200,
                                        child: Text(
                                          error,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.red),
                                        ),
                                      ),
                                    )),
                              SizedBox(height: 30.0),
                              InputField(
                                  label: "Email",
                                  content: "bestApp@winner.com",
                                  method: (value) => {email = value}),

                              SizedBox(height: 20.0),
                              InputField(
                                  label: "password",
                                  content: "Shhhhhhhhh!",
                                  method: (value) => {password = value}),

                              SizedBox(
                                height: 100.0,
                              ),

                              //Membership Widget from the widgets folder

                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width /
                                            2.5 -
                                        400,
                                  ),
                                  CustomButton(
                                    icon: Icons.cancel_outlined,
                                    name: "Cancel",
                                    press: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LandingScreen()),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  CustomButton(
                                    icon: Icons.login,
                                    name: "Login",
                                    press: () async {
                                      // if(email=="" || password=="")
                                      // {
                                      //   setState(() {
                                      //     error = "Please enter a valid email and password!";
                                      //   });
                                      // }
                                      //final response = await http.get(Uri.parse("http://127.0.0.1:5000/login/email="+email+"/password="+password));
                                      final response = await http.get(Uri.parse(
                                          "http://127.0.0.1:5000/login/email="+email+"/password="+password));
                                      print(response.body);
                                      final decode = json.decode(response.body)
                                          as Map<String, dynamic>;

                                      if (decode["auth"]) {
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        var k = (decode["data"]
                                                as Map<String, dynamic>)
                                            .keys;
                                        await prefs.setBool("logged_in", true);
                                        for (var element in k) {
                                          await prefs.setString(
                                              element,
                                              decode["data"][element]
                                                  .toString());
                                        }
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomePage()),
                                        );
                                        print(prefs.get("logged_in"));
                                      } else {
                                        setState(() {
                                          error =
                                              "Incorrect username or password";
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 3.3),
                      child: CustomAppBar_Login()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
