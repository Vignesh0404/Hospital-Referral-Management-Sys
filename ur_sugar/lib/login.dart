import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ur_sugar/screens/animations.dart';
import 'package:ur_sugar/screens/communicationProgress.dart';
import 'package:ur_sugar/screens/referals.dart';
import 'package:ur_sugar/screens/profile.dart';
import 'package:ur_sugar/utils/botNav.dart';
import './screens/animations.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = new GlobalKey<FormState>();
  TextEditingController emailId = new TextEditingController();
  TextEditingController password = new TextEditingController();

  bool validateAndSave() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future auth() async {
    if (validateAndSave()) {
      functionLoaderBox(context);
      http.Response response = await http.post(
          Uri.parse(
              'https://referralapi.convenientcare.life/api/UserLogIn/LoginVerification'),
          body: json.encode({'user_name': emailId.text, "user_password": password.text}),
          headers: {"Content-Type": "application/json"});
      Navigator.of(context).pop();
      print(response.statusCode);
      print(response.body);
      Map<String, dynamic> data =
          new Map<String, dynamic>.from(json.decode(response.body));
      int user_id = data['Table'][0]["user_id"];
      print("userid" + user_id.toString());
      int referral_code_id = data['Table'][0]["referral_code_id"];
      print("referral_code_id" + referral_code_id.toString());
      String user_name = data['Table'][0]["user_name"];
      String role = data['Table'][0]["user_designation"];
      print(user_name);

      if (response.statusCode == 200) {
        Navigator.of(context).pushReplacement(new MaterialPageRoute(
            builder: (BuildContext context) => new Referals(
                user_name: user_name,
                userid: user_id,
                referral_code_id: referral_code_id,
                role: role)));
      } else {
        print('error pls check auth');
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                'Username or password incorrect, please check!',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontFamily: 'Nunito',
                ),
              ),
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          FadeAnimation(
            1.4,
            Image.asset(
              'assets/mainlogo.png',
              width: 300,
            ),
          ),
          FadeAnimation(
            1.6,
            Center(
              child: Text(
                'REFERRAL MANAGMENT SYSTEM',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeAnimation(
                    1.8,
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Email Address",
                          labelStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400])),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400])),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Color(0xFF82ADFC)))),
                      controller: emailId,
                      validator: (value) => value.isEmpty
                          ? 'Please enter your Email address'
                          : null,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    2,
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400])),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400])),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Color(0xFF82ADFC)))),
                      controller: password,
                      validator: (value) =>
                          value.isEmpty ? 'Please enter your Password' : null,
                    ),
                  ),
                  SizedBox(height: 30),
                  FadeAnimation(
                    2.2,
                    GestureDetector(
                      onTap: () {
                        auth();
                      },
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, left: 30, right: 30),
                          child: Container(
                            height: 40,
                            color: Colors.red.shade300,
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      )),
    );
  }

  functionLoaderBox(BuildContext context) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Loading, Please wait..',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Nunito',
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.white),
                child: CircularProgressIndicator(
                    strokeWidth: 4.0, backgroundColor: Color(0xFFCC2F44)),
              )
            ],
          ),
        );
      },
    );
  }
}
