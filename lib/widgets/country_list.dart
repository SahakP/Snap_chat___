import 'package:flutter/material.dart';
import 'package:snap_chat_copy/widgets/back_button.dart';
import 'package:snap_chat_copy/widgets/rend_country_show_list.dart';
import 'package:snap_chat_copy/widgets/un_focused.dart';

import '../model/country_model.dart';
import '../notifier/value_notifier.dart';

class CountryList extends StatefulWidget {
  const CountryList(
      { //required this.country,
      required this.countriesList,
      required this.valueNotif});

  final List<Country> countriesList;
  //final Function(Country) country;
  final MyValueNotifier valueNotif;

  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  TextEditingController contSearch = TextEditingController();

  String _searchText = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: UnFocusedWidget(
            child: Stack(children: [
          const BackBtn(
            blueWhite: true,
          ),
          Column(children: [
            _renderSerachConteiner(),
            RenderCountryShowList(
              searchText: _searchText,
              countriesList: widget.countriesList,
              valueNotif: widget.valueNotif,
              //country: widget.country,
            ),
          ])
        ])));
  }

  Widget _renderSerachConteiner() {
    return Padding(
        padding: const EdgeInsets.only(top: 150, bottom: 10),
        child: Center(
          child: Container(
            height: 40,
            width: 360,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 238, 238, 240),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: SizedBox(
                height: 40,
                width: 360,
                child: TextField(
                  autofocus: true,
                  onChanged: (value) {
                    _searchText = value;
                    setState(() {});
                  },
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      labelText: 'SEARCH',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 10)),
                ),
              ),
            ),
          ),
        ));
  }
}
