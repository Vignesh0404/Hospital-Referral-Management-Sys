import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:ur_sugar/apis/referal-api.dart';
import 'package:ur_sugar/screens/previewOrders.dart';
import 'package:ur_sugar/utils/drawer.dart';
import 'package:ur_sugar/utils/nowLoading.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

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
                fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      'Check out your schedule here,',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16, top: 8, bottom: 8),
                child: DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.black,
                  daysCount: 10,
                  width: 50,
                  height: 80,
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
                height: 10,
              ),
              FutureBuilder<List<Table1>>(
                future: fetchPhotos(http.Client(), widget.referral_code_id),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  // if (snapshot.hasData == true) {
                  //   return Padding(
                  //     padding: const EdgeInsets.only(top: 38.0),
                  //     child: Center(child: Text('no schedules left..')),
                  //   );
                  // }

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
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new PreviewOrder()));
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                color: Colors.white,
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                item.patientName ?? 'null',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.pink.shade400,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      item.classification ?? 'null',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text(
                            '#' + item.caseId ?? 'null',
                            style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade400),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Doctor Name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade400),
                                  ),
                                  Text(
                                    item.doctorName ?? 'null',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade800),
                                  ),
                                ],
                              ),
                              Spacer(),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Doctor No',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade400),
                                  ),
                                  Text(
                                    item.doctorPhoneNumber ?? 'null',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade800),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Divider(
                            thickness: 1.5,
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Referred Date',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    item.createdOn ?? 'null',
                                    style: TextStyle(color: Colors.lightGreen),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.lightBlue.shade100,
                                    borderRadius: BorderRadius.circular(30)),
                                child: IconButton(
                                    icon: Icon(
                                      Icons.message_outlined,
                                      size: 22,
                                    ),
                                    onPressed: () {}),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.lightBlue.shade100,
                                    borderRadius: BorderRadius.circular(30)),
                                child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      size: 22,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                              ),
                                              child: Container(
                                                height: 165,
                                                width: double.infinity,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      SizedBox(height: 15),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 15),
                                                        child: Text(
                                                          'ALERT',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 15,
                                                                right: 15),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: Text(
                                                            'Are you sure you want to initiate the contact?',
                                                          ),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
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
                                                                onTap:
                                                                    () async {
                                                                  functionLoaderBox(
                                                                      context);
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
                                                                                "CSC",
                                                                            "referral_code_id":
                                                                                widget.refCode,
                                                                            "case_id":
                                                                                item.caseId,
                                                                            "case_status":
                                                                                "2"
                                                                          }),
                                                                          headers: {
                                                                        "Content-Type":
                                                                            "application/json"
                                                                      });

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

                                      setState(() {});
                                    }),
                              )
                            ],
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

Widget notescontainer(color, String name, String img) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: color),
        color: Colors.grey.shade50,
        // borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 5,
          ),
          CircleAvatar(
            backgroundImage: AssetImage(
              img,
            ),
            minRadius: 30,
            backgroundColor: color,
          ),
          SizedBox(
            width: 13,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 15),
              ),
              Text('Dr. xyz'),
              Text(
                'Crocin, 10gm (20x)',
                style: TextStyle(
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.w400,
                    fontSize: 11),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'Payment Status: done',
                style: TextStyle(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w400,
                    fontSize: 11),
              ),
            ],
          ),
          Spacer(),
          IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 20,
              ),
              onPressed: null)
        ],
      ),
    ),
  );
}
