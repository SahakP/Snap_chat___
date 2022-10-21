class Country {
  String? name;
  final String e164_cc;
  final String iso2_cc;

  Country({
    required this.name,
    required this.e164_cc,
    required this.iso2_cc,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        name: json['name'] as String,
        e164_cc: json['e164_cc'] as String,
        iso2_cc: json['iso2_cc'] as String);
  }
}
