import 'package:flutter/material.dart';

class DetailedView extends StatefulWidget {
  DetailedView(
      {Key key,
      this.referral_code_id,
      this.case_id,
      this.case_status,
      this.patient_name,
      this.phone_number_1,
      this.age,
      this.dob,
      this.gender,
      this.doctor_name,
      this.doctor_phone_number,
      this.hospital_name,
      this.classfication,
      this.created_on,
      this.user_id})
      : super(key: key);
  final int referral_code_id;
  final int user_id;
  final String case_id;
  final String case_status;
  final String patient_name;
  final String phone_number_1;
  final String age;
  final String dob;
  final int gender;
  final String doctor_name;
  final String doctor_phone_number;
  final String hospital_name;
  final String classfication;
  final String created_on;

  @override
  _DetailedViewState createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade100,
        title: Text(
          widget.case_id,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        elevation: 0.0,
      ),
      backgroundColor: Colors.grey.shade100,
      body: ListView(children: [
        SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Patient Details',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          'Created On: ' + widget.created_on,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                        Spacer(),
                        Container(
                          decoration:
                              BoxDecoration(color: Colors.lightBlue.shade200),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.classfication.toUpperCase(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Case ID',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              widget.case_id,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Phone No :',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              widget.phone_number_1,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Patient Name',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              widget.patient_name,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Gender',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            (widget.gender == "1")
                                ? Text(
                                    'Male',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12),
                                  )
                                : Text(
                                    'Female',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12),
                                  )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Age',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              widget.age,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'DOB',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              widget.dob,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Blood Group',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              'A1+',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Dr Phone No',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              widget.doctor_phone_number,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hospital Name',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              widget.hospital_name,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Department',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              'Heart',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Referred To',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              'DR.Palaniappan',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Attachment',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              'File',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Doctor Name',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              widget.doctor_name,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Referred Reason ',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              'helloo',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(thickness: 1, color: Colors.black),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Log Details',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'SNO',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text('1')
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Log Note',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text('a')
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Created On',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text('04-Apr-2021 12:05 PM')
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(thickness: 1, color: Colors.black),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Activity Details',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Created On: 04-Apr-2021 12:02 PM',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Summary',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              'http://localhost:57347/',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Attachment',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              'File',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Due Date',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              '	13-Apr-2021',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Assigned to',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              '	Dr.UMA',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Notes',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              'asdsadsa',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Activity Status',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              'HEART',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(thickness: 1, color: Colors.black),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Admit Details',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Created on: 04-Apr-2021 12:02 PM',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Type of Admission',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              'Out Patient',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Date of Admission',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              '5-Apr-2021 12:00 AM',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Consulting Doctor ID',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              'sdsadsa',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Doctor Name',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              '	sdsadsa',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Attachment ',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              'File',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Notes',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              'sadsads',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(thickness: 1, color: Colors.black),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Discharge Details',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Created on: 04-Apr-2021 12:02 PM',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Discharge Date',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              '3-Apr-2021 12:00 AM',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Diagnosis',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              'sadsa',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Notes',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              'sdsadsa',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Followup Advice',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              '	sdsadsa',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Attachment ',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              'File',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ]),
    );
  }
}
