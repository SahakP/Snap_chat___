import 'package:flutter/cupertino.dart';

import '../model/country_model.dart';

class MyValueNotifier extends ValueNotifier<Country?> {
  MyValueNotifier({Country? value}) : super(value);

  void country(Country selectedCountry) {
    value = selectedCountry;
  }
}
