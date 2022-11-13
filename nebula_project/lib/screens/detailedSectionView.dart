// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:nebula_project/screens/Homepage.dart';
import 'package:nebula_project/widgets/customButton.dart';
import 'package:nebula_project/widgets/app_bar_Login.dart';
import 'package:http/http.dart' as http;
import 'package:nebula_project/widgets/proffStats.dart';
import 'package:nebula_project/widgets/sectionInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/gender.dart';
import '../widgets/input_field.dart';
import 'landing_screen.dart';

class DetailedSectionView extends StatefulWidget {
  var info;
  var coursenum;
  var coursePrefix;
  var profName;
  DetailedSectionView(
      {required this.info,
      required this.coursePrefix,
      required this.coursenum,
      required this.profName});
  @override
  State<DetailedSectionView> createState() => _DetailedSectionViewState(
      info: info,
      coursePrefix: coursePrefix,
      coursenum: coursenum,
      profName: profName);
}

class _DetailedSectionViewState extends State<DetailedSectionView> {
  var info;
  var coursenum;
  var coursePrefix;
  var profName;
  _DetailedSectionViewState(
      {required this.info,
      required this.coursePrefix,
      required this.coursenum,
      required this.profName}) {}
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 60.0, bottom: 60.0, left: 60.0, right: 60.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
              elevation: 5.0,
              child: Stack(
                children: [
                  Container(
                    child: Row(
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.yellow[600],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  bottomLeft: Radius.circular(40.0)),
                            ),
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 00.0, right: 20.0, left: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black87,
                                      backgroundImage:
                                          AssetImage("einstein.jpeg"),
                                      radius:
                                          MediaQuery.of(context).size.width /
                                              40,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60.0,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 5.0, bottom: 15.0),
                                    child: Text(
                                      profName,
                                      style: TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.w900,
                                          overflow: TextOverflow.clip),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(
                                          top: 5.0, bottom: 5.0),
                                      child: ProffStats(name: profName)),
                                  SizedBox(
                                    height: 50.0,
                                  ),
                                  Container(
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Colors.black87,
                                      child: Text(
                                        "📖",
                                        style: TextStyle(
                                            fontSize: 50, color: Colors.yellow),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    coursePrefix + " " + coursenum,
                                    style: TextStyle(fontSize: 100),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      elevation: 7,
                                      child: Container(
                                        width:
                                            size.width - size.width / 3 - 180,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Start date:",
                                                    style:
                                                        TextStyle(fontSize: 40),
                                                  ),
                                                  Card(
                                                    elevation: 10,
                                                    child: Text(
                                                      info["academic_session"]
                                                          ["start_date"],
                                                      style: TextStyle(
                                                          fontSize: 60),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "End date:",
                                                    style:
                                                        TextStyle(fontSize: 40),
                                                  ),
                                                  Card(
                                                    elevation: 10,
                                                    child: Text(
                                                      info["academic_session"]
                                                          ["end_date"],
                                                      style: TextStyle(
                                                          fontSize: 60),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        elevation: 7,
                                        child: Container(
                                          padding: EdgeInsets.all(15),
                                          width:
                                              size.width - size.width / 3 - 180,
                                          child: Row(
                                            children: [
                                              Text(
                                                "Core Flags:",
                                                style: TextStyle(fontSize: 40),
                                              ),
                                              for (var vals
                                                  in info["core_flags"]) ...[
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Card(
                                                    elevation: 10,
                                                    child: Text(
                                                      vals,
                                                      style: TextStyle(
                                                          fontSize: 40),
                                                    ),
                                                  ),
                                                )
                                              ]
                                            ],
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        elevation: 7,
                                        child: Container(
                                          padding: EdgeInsets.all(15),
                                          width:
                                              size.width - size.width / 3 - 180,
                                          child: Row(
                                            children: [
                                              Text(
                                                "Link to Syllabus:",
                                                style: TextStyle(fontSize: 40),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  launchUrl(
                                                      Uri.parse(
                                                          info["syllabus_uri"]),
                                                      mode: LaunchMode
                                                          .externalApplication);
                                                  print("pressed");
                                                },
                                                child: Container(
                                                    padding: EdgeInsets.all(15),
                                                    width: size.width -
                                                        size.width / 3 -
                                                        600,
                                                    child: Text(
                                                      info["syllabus_uri"],
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.blue),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )),
                                              )
                                            ],
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        elevation: 7,
                                        child: Container(
                                          padding: EdgeInsets.all(15),
                                          width:
                                              size.width - size.width / 3 - 180,
                                          child: Row(
                                            children: [
                                              Text(
                                                "Link to UTD Grades:",
                                                style: TextStyle(fontSize: 40),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  launchUrl(
                                                      Uri.parse(
                                                          "https://utdgrades.com/results?search=" +
                                                              coursePrefix +
                                                              " " +
                                                              coursenum +
                                                              " " +
                                                              info["professors"]
                                                                  [0]),
                                                      mode: LaunchMode
                                                          .externalApplication);
                                                  print("pressed");
                                                },
                                                child: Container(
                                                    padding: EdgeInsets.all(15),
                                                    width: size.width -
                                                        size.width / 3 -
                                                        600,
                                                    child: Text(
                                                      "https://utdgrades.com/results?search=" +
                                                          coursePrefix +
                                                          " " +
                                                          coursenum +
                                                          " " +
                                                          info["professors"][0],
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.blue),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )),
                                              )
                                            ],
                                          ),
                                        )),
                                  )
                                ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // getvalue(String s) {
  //   print(courseInfo[s]);
  //   return courseInfo[s];
  // }
}
