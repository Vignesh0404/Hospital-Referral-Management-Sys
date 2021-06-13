import 'dart:convert';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:ur_sugar/screens/communicationProgress/logDetails.dart';
import 'package:ur_sugar/screens/communicationProgress/scheduleActivity.dart';
import 'package:ur_sugar/utils/nowLoading.dart';

class RefModalPopup extends StatefulWidget {
  const RefModalPopup({
    Key key,
    this.namePatient,
    this.refId,
    this.userId,
    this.gender,
    this.age,
    this.casedId,
    this.patientId,
    this.doctorName,
    this.docId,
  }) : super(key: key);
  final String namePatient;
  final String patientId;
  final String doctorName;
  final int refId;
  final int userId;
  final String casedId;
  final String gender;
  final String age;
  final String docId;

  @override
  _RefModalPopupState createState() => _RefModalPopupState();
}

TextEditingController notes = TextEditingController();

class _RefModalPopupState extends State<RefModalPopup> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    return Container(
        height: MediaQuery.of(context).size.height / 6,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 3,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    (widget.gender == "1")
                        ? Text(
                            widget.namePatient + ' ' + widget.age + ' yrs/Male',
                            style: TextStyle(
                                fontFamily: 'DmSans',
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                                color: Colors.black),
                          )
                        : Text(
                            widget.namePatient +
                                ' ' +
                                widget.age +
                                ' yrs/Female',
                            style: TextStyle(
                                fontFamily: 'DmSans',
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                                color: Colors.black),
                          ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Center(
                  child: Wrap(
                    runSpacing: 50,
                    spacing: 50,
                    alignment: WrapAlignment.spaceBetween,
                    direction: Axis.horizontal,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                Navigator.of(context).pop();
                                functionLoaderBox(context);

                                http.Response response = await http.post(
                                    Uri.parse(
                                        'https://referralapi.convenientcare.life/api/Case_Details/GetCaseDetails'),
                                    body: json.encode({
                                      "dml_indicator": "CSC",
                                      "referral_code_id": widget.refId,
                                      "case_id": widget.casedId,
                                      "case_status": "2"
                                    }),
                                    headers: {
                                      "Content-Type": "application/json"
                                    });
                                Navigator.of(context).pop();

                                print(response.statusCode);
                                print(response.body);
                                setState(() {});
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'Contact Initiated Successfully',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                  fontFamily: 'DmSans',
                                                ),
                                              ),
                                              Theme(
                                                  data: Theme.of(context)
                                                      .copyWith(
                                                          accentColor:
                                                              Colors.white),
                                                  child: Icon(
                                                    Icons.verified_outlined,
                                                    color: Color(0xFF46D66A),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Icon(
                                Icons.history_outlined,
                                color: Colors.blueGrey.shade700,
                              ),
                            ),
                            Text(
                              'Initiate Contact',
                              style: TextStyle(
                                  fontFamily: 'DmSans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.blueGrey.shade400),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.chat_bubble_outline,
                                color: Colors.blueGrey.shade700,
                              ),
                            ),
                            Text(
                              'Chat with Doc',
                              style: TextStyle(
                                  fontFamily: 'DmSans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.blueGrey.shade400),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ])));
  }
}
