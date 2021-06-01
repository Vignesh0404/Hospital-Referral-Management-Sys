import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:ur_sugar/apis/admits-api.dart';
import 'package:http/http.dart' as http;
import 'package:ur_sugar/utils/nowLoading.dart';

class AdmittedPatients extends StatefulWidget {
  AdmittedPatients({Key key, this.referral_code_id, this.user_id})
      : super(key: key);
  final int referral_code_id;
  final int user_id;

  @override
  _AdmittedPatientsState createState() => _AdmittedPatientsState();
}

class _AdmittedPatientsState extends State<AdmittedPatients> {
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
                    'Admitted Patients,',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'check out your admitted patients here!',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Table6>>(
              future: fetchAdmits(
                  http.Client(), widget.referral_code_id, widget.user_id),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? AdmittedPatientsList(
                        admits: snapshot.data,
                        referral_code_id: widget.referral_code_id,
                        user_id: widget.user_id)
                    : Center(child: CircularProgressIndicator());
              },
            )
          ],
        ),
      )),
    );
  }
}

class AdmittedPatientsList extends StatefulWidget {
  const AdmittedPatientsList(
      {Key key, this.admits, this.referral_code_id, this.user_id})
      : super(key: key);
  final List<Table6> admits;
  final int referral_code_id;
  final int user_id;

  @override
  _AdmittedPatientsListState createState() => _AdmittedPatientsListState();
}

class _AdmittedPatientsListState extends State<AdmittedPatientsList> {
  @override
  Widget build(BuildContext context) {
    TextEditingController diagnosis = TextEditingController();
    TextEditingController dischargeNotes = TextEditingController();
    TextEditingController followUpAdvice = TextEditingController();
    DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: widget.admits.length,
        itemBuilder: (context, index) {
          Table6 item = widget.admits[index];
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
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 9),
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
                              item.doctorPhoneNumber,
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
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey.shade500),
                            ),
                            Text(
                              item.createdOn ?? 'null',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hospital',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              item.hospitalName ?? 'null',
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
                              'Suggested Treatment',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('I have no reason')
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
                                                icon:
                                                    Icon(Icons.close_outlined),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                }),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'Diagnosis',
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
                                                controller: diagnosis,
                                                cursorColor: Colors.black,
                                                decoration: InputDecoration(
                                                    isDense: true,
                                                    hintStyle: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xFF9B9B9B)),
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
                                                    hintText: "Diagnosis"),
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
                                                  'Discharge Notes',
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
                                                controller: dischargeNotes,
                                                cursorColor: Colors.black,
                                                decoration: InputDecoration(
                                                    isDense: true,
                                                    hintStyle: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xFF9B9B9B)),
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
                                                        "Discharge Notes"),
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
                                                  'Follow up advice',
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
                                                controller: followUpAdvice,
                                                cursorColor: Colors.black,
                                                decoration: InputDecoration(
                                                    isDense: true,
                                                    hintStyle: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xFF9B9B9B)),
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
                                                        "Follow up advice"),
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      'Date Of Admission',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 13,
                                                          color: Colors.black),
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
                                                Text(formatted)
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
                                                      color: Colors
                                                          .lightGreen.shade300,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          'Choose File',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
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
                                                  functionLoaderBox(context);
                                                  http.Response response =
                                                      await http.post(
                                                          Uri.parse(
                                                              'https://referralapi.convenientcare.life/api/Case_Details/GetCaseDetails'),
                                                          body: json.encode({
                                                            "dml_indicator":
                                                                "IDAD",
                                                            "case_id":
                                                                item.caseId,
                                                            "referral_code_id":
                                                                widget
                                                                    .referral_code_id,
                                                            "created_by":
                                                                widget.user_id,
                                                            "discharge_date":
                                                                formatted,
                                                            "diagnosis":
                                                                diagnosis.text,
                                                            "discharge_notes":
                                                                dischargeNotes
                                                                    .text,
                                                            "followup_advice":
                                                                followUpAdvice
                                                                    .text,
                                                            "discharge_attachment_file":
                                                                "filepath"
                                                          }),
                                                          headers: {
                                                        "Content-Type":
                                                            "application/json"
                                                      });

                                                  Navigator.of(context).pop();
                                                  Navigator.of(context).pop();
                                                  //setState(() {});
                                                  print(response.statusCode);
                                                  print(response.body);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.red.shade300,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
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
                                    padding: const EdgeInsets.all(7.0),
                                    child: Text(
                                      'DISCHARGE',
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
                ),
              ),
            ),
          );
        });
  }
}
