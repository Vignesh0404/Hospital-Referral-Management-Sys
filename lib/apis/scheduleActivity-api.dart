import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Table4>> fetchLogs(http.Client client, String case_id) async {
  final response = await client.post(
      Uri.parse(
          'your_api_url'),
      body: jsonEncode({"dml_indicator": "GADD", "referral_code_id": "1", "case_id": case_id}),
      headers: {"Content-Type": "application/json"});

  final parsed = jsonDecode(response.body);
  Schedule schedule = Schedule.fromJson(parsed);
  return schedule.table;
}

List<Table> parseData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Table4>((json) => Schedule.fromJson(json)).toList();
}

class Schedule {
  List<Table4> table;

  Schedule({this.table});

  Schedule.fromJson(Map<String, dynamic> json) {
    if (json['Table'] != null) {
      table = new List<Table4>();
      json['Table'].forEach((v) {
        table.add(new Table4.fromJson(v));
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

class Table4 {
  //String activityType;
  String summary;
  String attachmentFile;
  String dueDate;
  String assignedTo;
  String notes;
  Null activityStatus;
  String createdOn;

  Table4(
      {
      //this.activityType,
      this.summary,
      this.attachmentFile,
      this.dueDate,
      this.assignedTo,
      this.notes,
      this.activityStatus,
      this.createdOn});

  Table4.fromJson(Map<String, dynamic> json) {
    //activityType = json['activity_type'];
    summary = json['summary'];
    attachmentFile = json['attachment_file'];
    dueDate = json['due_date'];
    assignedTo = json['assigned_to'];
    notes = json['notes'];
    //activityStatus = json['activity_status'];
    createdOn = json['created_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    //data['activity_type'] = this.activityType;
    data['summary'] = this.summary;
    data['attachment_file'] = this.attachmentFile;
    data['due_date'] = this.dueDate;
    data['assigned_to'] = this.assignedTo;
    data['notes'] = this.notes;
    data['activity_status'] = this.activityStatus;
    data['created_on'] = this.createdOn;
    return data;
  }
}
