import 'package:flutter/material.dart';
import 'package:ur_sugar/apis/scheduleActivity-api.dart';
import 'package:http/http.dart' as http;

class ScheduleActivity extends StatefulWidget {
  const ScheduleActivity({Key key, this.caseId}) : super(key: key);
  final String caseId;

  @override
  _ScheduleActivityState createState() => _ScheduleActivityState();
}

class _ScheduleActivityState extends State<ScheduleActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF8218E6),
        centerTitle: true,
        title: Text(
          widget.caseId,
          style: TextStyle(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Add Schedule'),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'check or add to your schedules!',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
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
                color: Colors.pink.shade700,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
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
                                'Notes',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade400),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(item.notes),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Summary',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade400),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(item.summary),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.lightBlue.shade200,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: item.activityStatus == null
                                          ? Text('Activity Status:' + 'null')
                                          : Text(
                                              'Activity Status: ' +
                                                  item.activityStatus,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11),
                                            ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.lightGreen.shade200,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Activity type: Call',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            width: 80,
                            height: 80,
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
                            color: Colors.grey.shade500,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Created on ' + item.createdOn)
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.notifications_outlined,
                            color: Colors.grey.shade500,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Due date on ' + item.dueDate)
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
