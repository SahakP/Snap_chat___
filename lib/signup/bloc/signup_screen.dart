import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_chat_copy/localization/localizations.dart';
import 'package:snap_chat_copy/repositiry/validation_repository.dart';
import 'package:snap_chat_copy/signup/bloc/sign_up_bloc.dart';
import 'package:snap_chat_copy/widgets/back_button.dart';
import 'package:snap_chat_copy/widgets/button_submit.dart';
import 'package:snap_chat_copy/widgets/header.dart';
import 'package:snap_chat_copy/widgets/un_focused.dart';

import '../../birthday/birthday_screen.dart';
import '../../model/user_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // late SqliteService _sqliteService;
  // List<User> _users = [];

  // @override
  // void initState() {
  //   super.initState();
  //   this._sqliteService = SqliteService();
  //   this._sqliteService.initializeDB().whenComplete(() async {
  //     await _refreshUsers();
  //     setState(() {});
  //   });
  // }

  // Future<void> _refreshUsers() async {
  //   final data = await SqliteService().getUsers();
  //   setState(() {
  //     _users = data;
  //   });
  // }

  final _bloc = SignUpBloc(validRepo: ValidationRepo());

  bool firstNameValid = false;
  bool lastNaemValid = false;

  final controllerFirstName = TextEditingController();
  final controllerLastName = TextEditingController();

  User user = User();

  @override
  void dispose() {
    controllerFirstName.dispose();
    controllerLastName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _bloc,
        child: BlocListener<SignUpBloc, SignUpState>(
          listener: _listener,
          child: BlocBuilder<SignUpBloc, SignUpState>(
            builder: _render,
          ),
        ));
  }

  Widget _render(context, state) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: UnFocusedWidget(
          child: Stack(
            children: [
              const BackBtn(blueWhite: true), //SingleChildScrollView
              Column(
                children: [
                  Header(header: MyLocalizations.of(context)!.whatsYoureName!),
                  _renderFirstNameTF(),
                  _renderFirstNameErrorMsg(),
                  _renderLastNameTF(),
                  _renderLastNameErrorMsg(),
                  _renderLinks(),
                  _signUpButton(),
                ],
              )
            ],
          ),
        ));
  }

  Widget _renderFirstNameErrorMsg() {
    if (!firstNameValid) {
      return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 60,
              vertical: 4,
            ),
            child: Text(
              MyLocalizations.of(context)!.usernaemErrorMsg!,
              style: const TextStyle(
                  color: Color.fromARGB(255, 185, 193, 199),
                  fontWeight: FontWeight.w700,
                  fontSize: 12),
            ))
      ]);
    } else {
      return const Text('');
    }
  }

  Widget _renderFirstNameTF() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 0,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: TextField(
          autofocus: true,
          controller: controllerFirstName,
          onChanged: (value) {
            _firstNameValidation;
            _bloc.add(FirstNameEvent(firstName: value));

            // setState(() {});
          },
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 12),
          decoration: InputDecoration(
            labelText: MyLocalizations.of(context)!.FirstName,
          ),
        ),
      ),
    );
  }

  Widget _renderLastNameErrorMsg() {
    if (!lastNaemValid) {
      return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 60,
              vertical: 4,
            ),
            child: Text(
              MyLocalizations.of(context)!.usernaemErrorMsg!,
              style: const TextStyle(
                  color: Color.fromARGB(255, 185, 193, 199),
                  fontWeight: FontWeight.w700,
                  fontSize: 12),
            ))
      ]);
    } else {
      return const Text('');
    }
  }

  Widget _renderLastNameTF() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 0,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: TextField(
          controller: controllerLastName,
          onChanged: (value) {
            _bloc.add(LastNameEvent(lastName: value));
            //_lastNameValidation;
            // users.lastName = controllerLastName.text;
            setState(() {
              //textLastName = value.toString();
            });
          },
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 12),
          decoration: InputDecoration(
            labelText: MyLocalizations.of(context)!.lastName,
          ),
        ),
      ),
    );
  }

  Widget _renderLinks() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 62),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 13),
          children: <TextSpan>[
            TextSpan(
                text: MyLocalizations.of(context)!.textSpan1!,
                style: const TextStyle(color: Colors.black)),
            TextSpan(
                text: MyLocalizations.of(context)!.textSpan2!,
                style: const TextStyle(color: Colors.blue)),
            TextSpan(
                text: MyLocalizations.of(context)!.textSpan3!,
                style: const TextStyle(color: Colors.black)),
            TextSpan(
                text: MyLocalizations.of(context)!.textSpan4!,
                style: const TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return Expanded(
        child: Align(
      alignment: FractionalOffset.bottomCenter,
      child: ButtonSubmit(
        isActive: _isActive,
        title: MyLocalizations.of(context)!.signUpAccept!,
        onTap: () {
          user
            ..firstName = controllerFirstName.text
            ..lastName = controllerLastName.text;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BirthdayScreen(user: user)));
        },
      ),
    ));
  }

  bool get _firstNameValidation {
    return controllerFirstName.text.isNotEmpty;
  }

  bool get _lastNameValidation {
    return controllerLastName.text.isNotEmpty;
  }

  bool get _isActive {
    if (_firstNameValidation && _lastNameValidation) {
      return true;
    } else {
      return false;
    }
  }
}

extension _BlocListener on _SignUpScreenState {
  void _listener(context, state) {
    if (state is FiratNameState) {
      firstNameValid = state.isFirstNameValid;
    }
    if (state is LastNameState) {
      lastNaemValid = state.isLastNameValid;
    }
  }
}
