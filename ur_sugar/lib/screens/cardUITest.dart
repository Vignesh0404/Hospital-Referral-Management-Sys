import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'dart:math' as math;

class CardUI extends StatefulWidget {
  CardUI({Key key}) : super(key: key);

  @override
  _CardUIState createState() => _CardUIState();
}

class _CardUIState extends State<CardUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Card0(),
        ],
      )),
    );
  }
}

class Card0 extends StatelessWidget {
  const Card0({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        '#',
                        style: TextStyle(
                            fontFamily: 'DmSans',
                            fontWeight: FontWeight.w800,
                            fontSize: 8),
                      ),
                      Text(
                        'CS0000017',
                        style: TextStyle(
                            fontFamily: 'DmSans',
                            fontWeight: FontWeight.w400,
                            fontSize: 8),
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
                                    return Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 3,
                                                      width: 45,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.blueGrey,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "Mahesh (24 yrs/Male)",
                                                      style: TextStyle(
                                                          fontFamily: 'DmSans',
                                                          color: Colors.black87,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 14),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0,
                                                    left: 12,
                                                    right: 12,
                                                    bottom: 8),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Wrap(
                                                      runSpacing: 50,
                                                      spacing: 50,
                                                      alignment: WrapAlignment
                                                          .spaceBetween,
                                                      direction:
                                                          Axis.horizontal,
                                                      children: [
                                                        Container(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .history_outlined,
                                                                color: Colors
                                                                    .blueGrey
                                                                    .shade700,
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                'Log Details',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'DmSans',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .blueGrey
                                                                        .shade400),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .schedule_outlined,
                                                                color: Colors
                                                                    .blueGrey
                                                                    .shade700,
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                'Schedule Activity',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'DmSans',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .blueGrey
                                                                        .shade400),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .local_hospital_outlined,
                                                                color: Colors
                                                                    .blueGrey
                                                                    .shade700,
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                'Admit Now',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'DmSans',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .blueGrey
                                                                        .shade400),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Wrap(
                                                      runSpacing: 50,
                                                      spacing: 50,
                                                      alignment: WrapAlignment
                                                          .spaceBetween,
                                                      direction:
                                                          Axis.horizontal,
                                                      children: [
                                                        Container(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .send_and_archive,
                                                                color: Colors
                                                                    .blueGrey
                                                                    .shade700,
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                'Send to Lost',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'DmSans',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .blueGrey
                                                                        .shade400),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .chat_bubble_outline,
                                                                color: Colors
                                                                    .blueGrey
                                                                    .shade700,
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                'Chat with Doc',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'DmSans',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .blueGrey
                                                                        .shade400),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                  Icons
                                                                      .local_hospital_outlined,
                                                                  color: Colors
                                                                      .white),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                '',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'DmSans',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .blueGrey
                                                                        .shade400),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ));
                                  });
                            }),
                      )
                    ],
                  ),
                  Text(
                    'Parthiban,',
                    style: TextStyle(
                        fontFamily: 'DmSans',
                        fontWeight: FontWeight.w800,
                        fontSize: 16),
                  ),
                  Row(
                    children: [
                      Text(
                        '24 yrs/Male',
                        style: TextStyle(
                            fontFamily: 'DmSans',
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: Colors.grey.shade500),
                      ),
                      Spacer(),
                      Text(
                        '+91 8668088824',
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
                        'Doc Arun Kesavan',
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
                        'Heart Surgeon',
                        style: TextStyle(
                            fontFamily: 'DmSans',
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: Colors.grey.shade500),
                      ),
                      Spacer(),
                      Text(
                        '+91 9841586901',
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
                        'TARAMANI',
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
                    decoration: BoxDecoration(color: Colors.blueGrey.shade300),
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
                            '24-Apr-2021 05:56 PM',
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
  }
}

class Card1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 150,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "ExpandablePanel",
                      style: Theme.of(context).textTheme.body2,
                    )),
                collapsed: Text(
                  "loremIpsum",
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var _ in Iterable.generate(5))
                      Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "loremIpsum",
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          )),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Card2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildMainContainer() {
      return Container(
        height: 150,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.black,
                height: 0.5,
                width: double.infinity,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Patient details',
                style: TextStyle(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w500,
                    fontSize: 10),
              ),
              Row(
                children: [
                  Text(
                    'PARTHIBAN',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '+91-9841586901',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white
                      //color: Colors.green.shade400,
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Referred Date : 24-Apr-2021 05:56 PM',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                              height: MediaQuery.of(context).size.height / 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Title",
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Wrap(
                                      runSpacing: 8,
                                      spacing: 8,
                                      direction: Axis.horizontal,
                                      children: [
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(Icons.notes),
                                              Text('Log Notes')
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(Icons.notes),
                                              Text('Log Notes')
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ));
                        });
                  })
              // Row(
              //   children: [
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           'Call Management',
              //           style: TextStyle(
              //               fontWeight: FontWeight.w600, fontSize: 12),
              //         ),
              //         SizedBox(
              //           height: 5,
              //         ),
              //         Row(
              //           children: [
              //             Container(
              //               color: Colors.green.shade400,
              //               child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Text(
              //                   'Log Details',
              //                   style: TextStyle(
              //                       color: Colors.white,
              //                       fontWeight: FontWeight.w300,
              //                       fontSize: 10),
              //                 ),
              //               ),
              //             ),
              //             SizedBox(
              //               width: 5,
              //             ),
              //             Container(
              //               color: Colors.green.shade400,
              //               child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Text(
              //                   'Scheduled Activity',
              //                   style: TextStyle(
              //                       color: Colors.white,
              //                       fontWeight: FontWeight.w300,
              //                       fontSize: 10),
              //                 ),
              //               ),
              //             )
              //           ],
              //         ),
              //       ],
              //     ),
              //     Spacer(),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           'Actions',
              //           style: TextStyle(
              //               fontWeight: FontWeight.w600, fontSize: 12),
              //         ),
              //         SizedBox(
              //           height: 5,
              //         ),
              //         Row(
              //           children: [
              //             Container(
              //               color: Colors.blue.shade600,
              //               child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Text(
              //                   'Admit',
              //                   style: TextStyle(
              //                       color: Colors.white,
              //                       fontWeight: FontWeight.w300,
              //                       fontSize: 10),
              //                 ),
              //               ),
              //             ),
              //             SizedBox(
              //               width: 5,
              //             ),
              //             Container(
              //               color: Colors.blue.shade600,
              //               child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Text(
              //                   'Lost',
              //                   style: TextStyle(
              //                       color: Colors.white,
              //                       fontWeight: FontWeight.w300,
              //                       fontSize: 10),
              //                 ),
              //               ),
              //             )
              //           ],
              //         ),
              //       ],
              //     )
              //   ],
              // ),
            ],
          ),
        ),
      );
    }

    buildImg(Color color, double height, child) {
      return SizedBox(
          height: height,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
            ),
            child: child,
          ));
    }

    buildCollapsed1() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        "DR.ARUN KESAVAN",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      Spacer(),
                      Text(
                        '+91-8668088824',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ]);
    }

    buildCollapsed2() {
      return buildMainContainer();
    }

    buildExpanded1() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 310,
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Parthiban",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ' (25, MALE)',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 8),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              "patient phone num",
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text("#",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Container(
                            width: 300,
                            child: Row(
                              children: [
                                Text(
                                  "CID00000000014",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                Spacer(),
                                Text(
                                  "+918668088824",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]);
    }

    buildExpanded2() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: buildImg(
                      Colors.white,
                      100,
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.local_hospital_outlined,
                                          color: Colors.green.shade400,
                                          size: 14,
                                        ),
                                        Text(
                                          ' Doctor Name',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'DR. ARUN KESAVAN',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.phone_callback_outlined,
                                          color: Colors.green.shade400,
                                          size: 14,
                                        ),
                                        Text(
                                          ' Doctor phone num',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '+919841586901',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            //
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.local_pharmacy_outlined,
                                          color: Colors.green.shade400,
                                          size: 14,
                                        ),
                                        Text(
                                          ' Internal Doctor',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Vijay',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.folder_special_outlined,
                                          color: Colors.green.shade400,
                                          size: 14,
                                        ),
                                        Text(
                                          ' Speciality',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '+jhjk',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
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
                                Text(
                                  'Suggested Treatment:',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                Text('  firs referral for this patient',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400)),
                              ],
                            )
                          ],
                        ),
                      ))),
            ],
          ),
        ],
      );
    }

    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: ScrollOnExpand(
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expandable(
                collapsed: buildCollapsed1(),
                expanded: buildExpanded1(),
              ),
              Expandable(
                collapsed: buildCollapsed2(),
                expanded: buildExpanded2(),
              ),
              Divider(
                height: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Builder(
                    builder: (context) {
                      var controller =
                          ExpandableController.of(context, required: true);
                      return TextButton(
                        child:
                            Text(controller.expanded ? "COLLAPSE" : "EXPAND"),
                        onPressed: () {
                          controller.toggle();
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class Card3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildItem(String label) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(label),
      );
    }

    buildList() {
      return Column(
        children: <Widget>[
          for (var i in [1, 2, 3, 4]) buildItem("Item ${i}"),
        ],
      );
    }

    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: ScrollOnExpand(
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToExpand: true,
                  tapBodyToCollapse: true,
                  hasIcon: false,
                ),
                header: Container(
                  color: Colors.indigoAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        ExpandableIcon(
                          theme: const ExpandableThemeData(
                            expandIcon: Icons.arrow_right,
                            collapseIcon: Icons.arrow_drop_down,
                            iconColor: Colors.white,
                            iconSize: 28.0,
                            iconRotationAngle: math.pi / 2,
                            iconPadding: EdgeInsets.only(right: 5),
                            hasIcon: false,
                          ),
                        ),
                        Expanded(
                          child: Text("Items"),
                        ),
                      ],
                    ),
                  ),
                ),
                collapsed: Container(),
                expanded: buildList(),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
