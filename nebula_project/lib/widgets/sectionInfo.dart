import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nebula_project/screens/detailedSectionView.dart';
import 'package:nebula_project/widgets/DateViewer.dart';
import 'package:nebula_project/widgets/TimeViewer.dart';
import 'package:nebula_project/widgets/showProfessorinfo_sectioninfo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'ShowSectionDetails.dart';

class SectionInfo extends StatefulWidget {
  var info;
  var coursenum;
  var coursePrefix;

  SectionInfo(
      {required this.info,
      required this.coursePrefix,
      required this.coursenum});

  @override
  State<SectionInfo> createState() => _SectionInfoState(
      info: info, coursePrefix: coursePrefix, coursenum: coursenum);
}

class _SectionInfoState extends State<SectionInfo> {
  var info;
  var coursenum;
  var coursePrefix;
  var professorID;
  var profName;
  _SectionInfoState(
      {required this.info,
      required this.coursePrefix,
      required this.coursenum}) {
    professorID = info["professors"][0];
    print(professorID);
    http
        .get(Uri.parse("http://127.0.0.1:5000/professor/" + professorID))
        .then((value) => {
              setState(() {
                var prof = json.decode(value.body) as Map<String, dynamic>;
                //print(prof.toString());
                profName = prof["data"]["first_name"] +
                    " " +
                    prof["data"]["last_name"];
                print(profName);
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.info.runtimeType);
    var size = MediaQuery.of(context).size;
    var width = size.width / 1.7 - 40;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailedSectionView(
                    info: widget.info,
                    coursePrefix: widget.coursePrefix,
                    coursenum: widget.coursenum,
                    profName: profName == null ? "loading..." : profName,
                  )),
        );
      },
      child: Card(
        elevation: 7,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Container(
          width: width,
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  width: width / 2 - 100,
                  child: ProfessorinfoSection(
                    info: profName == null ? "loading..." : profName,
                  ),
                ),
                ShowSectionDetails(
                  meeting_room: widget.info["meetings"][0]["location"],
                  type: widget.info["instruction_mode"],
                  sectionnum: widget.info["section_number"],
                )
              ]),
              Column(
                children: [
                  DateViewer(days: widget.info["meetings"][0]["meeting_days"]),
                  TimeViewer(
                      starttime: widget.info["meetings"][0]["start_time"],
                      endtime: widget.info["meetings"][0]["end_time"])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
