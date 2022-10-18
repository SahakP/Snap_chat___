import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_chat_copy/login/bloc/login_bloc.dart';
import 'package:snap_chat_copy/repositiry/validation_repository.dart';
import 'package:snap_chat_copy/widgets/back_button.dart';
import 'package:snap_chat_copy/widgets/header.dart';
import 'package:snap_chat_copy/widgets/un_focused.dart';

import '../../first_page.dart';
import '../../widgets/button_submit.dart';

class LoginScren extends StatefulWidget {
  const LoginScren({super.key});

  @override
  State<LoginScren> createState() => _LoginScrenState();
}

class _LoginScrenState extends State<LoginScren> {
  final _bloc = LoginBloc(validRepo: ValidationRepo());

  TextEditingController controllerPassword = TextEditingController();

  TextEditingController controllerUsername = TextEditingController();

  bool _isNameValid = false;
  bool _isPasswordValid = false;

  String? findUser;

  bool isLoginButtonActive = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _bloc,
        child: BlocListener<LoginBloc, LoginState>(
          listener: _listener,
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: _render,
          ),
        ));
  }

  Widget _render(BuildContext context, LoginState state) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: UnFocusedWidget(
          child: Stack(
            children: [
              const BackBtn(blueWhite: true),
              Column(
                children: [
                  const Header(header: 'Log in'),
                  _renderUserNameTF(),
                  _renderNameErrorMsg(),
                  _renderPasswordTF(),
                  _renderPasswordErrorMsg(),
                  _renderLink(),
                  _rederLogInButton(),
                ],
              ),
            ],
          ),
        ));
  }

  Widget _renderUserNameTF() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 0,
      ),
      child: TextField(
        autofocus: true,
        controller: controllerUsername,
        onChanged: (value) {
          _bloc.add(NameTFEvent(userName: value));
        },
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.w700, fontSize: 12),
        decoration: const InputDecoration(
            labelText: 'USERNAME OR EMAIL',
            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 10)),
      ),
    );
  }

  Widget _renderNameErrorMsg() {
    if (!_isNameValid) {
      return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 4,
            ),
            child: Text(
              'must be greater than or equal 1 symbol',
              style: TextStyle(
                  color: Color.fromARGB(255, 185, 193, 199),
                  fontWeight: FontWeight.w700,
                  fontSize: 12),
            ))
      ]);
    } else {
      return const Text('');
    }
  }

  Widget _renderPasswordTF() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 0,
      ),
      child: TextField(
        controller: controllerPassword,
        onChanged: (value) {
          _bloc.add(PasswordTFEvent(password: value));
        },
        obscuringCharacter: '*',
        obscureText: true,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.w700, fontSize: 12),
        decoration: const InputDecoration(
            labelText: 'PASSWORD',
            suffixIcon: Icon(Icons.visibility_off_sharp),
            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 10)),
      ),
    );
  }

  Widget _renderPasswordErrorMsg() {
    if (!_isPasswordValid) {
      return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 4,
            ),
            child: Text(
              'must be greater than or equal 8 symbol',
              style: TextStyle(
                  color: Color.fromARGB(255, 185, 193, 199),
                  fontWeight: FontWeight.w700,
                  fontSize: 12),
            ))
      ]);
    } else {
      return const Text('');
    }
  }

  Widget _renderLink() {
    return TextButton(
        onPressed: () {},
        child: const Text(
          'Forgot your Password?',
          style:
              TextStyle(color: Color.fromARGB(255, 21, 126, 251), fontSize: 12),
        ));
  }

  Widget _rederLogInButton() {
    return Expanded(
        child: Align(
      alignment: FractionalOffset.bottomCenter,
      child: ButtonSubmit(
        isActive: _isOk,
        title: 'log in',
        onTap: () {
          _bloc.add(LogInButtonEvent(
              password: controllerPassword.text,
              userName: controllerUsername.text));
        },
      ),
    ));
  }

  bool get _isOk {
    return _isNameValid && _isPasswordValid;
  }

  void showAlertDialog() {
    // Create button
    final Widget okButton = TextButton(
      child: const Text(
        'OK',
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    final alert = AlertDialog(
      title: const Text('User Not Found',
          style: TextStyle(color: Color.fromARGB(255, 200, 53, 50))),
      content: const Text('Try enter correct data'),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

extension _BlocListener on _LoginScrenState {
  void _listener(context, state) {
    if (state is UserNameState) {
      _isNameValid = state.isNameValid;
    }

    if (state is PasswordState) {
      _isPasswordValid = state.IsPasswordValid;
    }

    if (state is ButtonState) {
      final findUser = state.user;

      if (findUser != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FirstPage(
                      user: findUser,
                    )));
      } else {
        showAlertDialog();
      }
    }
  }
}
