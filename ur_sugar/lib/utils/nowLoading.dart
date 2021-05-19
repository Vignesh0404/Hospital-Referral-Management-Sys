import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Widget checkAlert(BuildContext context, String caseId) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
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
                        'Are you sure you want to initiate the contact?',
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
                                    "dml_indicator": "CSC",
                                    "referral_code_id": "1",
                                    "case_id": caseId,
                                    "case_status": "2"
                                  }),
                                  headers: {
                                    "Content-Type": "application/json"
                                  });

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
}

functionLoaderBox(BuildContext context) async {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Loading, Please wait..',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: 'Nunito',
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: CircularProgressIndicator(
                  strokeWidth: 4.0, backgroundColor: Color(0xFF8000F8)),
            )
          ],
        ),
      );
    },
  );
}
