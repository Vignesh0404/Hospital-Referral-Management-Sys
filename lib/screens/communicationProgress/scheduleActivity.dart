import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ur_sugar/apis/scheduleActivity-api.dart';
import 'package:http/http.dart' as http;
import 'package:ur_sugar/utils/nowLoading.dart';
import 'package:group_button/group_button.dart';
import 'package:file_picker/file_picker.dart';

class ScheduleActivity extends StatefulWidget {
  const ScheduleActivity(
      {Key key, this.caseId, this.refCode, this.userId, this.name})
      : super(key: key);
  final String caseId;
  final int refCode;
  final int userId;
  final String name;

  @override
  _ScheduleActivityState createState() => _ScheduleActivityState();
}

class _ScheduleActivityState extends State<ScheduleActivity> {
  TextEditingController summary = TextEditingController();
  TextEditingController assignedTo = TextEditingController();
  TextEditingController notes = TextEditingController();

  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  dynamic currentTime = DateFormat.jm().format(DateTime.now());

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range =
            DateFormat('dd/MM/yyyy').format(args.value.startDate).toString() +
                ' - ' +
                DateFormat('dd/MM/yyyy')
                    .format(args.value.endDate ?? args.value.startDate)
                    .toString();
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
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
          widget.name,
          style: TextStyle(color: Colors.black, fontFamily: 'DmSans'),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet<void>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10)),
            ),
            context: context,
            builder: (BuildContext context) {
              return Container(
                //height: 800,
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
                            'Summary',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                fontFamily: 'DmSans',
                                color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: TextFormField(
                          controller: summary,
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
                              hintText: "Summary"),
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'DmSans',
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
                            'Assigned to',
                            style: TextStyle(
                                fontFamily: 'DmSans',
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: TextFormField(
                          controller: assignedTo,
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
                              hintText: "Assigned to"),
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'DmSans',
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
                            'Notes',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                fontFamily: 'DmSans',
                                color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: TextFormField(
                          controller: notes,
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
                              hintText: "Notes"),
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'DmSans',
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
                                    fontFamily: 'DmSans',
                                    fontSize: 13,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(width: 2),
                          IconButton(
                              icon: Icon(Icons.date_range_outlined,
                                  size: 18, color: Colors.black),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Stack(
                                          children: <Widget>[
                                            // Positioned(
                                            //   left: 0,
                                            //   right: 0,
                                            //   top: 0,
                                            //   height: 40,
                                            //   child: Column(
                                            //     mainAxisAlignment:
                                            //         MainAxisAlignment
                                            //             .spaceEvenly,
                                            //     mainAxisSize: MainAxisSize.min,
                                            //     crossAxisAlignment:
                                            //         CrossAxisAlignment.start,
                                            //     children: <Widget>[
                                            //       Text('Selected date: ' +
                                            //           _selectedDate),
                                            //     ],
                                            //   ),
                                            // ),
                                            Positioned(
                                              left: 0,
                                              top: 80,
                                              right: 0,
                                              bottom: 0,
                                              child: SfDateRangePicker(
                                                onSelectionChanged:
                                                    _onSelectionChanged,
                                                selectionMode:
                                                    DateRangePickerSelectionMode
                                                        .single,
                                                initialSelectedRange:
                                                    PickerDateRange(
                                                        DateTime.now().subtract(
                                                            const Duration(
                                                                days: 4)),
                                                        DateTime.now().add(
                                                            const Duration(
                                                                days: 3))),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              }),
                          SizedBox(
                            width: 2,
                          ),
                          //Text(formattedDate + ' ' + currentTime)
                          Text(formatted)
                        ],
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Activity Type',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                fontFamily: 'DmSans',
                                color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: GroupButton(
                          isRadio: true,
                          spacing: 10,
                          onSelected: (index, isSelected) =>
                              print('$index button is selected'),
                          buttons: [
                            "Call",
                            "Mail",
                            "Ambulance",
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Activity Status',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'DmSans',
                                fontSize: 13,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: GroupButton(
                          isRadio: true,
                          spacing: 10,
                          onSelected: (index, isSelected) =>
                              print('$index button is selected'),
                          buttons: [
                            "Done",
                            "Select next activity",
                            "Cancel",
                            "Submit",
                          ],
                        ),
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
                                fontFamily: 'DmSans',
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
                                FilePickerResult result =
                                    await FilePicker.platform.pickFiles();

                                if (result != null) {
                                  File file = File(result.files.single.path);
                                } else {
                                  Navigator.of(context).pop();
                                }
                              },
                              child: Container(
                                color: Colors.lightGreen.shade300,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Choose File',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'DmSans'),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'No file chosen',
                              style: TextStyle(
                                  color: Colors.black, fontFamily: 'DmSans'),
                            )
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
                                  "activity_type": "1",
                                  "activity_summary": summary.text,
                                  "activity_attachment_file": "filepath",
                                  "activity_due_date": formatted,
                                  "activity_assigned_to": assignedTo.text,
                                  "activity_assigned_id": "1",
                                  "activity_notes": notes.text,
                                  "activity_status": "2",
                                  "dml_indicator": "IGADD",
                                  "case_id": widget.caseId,
                                  "referral_code_id": widget.refCode,
                                  "created_by": widget.userId
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
                                'SUBMIT',
                                style: TextStyle(
                                    fontFamily: 'DmSans',
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
        label: Text(
          'Add Schedule',
          style: TextStyle(fontFamily: 'DmSans'),
        ),
        icon: Icon(Icons.add_outlined),
        backgroundColor: Colors.lightGreen.shade300,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 16, right: 16, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Schedule Activity,',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'DmSans'),
                  ),
                  Text(
                    'check or add to your schedules!',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: 'DmSans'),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Table4>>(
              future: fetchLogs(http.Client(), widget.caseId),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? SchActiList(
                        schedule: snapshot.data,
                      )
                    : Center(child: CircularProgressIndicator());
              },
            )
          ],
        ),
      ),
    );
  }
}

