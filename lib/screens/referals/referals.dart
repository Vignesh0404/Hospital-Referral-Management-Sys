import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:ur_sugar/apis/referal-api.dart';

import 'package:ur_sugar/utils/drawer.dart';
import 'package:ur_sugar/utils/nowLoading.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:ur_sugar/screens/referals/referalModal.dart';

class Referals extends StatefulWidget {
  const Referals(
      {Key key, this.userid, this.referral_code_id, this.user_name, this.role})
      : super(key: key);
  final int userid;
  final int referral_code_id;
  final String user_name;
  final String role;
  @override
  _ReferalsState createState() => _ReferalsState();
}

class _ReferalsState extends State<Referals> {
  DateTime _selectedValue = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        drawer: DrawerWidget(
          referral_code_id: widget.referral_code_id,
          userid: widget.userid,
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey.shade100,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'DASHBOARD',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.black,
                fontFamily: 'DmSans'),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome ' +
                          widget.user_name +
                          '! ' +
                          '(' +
                          widget.role +
                          ')',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          fontFamily: 'DmSans'),
                    ),
                    Text(
                      'Check out your schedule here,',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: 'DmSans'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16,
                ),
                child: DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.black,
                  daysCount: 10,
                  width: 50,
                  height: 81,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      _selectedValue = date;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              FutureBuilder<List<Table1>>(
                future: fetchPhotos(http.Client(), widget.referral_code_id),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);

                  return snapshot.hasData
                      ? OrdersList(
                          photos: snapshot.data,
                          refCode: widget.referral_code_id,
                        )
                      : Center(child: CircularProgressIndicator());
                },
              ),
            ]),
          ),
        ));
  }
}

class OrdersList extends StatefulWidget {
  const OrdersList({Key key, this.photos, this.refCode}) : super(key: key);
  final List<Table1> photos;
  final int refCode;

  @override
  _OrdersListState createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: widget.photos.length,
      itemBuilder: (context, index) {
        Table1 item = widget.photos[index];
        if (widget.photos.length == 0) {
          return Center(
            child: Text(
              'no references left',
              style: TextStyle(color: Colors.black),
            ),
          );
        } else
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
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
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blueGrey.shade100),
                                child: IconButton(
                                    icon: Icon(
                                      Icons.more_vert,
                                      color: Colors.blueGrey.shade800,
                                      size: 16,
                                    ),
                                    onPressed: () {
                                      showModalBottomSheet(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                topRight: Radius.circular(10)),
                                          ),
                                          context: context,
                                          builder: (BuildContext context) {
                                            return new RefModalPopup(
                                                refId: widget.refCode,
                                                userId: 1,
                                                namePatient: item.patientName,
                                                age: item.age,
                                                docId: item.doctorId,
                                                casedId: item.caseId,
                                                patientId: item.patientId,
                                                doctorName: item.doctorName,
                                                gender: item.gender);
                                          });
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
                              (item.gender == "1")
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
            ),
          );
      },
    );
  }
}
/* 
 Container(
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlue.shade100,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        size: 22,
                                      ),
                                      onPressed: () async {
                                        functionLoaderBox(context);
                                        Navigator.of(context).pop();

                                        http.Response response = await http.post(
                                            Uri.parse(
                                                'https://referralapi.convenientcare.life/api/Case_Details/GetCaseDetails'),
                                            body: json.encode({
                                              "dml_indicator": "CSC",
                                              "referral_code_id":
                                                  widget.refCode,
                                              "case_id": item.caseId,
                                              "case_status": "2"
                                            }),
                                            headers: {
                                              "Content-Type": "application/json"
                                            });
                                        print(response.statusCode);
                                        print(response.body);
                                        setState(() {});
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        'Contact Initiated Successfully',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black,
                                                          fontFamily: 'DmSans',
                                                        ),
                                                      ),
                                                      Theme(
                                                          data: Theme.of(
                                                                  context)
                                                              .copyWith(
                                                                  accentColor:
                                                                      Colors
                                                                          .white),
                                                          child: Icon(
                                                            Icons
                                                                .verified_outlined,
                                                            color: Color(
                                                                0xFF46D66A),
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      }))

*/
