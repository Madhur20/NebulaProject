// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'package:nebula_project/widgets/app_bar_LandingPage.dart';
import 'package:nebula_project/widgets/body_LandingPage.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              SizedBox(
                width: size.width / 2,
              ),
              Container(
                width: size.width / 2,
                child: AnimatedBackground(
                    behaviour: SpaceBehaviour(),
                    vsync: this,
                    child: SizedBox()),
              ),
            ],
          ),
          Container(
            height: size.height,
            // it will take full width
            width: size.width / 1.5,
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
              CustomAppBar_LandingPage(),
              Spacer(),
              // It will cover 1/3 of free spaces

              Container(
                  width: size.width / 2,
                  child: Center(child: Body_LandingPage())),
              Spacer(
                flex: 2,
              ),
              // it will cover 2/3 of free spaces
            ],
          ),
        ],
      ),
    );
  }
}
