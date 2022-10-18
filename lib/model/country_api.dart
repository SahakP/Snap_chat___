// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import 'package:snap_chat_copy/model/country.dart';

// class ApiClient {
//   List<Country> countries = [];

//   Future<List<Country>> getCountry() async {
//     final response = await http
//         .get(Uri.parse('https://parentstree-server.herokuapp.com/countries'));

//     if (response.statusCode == 200) {
//       ((jsonDecode(response.body)['countries']) as List).forEach((e) {
//         countries.add(Country.fromJson(e));
//       });
//       return countries;
//     } else {
//       throw Exception('Failed to load countries');
//     }
//   }

//   // Future<List<Country>> getCountry() async {
//   //   final url = Uri.parse('https://parentstree-server.herokuapp.com/countries');
//   //   final request = await client.getUrl(url);
//   //   final response = await request.close();

//   //   final jsonStrings = await response.transform(utf8.decoder).toList();
//   //   final jsonString = jsonStrings.join();
//   //   final json = jsonDecode(jsonString)['countries'] as List<dynamic>;

//   //   final country = json
//   //       .map((dynamic e) => Country.fromJson(e as Map<String, dynamic>))
//   //       .toList();

//   //   return country;
//   // }
// }
