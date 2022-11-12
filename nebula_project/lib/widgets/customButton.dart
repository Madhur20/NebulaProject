// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButton extends StatelessWidget {
  var icon;
  var name;
  var press;
  
  CustomButton({required this.icon, required this.name, required this.press});
  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(8.0);
    return Center(
      child: Material(
        elevation: 10,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: () {print("pressed");press();},
          child: Container(
            padding: EdgeInsets.all(0.0),
            height: 60.0,//MediaQuery.of(context).size.width * .08,
            width: 220.0,//MediaQuery.of(context).size.width * .3,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
            ),
            child: Row(
              children: <Widget>[
                LayoutBuilder(builder: (context, constraints) {
                  print(constraints);
                  return Container(
                    height: constraints.maxHeight,
                    width: constraints.maxHeight,
                    decoration: BoxDecoration(
                      color: Colors.yellow[600],
                      borderRadius: borderRadius,
                    ),
                    child: Icon(
                      icon,
                      color: Colors.black,
                      size: 40,
                    ),
                  );
                }),
                Expanded(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}