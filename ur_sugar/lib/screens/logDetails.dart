import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:ur_sugar/apis/logs-api.dart';
import 'package:ur_sugar/utils/nowLoading.dart';

class LogDetails extends StatefulWidget {
  const LogDetails({Key key, this.caseId, this.refCode, this.userId})
      : super(key: key);
  final String caseId;
  final int refCode;
  final int userId;
  @override
  _LogDetailsState createState() => _LogDetailsState();
}

class _LogDetailsState extends State<LogDetails> {
  TextEditingController logNote = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey.shade100,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(
          widget.caseId,
          style: TextStyle(color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.close_outlined),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Log Patient',
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
                          controller: logNote,
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
                              hintText: "Log Note"),
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                          ),
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
                                  "dml_indicator": "LDIC",
                                  "referral_code_id": widget.refCode,
                                  "case_id": widget.caseId,
                                  "log_notes": logNote.text
                                }),
                                headers: {"Content-Type": "application/json"});

                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            setState(() {});
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
                                'ADD LOG',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
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
        label: Text('Add Log'),
        icon: Icon(Icons.add_outlined),
        backgroundColor: Colors.lightGreen.shade300,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 16, right: 16, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Log Details,',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'check or add to your logs!',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
              ],
            ),
          ),
          FutureBuilder<List<Table3>>(
            future: fetchLogs(http.Client(), widget.caseId),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? LogInfo(
                      logs: snapshot.data,
                    )
                  : Center(child: CircularProgressIndicator());
            },
          )
        ],
      ),
    );
  }
}

class LogInfo extends StatelessWidget {
  const LogInfo({Key key, this.logs}) : super(key: key);
  final List<Table3> logs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: logs.length,
        itemBuilder: (context, index) {
          Table3 item = logs[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'DETAILS:',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          item.logNotes,
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.grey.shade700),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'DATE:',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          item.createdOn,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.lightGreen.shade700),
                        )
                      ],
                    ),
                    Text(
                      '#' + item.logDetailsId.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
