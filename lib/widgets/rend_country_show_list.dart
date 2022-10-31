import 'package:flutter/material.dart';

import '../model/country_model.dart';
import '../notifier/value_notifier.dart';

// ignore: must_be_immutable
class RenderCountryShowList extends StatefulWidget {
  RenderCountryShowList(
      {required this.searchText,
      // required this.country,
      required this.valueNotif,
      required this.countriesList,
      super.key});
  String searchText;
  //final Function(Country) country;
  final List<Country> countriesList;
  final MyValueNotifier valueNotif;
  @override
  State<RenderCountryShowList> createState() => _RenderCountryShowListState();
}

class _RenderCountryShowListState extends State<RenderCountryShowList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: ListView.builder(
          itemCount: widget.countriesList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final selectedCountry = widget.countriesList[index];

            return (selectedCountry.name!
                        .toLowerCase()
                        .contains(widget.searchText.toString().toLowerCase()) ||
                    selectedCountry.countryPhoneCode
                        .contains(widget.searchText))
                ? InkWell(
                    onTap: () {
                      widget.valueNotif.country(selectedCountry);
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 4,
                        bottom: 4,
                      ),
                      child: Column(
                        children: [
                          Row(children: [
                            Text(
                              flagMaker(selectedCountry),
                              style: const TextStyle(fontSize: 16),
                            ),
                            Expanded(
                              child: Text(
                                selectedCountry.name!,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            Text(
                              selectedCountry.countryPhoneCode,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ]),
                          Container(
                            height: 1,
                            color: const Color.fromARGB(255, 139, 139, 139),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  String flagMaker(Country country) {
    final flag = country.countryName.toUpperCase().replaceAllMapped(
        RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }
}
