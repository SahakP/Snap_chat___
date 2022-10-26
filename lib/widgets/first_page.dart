import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:snap_chat_copy/widgets/back_button.dart';
import 'package:snap_chat_copy/widgets/header.dart';

import '../model/user_model.dart';

// ignore: must_be_immutable
class FirstPage extends StatefulWidget {
  FirstPage({required this.user, super.key});
  User user;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackBtn(blueWhite: true),
          Column(
            children: [
              Header(
                header: 'Welcome'.i18n(),
              ),
              _renderInformation(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _renderInformation() {
    return Column(
      children: [
        Text(widget.user.lastName!),
        Text(widget.user.firstName!),
        Text(widget.user.phoneNumber!),
        Text(widget.user.userName!),
        Text(widget.user.password!),
      ],
    );
  }
}