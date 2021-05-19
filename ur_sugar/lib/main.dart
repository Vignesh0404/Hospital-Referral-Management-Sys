import 'package:flutter/material.dart';
import 'package:ur_sugar/login.dart';
import 'package:ur_sugar/onBoardingScreen.dart';
import 'package:ur_sugar/utils/botNav.dart';
import 'package:ur_sugar/utils/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: Login());
  }
}
