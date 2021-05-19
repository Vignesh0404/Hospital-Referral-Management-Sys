import 'package:flutter/material.dart';
import 'package:ur_sugar/screens/leads.dart';
import 'package:ur_sugar/screens/communicationProgress.dart';
import 'package:ur_sugar/screens/referals.dart';
import 'package:ur_sugar/screens/prescriptions.dart';

import 'dart:async';

import 'package:ur_sugar/screens/profile.dart';

class Navigator1 extends StatefulWidget {
  final int userid;
  final int referral_code_id;
  final String user_name;

  const Navigator1(
      {Key key, this.userid, this.referral_code_id, this.user_name})
      : super(key: key);
  @override
  _Navigator1State createState() => _Navigator1State();
}

class _Navigator1State extends State<Navigator1> {
  int currentIndex = 0;
  final List<Widget> children = [
    // Prescriptions(),
    Referals(),
    CommunicationProgress(),
    Leads(),
    Profile(),
  ];

  void OntappedBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          //bottom navigation bar
          body: children[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: true,
              showUnselectedLabels: false,
              backgroundColor: Colors.white,
              onTap: OntappedBar,
              currentIndex: currentIndex,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon:
                      Icon(Icons.my_library_books_outlined, color: Colors.grey),
                  activeIcon: Icon(
                    Icons.my_library_books_outlined,
                    color: Color(0xFF8218E6),
                  ),
                  title: new Text(
                    "Referals",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8218E6),
                        fontSize: 10),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today, color: Colors.grey),
                  activeIcon: Icon(
                    Icons.category_outlined,
                    color: Color(0xFF8218E6),
                  ),
                  title: new Text(
                    "InProgress",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8218E6),
                        fontSize: 10),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_hospital_outlined, color: Colors.grey),
                  activeIcon: Icon(
                    Icons.local_hospital_outlined,
                    color: Color(0xFF8218E6),
                  ),
                  title: new Text(
                    "Admitted Patients",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8218E6),
                        fontSize: 10),
                  ),
                ),
                BottomNavigationBarItem(
                    icon:
                        Icon(Icons.account_circle_outlined, color: Colors.grey),
                    activeIcon: Icon(
                      Icons.account_circle_outlined,
                      color: Color(0xFF8218E6),
                    ),
                    title: Text(
                      "Discharged/Lost",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Color(0xFF8218E6),
                      ),
                    ))
              ]),
        ));
  }
}
