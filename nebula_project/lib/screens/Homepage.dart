// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'package:nebula_project/screens/SearchResults.dart';
import 'package:nebula_project/widgets/app_bar_LandingPage.dart';
import 'package:nebula_project/widgets/body_LandingPage.dart';
import 'package:nebula_project/widgets/customButton.dart';

import '../widgets/app_bar_HomePage.dart';
import '../widgets/body_HomePage.dart';
import '../widgets/input_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var coursePrefix;
  var courseNum;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool viewSearch = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Scaffold(
          body: Stack(
            children: [
              Row(
                children: [
                  Container(
                    width: size.width / 2,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                  Container(
                    width: size.width / 2,
                    color: Colors.black,
                    padding: EdgeInsets.only(left: 50),
                    child: Stack(
                      children: [
                        AnimatedBackground(
                            behaviour: RacingLinesBehaviour(
                                numLines: 15, direction: LineDirection.Ttb),
                            vsync: this,
                            child: SizedBox()),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InputField(
                                label: "Course Prefix",
                                labelColor: Colors.white,
                                content: "CS",
                                method: (value) => {
                                      coursePrefix = value,
                                    }),
                            SizedBox(
                              height: 25,
                            ),
                            InputField(
                                label: "Course Number",
                                labelColor: Colors.white,
                                content: "4v95",
                                method: (value) => {
                                      courseNum = value,
                                    }),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 250),
                                child: CustomButton(
                                    icon: Icons.search,
                                    name: "Search",
                                    press: () {
                                      setState(() {
                                        viewSearch = true;
                                      });

                                      print(viewSearch);
                                    }))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: size.height,
                // it will take full width
                width: size.width / 1.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("background.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomAppBar_HomePage(),
                  Spacer(),
                  // It will cover 1/3 of free spaces

                  Container(
                      width: size.width / 2.5,
                      child: Center(child: Body_HomePage())),
                  Spacer(
                    flex: 2,
                  ),
                  // it will cover 2/3 of free spaces
                ],
              ),
            ],
          ),
        ),
        viewSearch
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    viewSearch = false;
                  });
                },
                child: SearchResults(
                    coursePrefix: coursePrefix, courseNum: courseNum))
            : SizedBox()
      ],
    );
  }
}
