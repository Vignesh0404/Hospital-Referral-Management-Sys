import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ur_sugar/login.dart';
import 'loader.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 6),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //resizeToAvoidBottomPadding: false,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset(
              'assets/login-img2.png',
              width: 400,
            ),
            Spacer(),
            ColorLoader2(),
            SizedBox(
              height: 120,
            )
          ],
        ),
      )),
    );
  }
}
