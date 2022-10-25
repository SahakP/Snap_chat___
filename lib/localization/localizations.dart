import 'dart:async' show Future;
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

import 'constant.dart';

class MyLocalizations {
  final Map<String, Map<String, String>> localizedValues;
  MyLocalizations(this.locale, this.localizedValues);

  final Locale locale;

  static MyLocalizations? of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

  String? get logIn {
    return localizedValues[locale.languageCode]!['login'];
  }

  String? get LogIn {
    return localizedValues[locale.languageCode]!['LOGIN'];
  }

  String? get SignUp {
    return localizedValues[locale.languageCode]!['SIGNUP'];
  }

  String? get tryEnterCorrectData {
    return localizedValues[locale.languageCode]!['tryEnterCorrectData'];
  }

  String? get userNotFound {
    return localizedValues[locale.languageCode]!['userNotFound'];
  }

  String? get ok {
    return localizedValues[locale.languageCode]!['ok'];
  }

  String? get forgotYourPassword {
    return localizedValues[locale.languageCode]!['forgotYourPassword'];
  }

  String? get usernaemErrorMsg {
    return localizedValues[locale.languageCode]!['usernaemErrorMsg'];
  }

  String? get passwordErrorMsg {
    return localizedValues[locale.languageCode]!['passwordErrorMsg'];
  }

  String? get password {
    return localizedValues[locale.languageCode]!['password'];
  }

  String? get usernaemOrEmail {
    return localizedValues[locale.languageCode]!['usernaemOrEmail'];
  }

  String? get whatsYoureName {
    return localizedValues[locale.languageCode]!['whatsYoureName'];
  }

  String? get FirstName {
    return localizedValues[locale.languageCode]!['firstName'];
  }

  String? get lastName {
    return localizedValues[locale.languageCode]!['lastName'];
  }

  String? get textSpan1 {
    return localizedValues[locale.languageCode]!['textSpan1'];
  }

  String? get textSpan2 {
    return localizedValues[locale.languageCode]!['textSpan2'];
  }

  String? get textSpan3 {
    return localizedValues[locale.languageCode]!['textSpan3'];
  }

  String? get textSpan4 {
    return localizedValues[locale.languageCode]!['textSpan4'];
  }

  String? get signUpAccept {
    return localizedValues[locale.languageCode]!['signUpAccept'];
  }

  String? get whensYoureBirthday {
    return localizedValues[locale.languageCode]!['whensYoureBirthday'];
  }

  String? get BIRTHDAY {
    return localizedValues[locale.languageCode]!['BIRTHDAY'];
  }

  String? get birthdayErrorMsg {
    return localizedValues[locale.languageCode]!['birthdayErrorMsg'];
  }

  String? get Continue {
    return localizedValues[locale.languageCode]!['Continue'];
  }

  String? get whatsYoureEmail {
    return localizedValues[locale.languageCode]!['whatsYoureEmail'];
  }

  String? get whatsYourMobileNumber {
    return localizedValues[locale.languageCode]!['whatsYourMobileNumber'];
  }

  String? get EMAIL {
    return localizedValues[locale.languageCode]!['EMAIL'];
  }

  String? get emailErrorMsg {
    return localizedValues[locale.languageCode]!['emailErrorMsg'];
  }

  String? get smsVerification {
    return localizedValues[locale.languageCode]!['smsVerification'];
  }

  String? get MOBILENUMBER {
    return localizedValues[locale.languageCode]!['MOBILENUMBER'];
  }

  String? get signUpWithEmail {
    return localizedValues[locale.languageCode]!['signUpWithEmail'];
  }

  String? get signUpWithPhone {
    return localizedValues[locale.languageCode]!['signUpWithPhone'];
  }

  String? get pickAUsername {
    return localizedValues[locale.languageCode]!['pickAUsername'];
  }

  String? get underHederText {
    return localizedValues[locale.languageCode]!['underHederText'];
  }

  String? get userNameErrorMsg {
    return localizedValues[locale.languageCode]!['userNameErrorMsg'];
  }

  String? get USERNAME {
    return localizedValues[locale.languageCode]!['USERNAME'];
  }

  String? get setAPassword {
    return localizedValues[locale.languageCode]!['setAPassword'];
  }

  String? get underPassHedTxt {
    return localizedValues[locale.languageCode]!['underPassHedTxt'];
  }

  greetTo(name) {
    return localizedValues[locale.languageCode]!['greetTo']!
        .replaceAll('{{name}}', name);
  }
}

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  Map<String, Map<String, String>> localizedValues;

  MyLocalizationsDelegate(this.localizedValues);

  @override
  bool isSupported(Locale locale) => languages.contains(locale.languageCode);

  @override
  Future<MyLocalizations> load(Locale locale) {
    return SynchronousFuture<MyLocalizations>(
        MyLocalizations(locale, localizedValues));
  }

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}
