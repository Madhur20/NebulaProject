// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nebula_project/screens/Homepage.dart';
import 'package:nebula_project/widgets/customButton.dart';
import 'package:nebula_project/widgets/app_bar_Login.dart';
import 'package:http/http.dart' as http;
import 'package:nebula_project/widgets/sectionInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/gender.dart';
import '../widgets/input_field.dart';
import 'landing_screen.dart';

class SearchResults extends StatefulWidget {
  var coursePrefix;
  var courseNum;
  SearchResults({required this.coursePrefix, required this.courseNum});
  @override
  State<SearchResults> createState() =>
      _SearchResultsState(courseNum: courseNum, coursePrefix: coursePrefix);
}

class _SearchResultsState extends State<SearchResults> {
  var coursePrefix;
  var courseNum;
  var courseInfo;
  var sectionsinfo;
  var courseID;
  _SearchResultsState({required this.coursePrefix, required this.courseNum}) {
    print(coursePrefix + " " + courseNum);
    http
        .get(Uri.parse("http://127.0.0.1:5000/courseInfo/prefix=" +
            coursePrefix +
            "/number=" +
            courseNum))
        .then((value) => {
              // print(value.body),
              setState(() {
                courseInfo = json.decode(value.body) as Map<String, dynamic>;
                courseID = courseInfo["_id"];
                // print("here " + courseInfo["_id"]);
              }),
              http
                  .get(Uri.parse(
                      "http://127.0.0.1:5000/sections/course_reference=" +
                          courseID))
                  .then((value) {
                var j = (json.decode(value.body) as Map<String, dynamic>);
                setState(() {
                  // print(value.body.toString());
                  sectionsinfo = j["data"];
                });
                print("there" + sectionsinfo.toString());
              })
            });
  }
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
                                      backgroundImage: AssetImage(
                                          "people-working-computer-with-hot-coffee_620585-238.jpg"),
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
                                      courseInfo == null
                                          ? "loading..."
                                          : courseInfo["title"],
                                      style: TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.w900,
                                          overflow: TextOverflow.clip),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 5.0, bottom: 35.0),
                                    child: Text(
                                      coursePrefix + " " + courseNum,
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
                                      // courseInfo==null?"loading...":courseInfo["description"],
                                      courseInfo == null
                                          ? "loading..."
                                          : courseInfo["description"],
                                      style: TextStyle(
                                        fontSize: 26.0,
                                      ),
                                      textAlign: TextAlign.start,
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
                            child: sectionsinfo != null
                                ? Column(
                                    children: sectionsinfo == null
                                        ? []
                                        : [
                                            Container(
                                                padding:
                                                    EdgeInsets.only(bottom: 50),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        3 -
                                                    200,
                                                child: Text(
                                                  "choose a section to view more details",
                                                  style: TextStyle(
                                                    fontSize: 36,
                                                  ),
                                                  softWrap: true,
                                                  textAlign: TextAlign.center,
                                                )),
                                            for (var val in sectionsinfo) ...[
                                              if (val["professors"].length != 0)
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 25),
                                                    child: SectionInfo(
                                                      info: val,
                                                      coursePrefix:
                                                          coursePrefix,
                                                      coursenum: courseNum,
                                                    ))
                                            ]
                                          ],
                                  )
                                : SizedBox(),
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
