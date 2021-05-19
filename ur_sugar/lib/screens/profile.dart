import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My account,',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            'Cutomize your personal profile',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12),
                          ),
                        ],
                      ),
                      Spacer(),
                      FlatButton(
                        onPressed: null,
                        child: Container(
                          height: 30,
                          width: 65,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade700)
                              //color: Color(0xD2B7043D),
                              ),
                          child: Center(
                              child: Text(
                            'support',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          )),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/mainlogo.png'),
                                fit: BoxFit.cover),
                            border: Border.all(
                                color: Colors.lightGreen, width: 0.5)),
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Vijay Mocero',
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 15),
                          ),
                          Text(
                            ' 24 y/o, 180cm, 80kg',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                //border: Border.all(width: 1),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 8),
                  child: Icon(
                    Icons.chat,
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Help Center',
                        style: TextStyle(
                            fontFamily: 'Poppins', color: Colors.black87),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 1,
                      width: 280,
                      color: Colors.grey.shade500,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 8),
                  child: Icon(
                    Icons.info,
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'About Us',
                        style: TextStyle(
                            fontFamily: 'Poppins', color: Colors.black87),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 1,
                      width: 280,
                      color: Colors.grey.shade500,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 8),
                  child: Icon(
                    Icons.mail_outline,
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Contact Us',
                        style: TextStyle(
                            fontFamily: 'Poppins', color: Colors.black87),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 1,
                      width: 280,
                      color: Colors.grey.shade500,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 8),
                  child: Icon(
                    Icons.settings,
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Settings',
                        style: TextStyle(
                            fontFamily: 'Poppins', color: Colors.black87),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 1,
                      width: 280,
                      color: Colors.grey.shade500,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 8),
                  child: Icon(
                    Icons.star,
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Rate Us',
                        style: TextStyle(
                            fontFamily: 'Poppins', color: Colors.black87),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 1,
                      width: 280,
                      color: Colors.grey.shade500,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Center(
              child: FlatButton(
                onPressed: () {},
                child: Text('Logout',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFFEC4E4E),
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Center(
              child: Container(
                height: 22,
                width: 40,
                //color: Colors.orange,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade300,
                ),
                child: Text(
                  '  v1.0',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
