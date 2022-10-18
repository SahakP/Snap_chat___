import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_chat_copy/model/country.dart';
import 'package:snap_chat_copy/repositiry/api_repository.dart';
import 'package:snap_chat_copy/repositiry/validation_repository.dart';
import 'package:snap_chat_copy/widgets/back_button.dart' show BackBtn;
import 'package:snap_chat_copy/widgets/button_submit.dart';
import 'package:snap_chat_copy/widgets/country_list.dart';
import 'package:snap_chat_copy/widgets/header.dart';
import 'package:snap_chat_copy/widgets/un_focused.dart';

import '../../model/user_model.dart';
import '../../username/username_screen.dart';
import 'email_phone_bloc.dart';

class EmailOrPhone extends StatefulWidget {
  const EmailOrPhone({required this.user, super.key});
  final User user;
  @override
  State<EmailOrPhone> createState() => _EmailOrPhoneState();
}

class _EmailOrPhoneState extends State<EmailOrPhone> {
  final _bloc = EmailPhoneBloc(
      validRepo: ValidationRepo(), apiRepository: ApiRepository());
  bool isEmailValid = false;
  bool isPhoneNumValid = false;
  Country? _selectedCountry;
  List<Country> _countries = [];
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhoneNumber = TextEditingController();
  // String flag = '';
  bool _isEmail = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _bloc,
        child: BlocListener<EmailPhoneBloc, EmailPhoneState>(
          listener: _listener,
          child: BlocBuilder<EmailPhoneBloc, EmailPhoneState>(
            builder: _isEmail ? _renderEmail : _renderPhone,
          ),
        ));
  }

  @override
  void initState() {
    _bloc.add(EmailPhoneLoadCountresEvent());

    super.initState();
  }

  void _changePage() {
    setState(() {
      _isEmail = !_isEmail;
    });
  }

  Widget _renderEmail(context, state) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: UnFocusedWidget(
            child: Stack(children: [
          const BackBtn(blueWhite: true),
          Column(
            children: [
              const Header(header: "What's youre email"),
              _renderSignUpWithPhone(),
              _renderEmailTF(),
              _renderEmailErrorMsg(),
              _emailButton(),
            ],
          ),
        ])));
  }

  Widget _renderPhone(context, state) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: UnFocusedWidget(
            child: Stack(children: [
          const BackBtn(blueWhite: true),
          Column(
            children: [
              const Header(
                header: "What's your \n mobile number?",
              ),
              _renderSignUpToEmail(),
              _renderPhoneLabelText(),
              _renderNumberInput(),
              _lineContainer(),
              _renderPhoneErrorMsg(),
              _renderPhoneTextUnder(),
              _phoneNumberButton(),
            ],
          )
        ])));
  }

  Widget _renderNumberInput() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
          child: Align(
              alignment: FractionalOffset.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 35),
                child: _countryList(),
              ))),
      Expanded(
          child: Align(
              alignment: FractionalOffset.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(right: 0),
                child: _renderPhoneNumberTF(),
              ))),
      const Expanded(
          child: Align(
        alignment: FractionalOffset.centerRight,
        child: Text(''),
      ))
    ]);
  }

  Widget _renderEmailTF() {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 0,
        ),
        child: TextField(
          autofocus: true,
          controller: controllerEmail,
          onChanged: (value) {
            _bloc.add(EmailEvent(email: value));
            // widget.users.email = controllerEmail.text;
            // setState(() {});
          },
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
          decoration: const InputDecoration(
            labelText: 'EMAIL',
          ),
        ));
  }

  Widget _renderEmailErrorMsg() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
          child: Text(
            !isEmailValid ? 'Enter Correct Email Address' : '',
            style: const TextStyle(
                color: Color.fromARGB(255, 185, 193, 199),
                fontWeight: FontWeight.w700,
                fontSize: 12),
          ))
    ]);
  }

  Widget _renderPhoneTextUnder() {
    return const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text(
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.left,
              "We'll send you an SMS verification code."),
        ));
  }

  Widget _renderPhoneErrorMsg() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
          child: Text(
            !isPhoneNumValid ? 'must be greater than or equal 1 symbol' : '',
            style: const TextStyle(
                color: Color.fromARGB(255, 185, 193, 199),
                fontWeight: FontWeight.w700,
                fontSize: 12),
          ))
    ]);
  }

  Widget _renderPhoneNumberTF() {
    return TextField(
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      autofocus: true,
      keyboardType: TextInputType.number,
      controller: controllerPhoneNumber,
      onChanged: (value) {
        _bloc.add(PhoneEvent(phoneNumber: controllerPhoneNumber.text));
      },
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Widget _renderPhoneLabelText() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      const Padding(
          padding: EdgeInsets.only(left: 45, top: 10),
          child: Text(
            'MOBILE NUMBER',
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12),
          ))
    ]);
  }

  Widget _renderSignUpToEmail() {
    return TextButton(
      onPressed: () => _changePage(),
      child: const Text(
        'Sign up with email instead',
        style:
            TextStyle(color: Color.fromARGB(255, 21, 126, 251), fontSize: 12),
      ),
    );
  }

  Widget _renderSignUpWithPhone() {
    return TextButton(
      onPressed: () => _changePage(),
      child: const Text(
        'Sign up with phone instead',
        style:
            TextStyle(color: Color.fromARGB(255, 21, 126, 251), fontSize: 12),
      ),
    );
  }

  Widget _countryList() {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 16),
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CountryList(
                      countriesList: _countries,
                      country: (Country country) {
                        setState(() {
                          _selectedCountry = country;
                        });
                      },
                    )));
      },
      child: Text(flagMaker()),
    );
  }

  String flagMaker() {
    final country = _selectedCountry;
    if (country == null) {
      return '';
    }

    final flag = country.iso2_cc.toUpperCase().replaceAllMapped(
        RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag + ' +' + country.e164_cc;
  }

  Widget _lineContainer() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          height: 2,
          color: const Color.fromARGB(255, 185, 193, 199),
        ));
  }

  Widget _phoneNumberButton() {
    return Expanded(
        child: Align(
      alignment: FractionalOffset.bottomCenter,
      child: ButtonSubmit(
        isActive: isPhoneNumValid,
        title: 'Continue',
        onTap: () {
          widget.user.phoneNumber = controllerPhoneNumber.text;
          isPhoneNumValid
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UsernameScreen(users: widget.user)))
              : null;
        },
      ),
    ));
  }

  Widget _emailButton() {
    return Expanded(
        child: Align(
      alignment: FractionalOffset.bottomCenter,
      child: ButtonSubmit(
        isActive: isEmailValid,
        title: 'Continue',
        onTap: () {
          widget.user.email = controllerEmail.text;
          if (isEmailValid) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UsernameScreen(
                          users: widget.user,
                        )));
          }
        },
      ),
    ));
  }
}

extension _BlocListener on _EmailOrPhoneState {
  void _listener(context, state) {
    if (state is EmailState) {
      isEmailValid = state.isEmailValid;
    }
    if (state is EmailPhoneLoadCountresState) {
      _selectedCountry = state.currentLocation;
      _countries = state.countries;
    }
    if (state is PhoneState) {
      isPhoneNumValid = state.isPhoneValid;
    }
  }
}
