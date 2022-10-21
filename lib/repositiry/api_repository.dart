import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:snap_chat_copy/model/country_model.dart';

class ApiRepository {
  Future<List<Country>> loadCountries() async {
    var _countries = <Country>[];
    final response = await http
        .get(Uri.parse('https://parentstree-server.herokuapp.com/countries'));

    if (response.statusCode == 200) {
      final countriesJson = jsonDecode(response.body)['countries'] as List;
      _countries = countriesJson.map((e) => Country.fromJson(e)).toList();
    }
    return _countries;
  }

  Future<String> loadLocation() async {
    var currentCountry = '';
    final locale = await http.get(Uri.parse('http://ip-api.com/json'));
    if (locale.statusCode == 200) {
      currentCountry = json.decode(locale.body)['countryCode'].toString();
    }
    return currentCountry;
  }
}
