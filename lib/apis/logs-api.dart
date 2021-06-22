import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Table3>> fetchLogs(http.Client client, String case_id) async {
  final response = await client.post(
      Uri.parse(
          'your_api_url'),
      body: jsonEncode({"dml_indicator": "CLD", "referral_code_id": "1", "case_id": case_id}),
      headers: {"Content-Type": "application/json"});

  final parsed = jsonDecode(response.body);
  Logs logs = Logs.fromJson(parsed);
  return logs.table;
}

List<Table> parseData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Table3>((json) => Logs.fromJson(json)).toList();
}

class Logs {
  List<Table3> table;

  Logs({this.table});

  Logs.fromJson(Map<String, dynamic> json) {
    if (json['Table'] != null) {
      table = new List<Table3>();
      json['Table'].forEach((v) {
        table.add(new Table3.fromJson(v));
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

class Table3 {
  int logDetailsId;
  String logNotes;
  String createdOn;

  Table3({this.logDetailsId, this.logNotes, this.createdOn});

  Table3.fromJson(Map<String, dynamic> json) {
    logDetailsId = json['log_details_id'];
    logNotes = json['log_notes'];
    createdOn = json['created_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['log_details_id'] = this.logDetailsId;
    data['log_notes'] = this.logNotes;
    data['created_on'] = this.createdOn;
    return data;
  }
}
