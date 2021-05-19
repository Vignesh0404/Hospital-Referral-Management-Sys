import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ur_sugar/apis/inprogress-api.dart';
import 'package:http/http.dart' as http;
import 'package:ur_sugar/screens/logDetails.dart';
import 'package:ur_sugar/screens/scheduleActivity.dart';

class CommunicationProgress extends StatefulWidget {
  const CommunicationProgress({Key key, this.referral_code_id})
      : super(key: key);
  final int referral_code_id;

  @override
  _CommunicationProgressState createState() => _CommunicationProgressState();
}

class _CommunicationProgressState extends State<CommunicationProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade100,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        elevation: 0.0,
      ),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Communication Inprogress,',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'check out your communications!',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Table2>>(
              future: fetchProgress(http.Client(), widget.referral_code_id),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? CommunicationList(
                        communications: snapshot.data,
                      )
                    : Center(child: CircularProgressIndicator());
              },
            )
          ],
        ),
      )),
    );
  }
}

checkAlert(BuildContext context, String caseId) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            child: Container(
              height: 165,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'ALERT',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w900),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        width: double.infinity,
                        child: Text(
                          'Are you sure you want to proceed?',
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Row(
                        children: <Widget>[
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'NO',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          GestureDetector(
                              onTap: () async {
                                Navigator.of(context).pop();

                                http.Response response = await http.post(
                                    Uri.parse(
                                        'https://referralapi.convenientcare.life/api/Case_Details/GetCaseDetails'),
                                    body: json.encode({
                                      "dml_indicator": "CSCL",
                                      "referral_code_id": "1",
                                      "case_id": caseId,
                                      "case_status": "5"
                                    }),
                                    headers: {
                                      "Content-Type": "application/json"
                                    });

                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                print(response.statusCode);
                                print(response.body);
                              },
                              child: Text(
                                'YES',
                                style: TextStyle(color: Colors.green),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 15)
                  ],
                ),
              ),
            ),
          );
        });
      });
}

class CommunicationList extends StatelessWidget {
  const CommunicationList({Key key, this.communications}) : super(key: key);
  final List<Table2> communications;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: communications.length,
      itemBuilder: (context, index) {
        Table2 item = communications[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 200,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '#',
                        style:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 9),
                      ),
                      Text(
                        item.caseId ?? 'null',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 9,
                            color: Colors.grey.shade500),
                      ),
                      Spacer(),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(14)),
                          child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                  item.classification ?? 'null'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 11,
                                      color: Colors.white))))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.patientName ?? 'null',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16),
                          ),
                          Text(
                            item.phoneNumber1 ?? 'null',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 8,
                                color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            item.doctorName ?? 'null',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16),
                          ),
                          Text(
                            item.doctorPhoneNumber ?? 'null',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 8,
                                color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            item.age ?? 'null',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gender',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Referred Date',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            item.createdOn ?? 'null',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Speciality',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Heart',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Call Managment',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new LogDetails(
                                                caseId: item.caseId,
                                              )));
                                },
                                child: Container(
                                    color: Colors.green.shade400,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'Log Details',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 10),
                                      ),
                                    )),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new ScheduleActivity(
                                                caseId: item.caseId,
                                              )));
                                },
                                child: Container(
                                    color: Colors.green.shade400,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'Schedule Activity',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 10),
                                      ),
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                      //
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Actions',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                  color: Colors.blue.shade600,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Admit',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10),
                                    ),
                                  )),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  checkAlert(context, item.caseId);
                                },
                                child: Container(
                                    color: Colors.blue.shade600,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'Lost',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 10),
                                      ),
                                    )),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
