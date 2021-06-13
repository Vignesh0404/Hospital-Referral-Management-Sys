import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Table6>> fetchAdmits(
    http.Client client, int referral_code_id, int created_by) async {
  final response = await client.post(
      Uri.parse(
          'https://referralapi.convenientcare.life/api/Case_Details/GetCaseDetails'),
      body: jsonEncode({
        "dml_indicator": "ACD",
        "referral_code_id": referral_code_id,
        "created_by": created_by
      }),
      headers: {"Content-Type": "application/json"});
  final parsed = jsonDecode(response.body);
  Admits admits = Admits.fromJson(parsed);
  return admits.table;
}

List<Table> parseData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Table6>((json) => Admits.fromJson(json)).toList();
}

class Admits {
  List<Table6> table;

  Admits({this.table});

  Admits.fromJson(Map<String, dynamic> json) {
    if (json['Table'] != null) {
      table = new List<Table6>();
      json['Table'].forEach((v) {
        table.add(new Table6.fromJson(v));
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

class Table6 {
  String caseId;
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

  Table6(
      {this.caseId,
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

  Table6.fromJson(Map<String, dynamic> json) {
    caseId = json['case_id'];
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
