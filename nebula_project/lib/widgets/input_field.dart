// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String content;
  final Color labelColor;
  final method;
  InputField({required this.label, this.labelColor = Colors.black ,required this.content, required this.method});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            Container(
              width: 150,
              child: Text(
                "$label",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: labelColor)
              ),
              
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                  ),
              width: MediaQuery.of(context).size.width / 3.7,
              //color: (Colors.blue[50])!,
              child: TextField(
                obscureText: label == "password"?true:false,
                onChanged: (value) => {method(value)},
                style: TextStyle(
                  fontSize: 20.0,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(30.0),
                  
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    //borderRadius: BorderRadius.circular(5.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    //borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent
                    ),
                    //borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "$content",
                  fillColor: (Colors.blue[50])!,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
