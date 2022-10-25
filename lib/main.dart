import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:snap_chat_copy/widgets/home.dart';

import 'localization/constant.dart';
import 'localization/initialize_i18n.dart';
import 'localization/localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Map<String, Map<String, String>> localizedValues = await initializeI18n();
  runApp(MyApp(localizedValues));
}

class MyApp extends StatefulWidget {
  final Map<String, Map<String, String>> localizedValues;
  const MyApp(this.localizedValues);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //Locale myLocale = Localizations.localeOf(context);

    //final _locale = myLocale.toString();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Snap_Copy',
      locale: Locale("ru"),
      localizationsDelegates: [
        MyLocalizationsDelegate(widget.localizedValues),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: languages.map((language) => Locale(language, '')),
      home: const HomePage(),
    );
  }
}
