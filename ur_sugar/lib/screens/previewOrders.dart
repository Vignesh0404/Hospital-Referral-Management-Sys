import 'package:flutter/material.dart';

class PreviewOrder extends StatefulWidget {
  PreviewOrder({Key key}) : super(key: key);

  @override
  _PreviewOrderState createState() => _PreviewOrderState();
}

class _PreviewOrderState extends State<PreviewOrder> {
  int _currentStep = 0;
  List<Step> steps = [
    Step(
        title: Text(
          "Order Purchased",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        content: Text(""),
        isActive: true,
        state: StepState.complete),
    Step(
        title: Text(
          "Task Assigned",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        content: Text(""),
        isActive: true,
        state: StepState.complete),
    Step(
        title: Text(
          "Service Provider Accepted",
          style: TextStyle(
              color: Colors.grey.shade600, fontWeight: FontWeight.w400),
        ),
        content: Text(""),
        isActive: true,
        state: StepState.indexed),
    Step(
        title: Text(
          "Navigating to Customer Location",
          style: TextStyle(
              color: Colors.grey.shade600, fontWeight: FontWeight.w400),
        ),
        content: Text(""),
        isActive: true,
        state: StepState.indexed),
    Step(
        title: Text(
          "Service Started",
          style: TextStyle(
              color: Colors.grey.shade600, fontWeight: FontWeight.w400),
        ),
        content: Text(""),
        isActive: true,
        state: StepState.indexed),
    Step(
        title: Text(
          "End Service",
          style: TextStyle(
              color: Colors.grey.shade600, fontWeight: FontWeight.w400),
        ),
        content: Text(""),
        isActive: true,
        state: StepState.indexed),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Color(0xFF8218E6),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(
          "Preview Order",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Package Details',
                        style: TextStyle(
                            color: Color(0xFF8218E6),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      Divider(
                        thickness: 0.5,
                      ),
                      Text(
                        "Package Name",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Customer Address',
                        style: TextStyle(
                            color: Color(0xFF8218E6),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      Divider(
                        thickness: 0.5,
                      ),
                      Text(
                        "Ram Kumar",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '6, New street, Stimushnam',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                      ),
                      Text(
                        'null',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                      ),
                      Text(
                        'poryr - null',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Timings',
                        style: TextStyle(
                            color: Color(0xFF8218E6),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      Divider(
                        thickness: 0.5,
                      ),
                      Text(
                        "",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Summary',
                        style: TextStyle(
                            color: Color(0xFF8218E6),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      Divider(
                        thickness: 0.5,
                      ),
                      Theme(
                        data: ThemeData(
                            // accentColor: Colors.lightGreen,
                            //primaryColor: Colors.lightGreen,
                            primarySwatch: Colors.green),
                        child: Stepper(
                          controlsBuilder: (BuildContext context,
                              {VoidCallback onStepContinue,
                              VoidCallback onStepCancel}) {
                            return Row(
                              children: <Widget>[
                                TextButton(
                                  onPressed: onStepContinue,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.thumb_up,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Accept",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: onStepCancel,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.thumb_down_alt,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Reject",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          currentStep: this._currentStep,
                          steps: steps,
                          type: StepperType.vertical,
                          onStepTapped: (step) {
                            setState(() {
                              _currentStep = step;
                            });
                          },
                          onStepCancel: () {
                            if (_currentStep > 0) {
                              _currentStep = _currentStep - 1;
                            } else {
                              _currentStep = 0;
                            }
                          },
                          onStepContinue: () {
                            setState(() {
                              if (_currentStep < steps.length - 1) {
                                _currentStep = _currentStep + 1;
                              } else {
                                _currentStep = 0;
                              }
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
