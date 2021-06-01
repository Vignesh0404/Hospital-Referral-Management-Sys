import 'package:flutter/material.dart';
import 'package:ur_sugar/screens/admittedPatients.dart';
import 'package:ur_sugar/screens/communicationProgress.dart';
import 'package:ur_sugar/screens/dischargedPatients.dart';
import 'package:ur_sugar/screens/referals.dart';

class DrawerWidget extends StatefulWidget {
  DrawerWidget({Key key, this.referral_code_id, this.userid}) : super(key: key);
  final int referral_code_id;
  final int userid;

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'REFERRAL MANAGEMENT',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  ' copyrights © Mocero Health Solutions',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1.5,
                ),
              ],
            ),
          ),
          ListTile(
            trailing:
                Icon(Icons.arrow_forward_ios, color: Colors.black, size: 15),
            title: Text(
              'Referrals',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            subtitle: Text('Your schedule for referrals!'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            trailing:
                Icon(Icons.arrow_forward_ios, color: Colors.black, size: 15),
            title: Text(
              'Communication Inprogress',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            subtitle: Text('Your inprogress communications!'),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new CommunicationProgress(
                      referral_code_id: widget.referral_code_id,
                      userId: widget.userid)));
            },
          ),
          ListTile(
            trailing:
                Icon(Icons.arrow_forward_ios, color: Colors.black, size: 15),
            title: Text(
              'Admitted Patients',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            subtitle: Text('check out your admitted patients here!'),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new AdmittedPatients(
                        referral_code_id: widget.referral_code_id,
                        user_id: widget.userid,
                      )));
            },
          ),
          ListTile(
            trailing:
                Icon(Icons.arrow_forward_ios, color: Colors.black, size: 15),
            title: Text(
              'Discharged/Lost Patients',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            subtitle: Text('Your Lost Patients here!'),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new DischargedPatients(
                        referral_code_id: widget.referral_code_id,
                        user_id: widget.userid,
                      )));
            },
          ),
          ListTile(
            trailing:
                Icon(Icons.arrow_forward_ios, color: Colors.black, size: 15),
            title: Text(
              'Logout',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            subtitle: Text('Click here to logout!'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
