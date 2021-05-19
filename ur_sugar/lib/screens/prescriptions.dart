import 'package:flutter/material.dart';

class Prescriptions extends StatelessWidget {
  const Prescriptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Prescriptions,',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                'get your prescriptions details here!',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              // cards(),
              // cards(),
              // cards(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          'Download Prescription',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          'Download xyz',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Material(
                elevation: 5,
                child: Container(
                  //color: Colors.red,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.1),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Miscellaneous',
                              style: TextStyle(
                                  color: Colors.lightGreen,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              color: Colors.grey.shade400,
                              height: 15,
                              width: 1.5,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '03 Apr 2021',
                              style: TextStyle(
                                  color: Colors.lightGreen,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10),
                            ),
                            Spacer(),
                            Icon(
                              Icons.wb_sunny_outlined,
                              color: Colors.yellow.shade800,
                              size: 18,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.wb_sunny_outlined,
                              color: Colors.yellow.shade800,
                              size: 18,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.wb_sunny_outlined,
                              color: Colors.yellow.shade800,
                              size: 18,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.wb_sunny_outlined,
                              color: Colors.yellow.shade800,
                              size: 18,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              child: Text(
                                'Caramilk chocolates',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '41',
                              style: TextStyle(fontSize: 10),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Container(
                              color: Colors.grey,
                              width: 1,
                              height: 15,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              '11',
                              style: TextStyle(fontSize: 10),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Container(
                              color: Colors.grey,
                              width: 1,
                              height: 15,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              '21',
                              style: TextStyle(fontSize: 10),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              color: Colors.grey,
                              width: 1,
                              height: 15,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '11',
                              style: TextStyle(fontSize: 10),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Note: Before food',
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Stock in hand',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                                Text('0')
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              color: Colors.grey.shade400,
                              height: 25,
                              width: 1.5,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Stock in hand',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                                Text(
                                  '-',
                                  style: TextStyle(color: Colors.red.shade600),
                                )
                              ],
                            ),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.lightBlue),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Deliver now',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cards() {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          const ListTile(
            leading: Icon(Icons.album),
            title: Text('The medicine name, doctor'),
            subtitle: Text('prescribed by Julie Arnoald. SMF hospitals.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('VIEW MORE'),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('UPDATE'),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
