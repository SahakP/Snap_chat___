import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:snap_chat_copy/widgets/home.dart';

void main() async {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['i18n'];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Snap_Copy',
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('ru', 'RU'),
      ],
      localizationsDelegates: [
        // AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocalJsonLocalization.delegate,
      ],
      home: const HomePage(),
    );
  }
}
// LocalJsonLocalization.delegate.directories = [‘lib/i18n’];
//   runApp(MaterialApp(supportedLocales: [
//     const Locale(‘en’, ‘’),
//     const Locale(‘ru’, ‘’),
//   ], localizationsDelegates: [
//     GlobalMaterialLocalizations.delegate,
//     GlobalWidgetsLocalizations.delegate,
//     GlobalCupertinoLocalizations.delegate,
//     LocalJsonLocalization.delegate,