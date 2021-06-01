import 'dart:math';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:ur_sugar/localizationsTest/provider.dart';
import 'package:ur_sugar/login.dart';
import 'package:ur_sugar/onBoardingScreen.dart';
import 'package:ur_sugar/utils/botNav.dart';
import 'package:ur_sugar/utils/splash.dart';
import 'localizationsTest/l10n.dart';
import 'localizationsTest/translate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        final provider = Provider.of<LocaleProvider>(context);
        return MaterialApp(
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            
            ],
            debugShowCheckedModeBanner: false,
            home: Login());
      });
}
