import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:ur_sugar/screens/communicationProgress/logDetails.dart';
import 'package:ur_sugar/screens/communicationProgress/scheduleActivity.dart';

class ModalPopup extends StatefulWidget {
  const ModalPopup({
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
  final int gender;
  final String age;
  final String docId;

  @override
  _ModalPopupState createState() => _ModalPopupState();
}

TextEditingController notes = TextEditingController();

class _ModalPopupState extends State<ModalPopup> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    return Container(
        height: MediaQuery.of(context).size.height / 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    (widget.gender == 1)
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
                      height: 5,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 12, right: 12, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
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
                                onTap: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new LogDetails(
                                                name: widget.namePatient,
                                                caseId: widget.casedId,
                                                refCode: widget.refId,
                                                userId: widget.userId,
                                              )));
                                },
                                child: Icon(
                                  Icons.history_outlined,
                                  color: Colors.blueGrey.shade700,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Log Details',
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
                                onTap: () {
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new ScheduleActivity(
                                                name: widget.namePatient,
                                                caseId: widget.casedId,
                                                refCode: widget.refId,
                                                userId: widget.userId,
                                              )));
                                },
                                child: Icon(
                                  Icons.schedule_outlined,
                                  color: Colors.blueGrey.shade700,
                                ),
                              ),
                              Text(
                                'Schedule Activity',
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
                                onTap: () {
                                  Navigator.of(context).pop();
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
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 3,
                                                        width: 45,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Colors.blueGrey,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      (widget.gender == 1)
                                                          ? Text(
                                                              widget.namePatient +
                                                                  ' ' +
                                                                  widget.age +
                                                                  ' yrs/Male',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'DmSans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black),
                                                            )
                                                          : Text(
                                                              widget.namePatient +
                                                                  ' ' +
                                                                  widget.age +
                                                                  ' yrs/Female',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'DmSans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
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
                                                      hintText:
                                                          widget.patientId),
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
                                                          widget.doctorName),
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
                                                              "patient_id":
                                                                  widget
                                                                      .patientId,
                                                              "consulting_doctor_id":
                                                                  widget.docId,
                                                              "consulting_doctor_name":
                                                                  widget
                                                                      .doctorName,
                                                              "admit_attachment_file":
                                                                  "filepath",
                                                              "admit_notes":
                                                                  notes.text,
                                                              "dml_indicator":
                                                                  "IAD",
                                                              "case_id": widget
                                                                  .casedId,
                                                              "referral_code_id":
                                                                  widget.refId,
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
                                child: Icon(
                                  Icons.local_hospital_outlined,
                                  color: Colors.blueGrey.shade700,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Admit Now',
                                style: TextStyle(
                                    fontFamily: 'DmSans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.blueGrey.shade400),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Wrap(
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

                                  http.Response response = await http.post(
                                      Uri.parse(
                                          'https://referralapi.convenientcare.life/api/Case_Details/GetCaseDetails'),
                                      body: json.encode({
                                        "dml_indicator": "CSCL",
                                        "referral_code_id": widget.refId,
                                        "case_id": widget.casedId,
                                        "case_status": "5"
                                      }),
                                      headers: {
                                        "Content-Type": "application/json"
                                      });

                                  print(response.statusCode);
                                  print(response.body);
                                  if (mounted) {
                                    setState(() {});
                                  }
                                },
                                child: Icon(
                                  Icons.send_and_archive,
                                  color: Colors.blueGrey.shade700,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Send to Lost',
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
                              Icon(
                                Icons.chat_bubble_outline,
                                color: Colors.blueGrey.shade700,
                              ),
                              SizedBox(
                                height: 5,
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
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.local_hospital_outlined,
                                  color: Colors.white),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '',
                                style: TextStyle(
                                    fontFamily: 'DmSans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.blueGrey.shade400),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
