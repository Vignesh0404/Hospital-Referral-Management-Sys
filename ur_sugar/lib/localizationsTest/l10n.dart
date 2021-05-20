import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('ta'),
    const Locale('hi')
  ];

  static String getCode(String code) {
    switch (code) {
      case 'ta':
        return 'அ';
      case 'hi':
        return 'अ';
      case 'en':
      default:
        return 'A';
    }
  }
}
