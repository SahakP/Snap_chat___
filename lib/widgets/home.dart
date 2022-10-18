import 'package:flutter/material.dart';

import 'package:snap_chat_copy/signup/bloc/signup_screen.dart';

import '../login/bloc/login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 255, 250, 55),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _imageRender(),
            _renderLoginButton(context),
            _renderSignupButton(context)
          ],
        ));
  }

  Widget _imageRender() {
    return Padding(
        padding: const EdgeInsets.only(bottom: 150),
        child: Image.asset(
          'images/logo.png',
          width: 250,
          height: 150,
        ));
  }

  Widget _renderSignupButton(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      color: const Color.fromARGB(255, 36, 174, 252),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(16.0),
          textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const SignUpScreen()));
        },
        child: const Text('SIGN UP'),
      ),
    );
  }

  Widget _renderLoginButton(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 80,
          width: double.infinity,
          color: const Color.fromARGB(255, 240, 62, 90),
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16.0),
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const LoginScren()));
            },
            child: const Text('LOG IN'),
          ),
        )
      ],
    );
  }
}
