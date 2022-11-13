// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nebula_project/screens/Homepage.dart';
import 'package:nebula_project/screens/Login.dart';
import 'package:nebula_project/screens/Register.dart';
import 'package:nebula_project/screens/SearchResults.dart';
import 'package:nebula_project/screens/landing_screen.dart';
import 'package:nebula_project/widgets/proffStats.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      // home:ProffStats(name: "Karen Mazidi"),
    );
  }
}