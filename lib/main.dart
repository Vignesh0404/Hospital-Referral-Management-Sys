import 'dart:math';
  
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ur_sugar/screens/login.dart';
import 'package:ur_sugar/utils/splash.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.grey.shade100,
    statusBarColor: Colors.grey.shade100,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'DmSans',
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
