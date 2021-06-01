import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:ur_sugar/apis/inprogress-api.dart';
import 'package:http/http.dart' as http;
import 'package:ur_sugar/screens/logDetails.dart';
import 'package:ur_sugar/screens/scheduleActivity.dart';
import 'package:ur_sugar/utils/nowLoading.dart';

class CommunicationProgress extends StatefulWidget {
  const CommunicationProgress({Key key, this.referral_code_id, this.userId})
      : super(key: key);
  final int referral_code_id;
  final int userId;

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
                        userId: widget.userId,
                        referral_code_id: widget.referral_code_id)
                    : Center(child: CircularProgressIndicator());
              },
            )
          ],
        ),
      )),
    );
  }
}

class CommunicationList extends StatefulWidget {
  const CommunicationList(
      {Key key, this.communications, this.referral_code_id, this.userId})
      : super(key: key);
  final List<Table2> communications;
  final int referral_code_id;
  final int userId;

  @override
  _CommunicationListState createState() => _CommunicationListState();
}

class _CommunicationListState extends State<CommunicationList> {
  TextEditingController notes = TextEditingController();
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: widget.communications.length,
      itemBuilder: (context, index) {
        Table2 item = widget.communications[index];
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
                          (item.gender == "1")
                              ? Container(
                                  child: Text(
                                  'Male',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey.shade500),
                                ))
                              : Container(
                                  child: Text(
                                  'Female',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey.shade500),
                                ))
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
                                                refCode:
                                                    widget.referral_code_id,
                                                userId: widget.userId,
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
                                                refCode:
                                                    widget.referral_code_id,
                                                userId: widget.userId,
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
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        //height: 800,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              IconButton(
                                                  icon: Icon(
                                                      Icons.close_outlined),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  }),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    'Hms Patient ID',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 13,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0, right: 10),
                                                child: TextFormField(
                                                  //controller: logNote,
                                                  cursorColor: Colors.black,
                                                  decoration: InputDecoration(
                                                      isDense: true,
                                                      hintStyle: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                              0xFF9B9B9B)),
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xFF667975),
                                                                  width: 0.5)),
                                                      border: UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xFF667975),
                                                              width: 0.5)),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xFF667975),
                                                                  width: 0.5)),
                                                      hintText: item.patientId),
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    "Consulting Doctor",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 13,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0, right: 10),
                                                child: TextFormField(
                                                  cursorColor: Colors.black,
                                                  decoration: InputDecoration(
                                                      isDense: true,
                                                      hintStyle: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                              0xFF9B9B9B)),
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xFF667975),
                                                                  width: 0.5)),
                                                      border: UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xFF667975),
                                                              width: 0.5)),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xFF667975),
                                                                  width: 0.5)),
                                                      hintText:
                                                          item.doctorName),
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    'Notes',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 13,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0, right: 10),
                                                child: TextFormField(
                                                  controller: notes,
                                                  cursorColor: Colors.black,
                                                  decoration: InputDecoration(
                                                      isDense: true,
                                                      hintStyle: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                              0xFF9B9B9B)),
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xFF667975),
                                                                  width: 0.5)),
                                                      border: UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xFF667975),
                                                              width: 0.5)),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xFF667975),
                                                                  width: 0.5)),
                                                      hintText: "Notes"),
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    'Type of Admission',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 13,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0, right: 8.0),
                                                child: GroupButton(
                                                  isRadio: true,
                                                  spacing: 10,
                                                  onSelected: (index,
                                                          isSelected) =>
                                                      print(
                                                          '$index button is selected'),
                                                  buttons: [
                                                    "In Patient",
                                                    "Out Patient",
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        'Date Of Admission',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 13,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 2),
                                                  IconButton(
                                                      icon: Icon(
                                                          Icons
                                                              .date_range_outlined,
                                                          size: 18,
                                                          color: Colors.black),
                                                      onPressed: () {}),
                                                  Text(formatted),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    'File Upload (Allow jpeg | jpg formats)',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 13,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0, right: 8.0),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () async {
                                                        print(
                                                            'choose file clicked');
                                                      },
                                                      child: Container(
                                                        color: Colors.lightGreen
                                                            .shade300,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'Choose File',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text('No file chosen')
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Center(
                                                child: GestureDetector(
                                                  onTap: () async {
                                                    http.Response response =
                                                        await http.post(
                                                            Uri.parse(
                                                                'https://referralapi.convenientcare.life/api/Case_Details/GetCaseDetails'),
                                                            body: json.encode({
                                                              "type_of_admission":
                                                                  "1",
                                                              "date_of_admission":
                                                                  formatted,
                                                              "patient_id": item
                                                                  .patientId,
                                                              "consulting_doctor_id":
                                                                  item.doctorId,
                                                              "consulting_doctor_name":
                                                                  item.doctorName,
                                                              "admit_attachment_file":
                                                                  "filepath",
                                                              "admit_notes":
                                                                  notes.text,
                                                              "dml_indicator":
                                                                  "IAD",
                                                              "case_id":
                                                                  item.caseId,
                                                              "referral_code_id":
                                                                  widget
                                                                      .referral_code_id,
                                                              "created_by":
                                                                  widget.userId
                                                            }),
                                                            headers: {
                                                          "Content-Type":
                                                              "application/json"
                                                        });

                                                    Navigator.of(context).pop();
                                                    setState(() {});
                                                    print(response.statusCode);
                                                    print(response.body);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.red.shade300,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 16.0,
                                                              right: 16,
                                                              top: 10,
                                                              bottom: 10),
                                                      child: Text(
                                                        'SUBMIT',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
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
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return StatefulBuilder(
                                            builder: (context, setState) {
                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                            child: Container(
                                              height: 165,
                                              width: double.infinity,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    SizedBox(height: 15),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15),
                                                      child: Text(
                                                        'ALERT',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15, right: 15),
                                                      child: Container(
                                                        width: double.infinity,
                                                        child: Text(
                                                          'Are you sure you want move this as lost?',
                                                        ),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 15.0),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Spacer(),
                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Text(
                                                              'NO',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 16,
                                                          ),
                                                          GestureDetector(
                                                              onTap: () async {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();

                                                                http.Response
                                                                    response =
                                                                    await http.post(
                                                                        Uri.parse(
                                                                            'https://referralapi.convenientcare.life/api/Case_Details/GetCaseDetails'),
                                                                        body: json.encode({
                                                                          "dml_indicator":
                                                                              "CSCL",
                                                                          "referral_code_id":
                                                                              widget.referral_code_id,
                                                                          "case_id":
                                                                              item.caseId,
                                                                          "case_status":
                                                                              "5"
                                                                        }),
                                                                        headers: {
                                                                      "Content-Type":
                                                                          "application/json"
                                                                    });

                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                print(response
                                                                    .statusCode);
                                                                print(response
                                                                    .body);
                                                              },
                                                              child: Text(
                                                                'YES',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .green),
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
                                  setState(() {});
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
