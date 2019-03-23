import 'package:flutter/material.dart';
import 'package:selfcare/pages/login_page.dart';
import 'package:selfcare/resources/colors.dart';
import 'package:fimber/fimber.dart';

void main() {
  Fimber.plantTree(DebugTree());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SelfCare',
      theme: ThemeData(
        primaryColor: CustomColors.primaryColor,
        accentColor: CustomColors.accentColor,
        fontFamily: 'Archivo',
      ),
      home: LoginPage(),
    );
  }
}
