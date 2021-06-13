import 'package:flutter/material.dart';
import 'package:ur_sugar/apis/discharged-api.dart';
import 'package:ur_sugar/screens/dischargedPatients/detailedView.dart';
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
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'DmSans'),
                  ),
                  Text(
                    'check out your admitted Discharged/Lost Patients here!',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: 'DmSans'),
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
            child: Material(
              elevation: 4,
              child: Container(
                height: 195,
                width: double.infinity,
                color: Colors.blueGrey,
                child: Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(left: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '#' + item.caseId,
                              style: TextStyle(
                                  fontFamily: 'DmSans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9),
                            ),
                            Spacer(),
                            Container(
                              decoration:
                                  BoxDecoration(color: Colors.blue.shade300),
                              child: GestureDetector(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Show More ',
                                          style: TextStyle(
                                              fontFamily: 'DmSans',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                new DetailedView(
                                                  referral_code_id:
                                                      referral_code_id,
                                                  user_id: user_id,
                                                  case_id: item.caseId,
                                                  case_status: item.caseStatus,
                                                  patient_name:
                                                      item.patientName,
                                                  phone_number_1:
                                                      item.phoneNumber1,
                                                  age: item.age,
                                                  dob: item.dob,
                                                  gender: item.gender,
                                                  doctor_name: item.doctorName,
                                                  doctor_phone_number:
                                                      item.doctorPhoneNumber,
                                                  hospital_name:
                                                      item.hospitalName,
                                                  classfication:
                                                      item.classification,
                                                  created_on: item.createdOn,
                                                )));
                                  }),
                            )
                          ],
                        ),
                        Text(
                          item.patientName,
                          style: TextStyle(
                              fontFamily: 'DmSans',
                              fontWeight: FontWeight.w800,
                              fontSize: 16),
                        ),
                        Row(
                          children: [
                            (item.gender == 1)
                                ? Text(
                                    item.age + ' yrs/Male',
                                    style: TextStyle(
                                        fontFamily: 'DmSans',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                        color: Colors.grey.shade500),
                                  )
                                : Text(
                                    item.age + ' yrs/Female',
                                    style: TextStyle(
                                        fontFamily: 'DmSans',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                        color: Colors.grey.shade500),
                                  ),
                            Spacer(),
                            Text(
                              item.phoneNumber1 ?? 'not registered',
                              style: TextStyle(
                                  fontFamily: 'DmSans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  color: Colors.grey.shade500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.green,
                              size: 8,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              item.doctorName,
                              style: TextStyle(
                                  fontFamily: 'DmSans',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              item.hospitalName,
                              style: TextStyle(
                                  fontFamily: 'DmSans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  color: Colors.grey.shade500),
                            ),
                            Spacer(),
                            Text(
                              item.doctorPhoneNumber ?? 'not registered',
                              style: TextStyle(
                                  fontFamily: 'DmSans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  color: Colors.grey.shade500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              'magic internal doctor',
                              style: TextStyle(
                                  fontFamily: 'DmSans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  color: Colors.grey.shade500),
                            ),
                            Spacer(),
                            Text(
                              item.classification ?? 'null',
                              style: TextStyle(
                                  fontFamily: 'DmSans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  color: Colors.lightBlue.shade500),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 220,
                          decoration:
                              BoxDecoration(color: Colors.blueGrey.shade200),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Text(
                                  'Referred Date - ',
                                  style: TextStyle(
                                      fontFamily: 'DmSans',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                      color: Colors.white),
                                ),
                                Text(
                                  item.createdOn,
                                  style: TextStyle(
                                    fontFamily: 'DmSans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11,
                                    color: Colors.blueGrey.shade800,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'first referral for this patient',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontFamily: 'DmSans',
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: Colors.grey.shade600),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

/*


*/
