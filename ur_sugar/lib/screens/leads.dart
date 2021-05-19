import 'package:flutter/material.dart';

class Leads extends StatelessWidget {
  const Leads({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Leads,',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'get your leads details here!',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.pink.shade100,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Row(
                      children: [
                        Text(
                          'Treatment ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.pink.shade800),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: Colors.pink.shade800,
                        )
                      ],
                    )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  // height: 200,
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
                            children: [
                              Text(
                                'Ceftrianxone Powder',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Spacer(),
                              Text(
                                'Not used',
                                style: TextStyle(
                                    color: Colors.lightBlue.shade400,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                width: 2,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Medicament',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade400),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Dosage',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade400),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('20 ml')
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Duration',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade400),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('7 days')
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Start',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade400),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Mar 1, 2020')
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Times',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade400),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Every 3 hours, every day.'),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Comment',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade400),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              'Dissolve the powder in a glass of warm water and drink.'),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.lightBlue.shade200,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'You have to drink 2 dose today!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
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
                              Text('Prescribed on Feb 10, 2020')
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
                              Text('Reminder Added')
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
        ));
  }

  Widget leads(String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(16.0),
          child: Table(
            //defaultColumnWidth: FixedColumnWidth(150),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder.symmetric(
                inside: BorderSide(color: Colors.black),
                outside: BorderSide(width: 1.2, color: Colors.black)),
            children: [
              TableRow(
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [
                    Center(
                      child: Text(
                        'LEAD ID',
                        style: TextStyle(),
                      ),
                    ),
                    Center(child: Text('NO.OF MED')),
                    Center(child: Text('STATUS')),
                  ]),
              TableRow(children: [
                Text('  123'),
                Text('  87'),
                Text('  Yes'),
              ]),
              TableRow(children: [
                Text('  123'),
                Text('  97'),
                Text('  Yes'),
              ]),
              TableRow(children: [
                Text('  123'),
                Text('  100'),
                Text('  Yes'),
              ]),
              TableRow(children: [
                Text('  123'),
                Text('  81'),
                Text('  Yes'),
              ]),
              TableRow(children: [
                Text('  123'),
                Text('  91'),
                Text('  Yes'),
              ]),
            ],
          ),
        )
      ],
    );
  }
}
