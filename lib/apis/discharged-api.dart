import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Table5>> fetchDischarged(
    http.Client client, int referral_code_id, int created_by) async {
  final response = await client.post(
      Uri.parse(
          'your_api_url'),
      body: jsonEncode({
        "dml_indicator": "DLCD",
        "referral_code_id": referral_code_id,
        "created_by": created_by
      }),
      headers: {"Content-Type": "application/json"});
  final parsed = jsonDecode(response.body);
  Dishcharged dishcharged = Dishcharged.fromJson(parsed);
  return dishcharged.table;
}

List<Table> parseData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Table5>((json) => Dishcharged.fromJson(json)).toList();
}

class Dishcharged {
  List<Table5> table;

  Dishcharged({this.table});

  Dishcharged.fromJson(Map<String, dynamic> json) {
    if (json['Table'] != null) {
      table = new List<Table5>();
      json['Table'].forEach((v) {
        table.add(new Table5.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.table != null) {
      data['Table'] = this.table.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Table5 {
  String caseId;
  String caseStatus;
  int referralCodeId;
  String patientId;
  String individualId;
  String patientName;
  String phoneNumber1;
  String age;
  String dob;
  int gender;
  String doctorId;
  String doctorName;
  String doctorPhoneNumber;
  String hospitalName;
  String classification;
  String createdOn;

  Table5(
      {this.caseId,
      this.caseStatus,
      this.referralCodeId,
      this.patientId,
      this.individualId,
      this.patientName,
      this.phoneNumber1,
      this.age,
      this.dob,
      this.gender,
      this.doctorId,
      this.doctorName,
      this.doctorPhoneNumber,
      this.hospitalName,
      this.classification,
      this.createdOn});

  Table5.fromJson(Map<String, dynamic> json) {
    caseId = json['case_id'];
    caseStatus = json['case_status'];
    referralCodeId = json['referral_code_id'];
    patientId = json['patient_id'];
    individualId = json['individual_id'];
    patientName = json['patient_name'];
    phoneNumber1 = json['phone_number_1'];
    age = json['age'];
    dob = json['dob'];
    gender = json['gender'];
    doctorId = json['doctor_id'];
    doctorName = json['doctor_name'];
    doctorPhoneNumber = json['doctor_phone_number'];
    hospitalName = json['hospital_name'];
    classification = json['classification'];
    createdOn = json['created_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['case_id'] = this.caseId;
    data['case_status'] = this.caseStatus;
    data['referral_code_id'] = this.referralCodeId;
    data['patient_id'] = this.patientId;
    data['individual_id'] = this.individualId;
    data['patient_name'] = this.patientName;
    data['phone_number_1'] = this.phoneNumber1;
    data['age'] = this.age;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['doctor_id'] = this.doctorId;
    data['doctor_name'] = this.doctorName;
    data['doctor_phone_number'] = this.doctorPhoneNumber;
    data['hospital_name'] = this.hospitalName;
    data['classification'] = this.classification;
    data['created_on'] = this.createdOn;
    return data;
  }
}
