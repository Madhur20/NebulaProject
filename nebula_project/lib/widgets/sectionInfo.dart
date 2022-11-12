import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nebula_project/screens/detailedSectionView.dart';
import 'package:nebula_project/widgets/DateViewer.dart';
import 'package:nebula_project/widgets/TimeViewer.dart';
import 'package:nebula_project/widgets/showProfessorinfo_sectioninfo.dart';

import 'ShowSectionDetails.dart';

class SectionInfo extends StatelessWidget {
  var info;
  var coursenum;
  var coursePrefix;
  SectionInfo({required this.info, required this.coursePrefix, required this.coursenum});

  @override
  Widget build(BuildContext context) {
    print(info.runtimeType);
    var size = MediaQuery.of(context).size;
    var width = size.width / 1.7 - 40;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailedSectionView(
                    info: info,
                    coursePrefix: coursePrefix,
                    coursenum: coursenum,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Container(
                  width: width/2-100,
                  child: ProfessorinfoSection(
                    info: info["professors"][0],
                  ),
                ),
                ShowSectionDetails(
                  meeting_room: info["meetings"][0]["location"],
                  type: info["instruction_mode"],
                  sectionnum: info["section_number"],
                )
              ]),
              Column(
                children: [
                  DateViewer(days: info["meetings"][0]["meeting_days"]),
                  TimeViewer(
                      starttime: info["meetings"][0]["start_time"],
                      endtime: info["meetings"][0]["end_time"])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
