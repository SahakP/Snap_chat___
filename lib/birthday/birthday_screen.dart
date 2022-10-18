import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:snap_chat_copy/birthday/birthday_bloc.dart';
import 'package:snap_chat_copy/email_phone/bloc/email_phone_screen.dart';
import 'package:snap_chat_copy/repositiry/validation_repository.dart';
import 'package:snap_chat_copy/widgets/back_button.dart';
import 'package:snap_chat_copy/widgets/button_submit.dart';
import 'package:snap_chat_copy/widgets/header.dart';

import '../model/user_model.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({
    required this.user,
  });

  final User user;

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  TextEditingController controllerBirthday = TextEditingController();

  final _bloc = BirthdayBloc(validRepo: ValidationRepo());

  bool isBirthdayDataValid = true;

  late DateTime validDate;

  @override
  void initState() {
    final now = DateTime.now();
    validDate = DateTime(now.year - 16, now.month, now.day);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _bloc,
        child: BlocListener<BirthdayBloc, BirthdayState>(
          listener: _listener,
          child: BlocBuilder<BirthdayBloc, BirthdayState>(
            builder: _render,
          ),
        ));
  }

  Widget _render(context, state) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackBtn(blueWhite: true),
          Column(
            children: [
              const Header(header: "When's youre birthday"),
              _renderBirthdayTF(),
              _renderBirthdayErrorMsg(),
              _RenderContinueButton(),
              _datePicker(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _renderBirthdayTF() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 0,
      ),
      child: TextField(
          autofocus: true,
          readOnly: true,
          controller: controllerBirthday,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          decoration: InputDecoration(
            labelText: 'BIRTHDAY',
            labelStyle: const TextStyle(
              color: Color.fromARGB(255, 154, 160, 167),
            ),
            hintText: _validFormatDate,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          )),
    );
  }

  Widget _renderBirthdayErrorMsg() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 4,
          ),
          child: Text(
            !isBirthdayDataValid ? 'must be greater than or equal 16 year' : '',
            style: const TextStyle(
                color: Color.fromARGB(255, 200, 53, 50),
                fontWeight: FontWeight.w700,
                fontSize: 12),
          ))
    ]);
  }

  Widget _datePicker() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
        bottom: 10,
        top: 10,
      ),
      child: SizedBox(
        height: 150,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (value) {
            validDate = value;
            _bloc.add(BirthdayDataEvent(validDate: value));
          },
          initialDateTime: validDate,
        ),
      ),
    );
  }

  Widget _RenderContinueButton() {
    return Expanded(
        child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: ButtonSubmit(
              isActive: isBirthdayDataValid,
              title: 'Continue',
              onTap: () {
                if (isBirthdayDataValid) {
                  widget.user.birthday = validDate;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EmailOrPhone(user: widget.user)));
                }
              },
            )));
  }

  String get _validFormatDate {
    final formatter = DateFormat('dd MMMM yyyy');
    final tFData = formatter.format(validDate);
    return tFData;
  }
}

extension _BlocListener on _BirthdayScreenState {
  void _listener(context, state) {
    if (state is BirthdayDataState) {
      isBirthdayDataValid = state.isDataValid;
      validDate = state.validDate;
    }
  }
}
