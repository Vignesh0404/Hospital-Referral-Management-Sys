import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

functionLoaderBox(BuildContext context) async {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Loading, Please wait..',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: 'Nunito',
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: CircularProgressIndicator(
                  strokeWidth: 4.0, backgroundColor: Color(0xFFD64652)),
            )
          ],
        ),
      );
    },
  );
}