class SchActiList extends StatelessWidget {
  const SchActiList({Key key, this.schedule}) : super(key: key);
  final List<Table4> schedule;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: schedule.length,
        itemBuilder: (context, index) {
          Table4 item = schedule[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.lightGreen.shade300,
              ),
              child: Container(
                margin: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Assigned To',
                                style: TextStyle(
                                    fontFamily: 'DmSans',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade400),
                              ),
                              Text(
                                item.assignedTo,
                                style: TextStyle(
                                    fontFamily: 'DmSans',
                                    color: Colors.blueGrey.shade900,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Notes',
                                style: TextStyle(
                                    fontFamily: 'DmSans',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade400),
                              ),
                              Text(
                                item.notes,
                                style: TextStyle(
                                    fontFamily: 'DmSans',
                                    color: Colors.blueGrey.shade900,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Summary',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'DmSans',
                                    color: Colors.grey.shade400),
                              ),
                              Text(
                                item.summary,
                                style: TextStyle(
                                    fontFamily: 'DmSans',
                                    color: Colors.blueGrey.shade900,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.lightBlue.shade200,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: item.activityStatus == null
                                          ? Row(
                                              children: [
                                                Text(
                                                  'Activity Status: ',
                                                  style: TextStyle(
                                                      fontFamily: 'DmSans',
                                                      color: Colors
                                                          .blueGrey.shade500,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 11),
                                                ),
                                                Text(
                                                  'null',
                                                  style: TextStyle(
                                                      fontFamily: 'DmSans',
                                                      color: Colors
                                                          .blueGrey.shade900,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 11),
                                                ),
                                              ],
                                            )
                                          : Row(
                                              children: [
                                                Text(
                                                  'Activity Status: ',
                                                  style: TextStyle(
                                                      fontFamily: 'DmSans',
                                                      color: Colors
                                                          .blueGrey.shade500,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 11),
                                                ),
                                                Text(
                                                  item.activityStatus,
                                                  style: TextStyle(
                                                      fontFamily: 'DmSans',
                                                      color: Colors
                                                          .blueGrey.shade900,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 11),
                                                ),
                                              ],
                                            ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.lightGreen.shade200,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Activity type: ',
                                            style: TextStyle(
                                                fontFamily: 'DmSans',
                                                color: Colors.blueGrey.shade500,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11),
                                          ),
                                          Text(
                                            'Call',
                                            style: TextStyle(
                                                fontFamily: 'DmSans',
                                                color: Colors.blueGrey.shade900,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 11),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('assets/mainlogo.png'),
                                    fit: BoxFit.cover),
                                border: Border.all(
                                    color: Colors.lightGreen, width: 0.5)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1.0,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.date_range_outlined,
                            color: Colors.blueGrey.shade800,
                            size: 16,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Created on ' + item.createdOn,
                              style: TextStyle(
                                  fontFamily: 'DmSans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.notifications_outlined,
                            color: Colors.blueGrey.shade800,
                            size: 16,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Due date on ' + item.dueDate,
                              style: TextStyle(
                                  fontFamily: 'DmSans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
