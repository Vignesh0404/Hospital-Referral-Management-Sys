import 'package:flutter/material.dart';
import 'package:ur_sugar/utils/nowLoading.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

class DischargeNow extends StatelessWidget {
  const DischargeNow(
      {Key key,
      this.namePatient,
      this.patientId,
      this.doctorName,
      this.refId,
      this.userId,
      this.casedId,
      this.gender,
      this.age,
      this.docId})
      : super(key: key);
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
  Widget build(BuildContext context) {
    TextEditingController diagnosis = TextEditingController();
    TextEditingController dischargeNotes = TextEditingController();
    TextEditingController followUpAdvice = TextEditingController();
    DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            //height: 800,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Discharge Patient Form',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 19),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        children: [
                          (gender == 1)
                              ? Text(
                                  namePatient + ' ' + age + ' yrs/Male',
                                  style: TextStyle(
                                      fontFamily: 'DmSans',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14,
                                      color: Colors.black),
                                )
                              : Text(
                                  namePatient + ' ' + age + ' yrs/Female',
                                  style: TextStyle(
                                      fontFamily: 'DmSans',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14,
                                      color: Colors.black),
                                ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 3,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Diagnosis',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: TextFormField(
                      controller: diagnosis,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          isDense: true,
                          hintStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF9B9B9B)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF667975), width: 0.5)),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF667975), width: 0.5)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF667975), width: 0.5)),
                          hintText: "Diagnosis"),
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Discharge Notes',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: TextFormField(
                      controller: dischargeNotes,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          isDense: true,
                          hintStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF9B9B9B)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF667975), width: 0.5)),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF667975), width: 0.5)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF667975), width: 0.5)),
                          hintText: "Discharge Notes"),
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Follow up advice',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: TextFormField(
                      controller: followUpAdvice,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          isDense: true,
                          hintStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF9B9B9B)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF667975), width: 0.5)),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF667975), width: 0.5)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF667975), width: 0.5)),
                          hintText: "Follow up advice"),
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
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Date Of Admission',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(width: 2),
                      IconButton(
                          icon: Icon(Icons.date_range_outlined,
                              size: 18, color: Colors.black),
                          onPressed: () {}),
                      Text(formatted)
                    ],
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'File Upload (Allow jpeg | jpg formats)',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            print('choose file clicked');
                          },
                          child: Container(
                            color: Colors.lightGreen.shade300,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Choose File',
                                style: TextStyle(color: Colors.white),
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
                        http.Response response = await http.post(
                            Uri.parse(
                                'https://referralapi.convenientcare.life/api/Case_Details/GetCaseDetails'),
                            body: json.encode({
                              "dml_indicator": "IDAD",
                              "case_id": casedId,
                              "referral_code_id": refId,
                              "created_by": userId,
                              "discharge_date": formatted,
                              "diagnosis": diagnosis.text,
                              "discharge_notes": dischargeNotes.text,
                              "followup_advice": followUpAdvice.text,
                              "discharge_attachment_file": "filepath"
                            }),
                            headers: {"Content-Type": "application/json"});

                        Navigator.of(context).pop();
                        Navigator.of(context).pop();

                        print(response.statusCode);
                        print(response.body);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red.shade300,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16, top: 10, bottom: 10),
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(color: Colors.white, fontSize: 18),
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
          ),
        ));
  }
}
