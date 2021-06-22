import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Table1>> fetchPhotos(
    http.Client client, int referral_code_id) async {
  final response = await client.post(
      Uri.parse(
          "your_api_url"),
      body: json.encode({'dml_indicator': "SCD", "referral_code_id": referral_code_id}),
      headers: {"Content-Type": "application/json"});

  final parsed = jsonDecode(response.body);

  Photo photo = Photo.fromJson(parsed);
  return photo.table;
}

// A function that converts a response body into a List<Photo>.
List<Table> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Table1>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  List<Table1> table;

  Photo({this.table});

  Photo.fromJson(Map<String, dynamic> json) {
    if (json['Table'] != null) {
      table = new List<Table1>();
      json['Table'].forEach((v) {
        table.add(new Table1.fromJson(v));
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

class Table1 {
  String caseId;
  int referralCodeId;
  String patientId;
  String individualId;
  String patientName;
  String phoneNumber1;
  String age;
  String dob;
  String gender;
  String doctorId;
  String doctorName;
  String doctorPhoneNumber;
  String hospitalName;
  String classification;
  String createdOn;

  Table1(
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

  Table1.fromJson(Map<String, dynamic> json) {
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
