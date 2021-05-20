import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:ur_sugar/localizationsTest/l10n.dart';
import 'package:ur_sugar/localizationsTest/provider.dart';

class TranslateTest extends StatefulWidget {
  TranslateTest({Key key}) : super(key: key);

  @override
  _TranslateTestState createState() => _TranslateTestState();
}

class _TranslateTestState extends State<TranslateTest> {
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final code = L10n.getCode(locale.countryCode);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          LanguagePickerWidget(),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              AppLocalizations.of(context).greeting('Vignesh,'),
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
              child: Text(AppLocalizations.of(context).selected +
                  ' ' +
                  AppLocalizations.of(context).language)),
          SizedBox(
            height: 10,
          ),
          Center(child: Text(AppLocalizations.of(context).helloWorld)),
          SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new SecondPage()));
                },
                child: Text('next page')),
          )
        ],
      )),
    );
  }
}

class LanguagePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale ?? Locale('en');

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: locale,
        icon: Container(width: 12),
        items: L10n.all.map(
          (locale) {
            final code = L10n.getCode(locale.languageCode);

            return DropdownMenuItem(
              child: Center(
                child: Text(
                  code,
                  style: TextStyle(fontSize: 32),
                ),
              ),
              value: locale,
              onTap: () {
                final provider =
                    Provider.of<LocaleProvider>(context, listen: false);

                provider.setLocale(locale);
              },
            );
          },
        ).toList(),
        onChanged: (_) {},
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('second page'),
            Text('language:' + ' ' + AppLocalizations.of(context).language)
          ],
        ),
      )),
    );
  }
}
