import 'package:flutter/material.dart';
import 'package:ur_sugar/apis/discharged-api.dart';
import 'package:ur_sugar/screens/detailedView.dart';
import 'package:http/http.dart' as http;

class DischargedPatients extends StatefulWidget {
  DischargedPatients({Key key, this.referral_code_id, this.user_id})
      : super(key: key);
  final int referral_code_id;
  final int user_id;

  @override
  _DischargedPatientsState createState() => _DischargedPatientsState();
}

class _DischargedPatientsState extends State<DischargedPatients> {
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
                    'Discharged Patients,',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'check out your admitted Discharged/Lost Patients here!',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Table5>>(
              future: fetchDischarged(
                  http.Client(), widget.referral_code_id, widget.user_id),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? DischargedPatientsList(
                        dishcharged: snapshot.data,
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

class DischargedPatientsList extends StatelessWidget {
  const DischargedPatientsList(
      {Key key, this.dishcharged, this.referral_code_id, this.user_id})
      : super(key: key);
  final List<Table5> dishcharged;
  final int referral_code_id;
  final int user_id;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: dishcharged.length,
        itemBuilder: (context, index) {
          Table5 item = dishcharged[index];
          String status;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 120,
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
                                child: Text(item.classification ?? 'NULL',
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
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Status'),
                            (item.caseStatus == "4")
                                ? Container(
                                    child: Text(
                                    'Discharged',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ))
                                : Container(
                                    child: Text(
                                    'Lost',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ))
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new DetailedView(
                                      referral_code_id: referral_code_id,
                                      user_id: user_id,
                                      case_id: item.caseId,
                                      case_status: item.caseStatus,
                                      patient_name: item.patientName,
                                      phone_number_1: item.phoneNumber1,
                                      age: item.age,
                                      dob: item.dob,
                                      gender: item.gender,
                                      doctor_name: item.doctorName,
                                      doctor_phone_number:
                                          item.doctorPhoneNumber,
                                      hospital_name: item.hospitalName,
                                      classfication: item.classification,
                                      created_on: item.createdOn,
                                    )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'view more ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(Icons.arrow_forward,
                                      size: 12, color: Colors.white)
                                ],
                              ),
                            ),
                          ),
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
