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
          Column(
            children: [
              Row(children: [
                const Expanded(child: SizedBox()),
                Header(
                  header: 'Welcome'.i18n(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 200),
                  child: _renderLogOutButton(),
                ),
              ]),
              _renderLastName(),
              _renderFirstName(),
              _renderUsername(),
              _renderPhone(),
              _renderPassword(),
              _renderEmail(),
              _renderBDate(),
              Row(children: [
                _renderEditeButton(),
                const Expanded(child: SizedBox()),
                _renderDeleteButton(),
              ])
            ],
          ),
        ],
      ),
    );
  }

  Widget _renderEditeButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 30,
        ),
        child: Container(
          height: 50,
          width: 120,
          decoration: BoxDecoration(
              color: Colors.orange, borderRadius: BorderRadius.circular(20)),
          child: SizedBox(
            height: 90,
            width: 90,
            child: TextButton(
              onPressed: () {},
              child: const Text('EDITE', style: TextStyle(color: Colors.black)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderDeleteButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 30,
        ),
        child: Container(
          height: 50,
          width: 120,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
          child: SizedBox(
            height: 90,
            width: 90,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'DELETE',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderLastName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              child: TextField(
                readOnly: true,
                // autofocus: true,
                // controller: controllerUsername,
                onChanged: (value) {},
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 16),
                decoration: InputDecoration(
                    hintText: 'Last naem: ' + widget.user.lastName!,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 10)),
              )),
        ],
      ),
    );
  }

  Widget _renderBDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              child: TextField(
                readOnly: true,
                // autofocus: true,
                // controller: controllerUsername,
                onChanged: (value) {},
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 16),
                decoration: InputDecoration(
                    hintText: 'Birth date: ' + widget.user.birthday.toString()!,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 10)),
              )),
        ],
      ),
    );
  }

  Widget _renderFirstName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              child: TextField(
                readOnly: true,
                // autofocus: true,
                // controller: controllerUsername,
                onChanged: (value) {},
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 16),
                decoration: InputDecoration(
                    hintText: 'First name: ' + widget.user.firstName!,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 10)),
              )),
        ],
      ),
    );
  }

  Widget _renderEmail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              child: TextField(
                readOnly: true,
                // autofocus: true,
                // controller: controllerUsername,
                onChanged: (value) {},
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 16),
                decoration: InputDecoration(
                    hintText: 'Email: ' + widget.user.email!,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 10)),
              )),
        ],
      ),
    );
  }

  Widget _renderPhone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              child: TextField(
                readOnly: true,
                // autofocus: true,
                // controller: controllerUsername,
                onChanged: (value) {},
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 16),
                decoration: InputDecoration(
                    hintText: 'Phone number: ' + widget.user.phone!,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 10)),
              )),
        ],
      ),
    );
  }

  Widget _renderUsername() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              child: TextField(
                readOnly: true,
                // autofocus: true,
                // controller: controllerUsername,
                onChanged: (value) {},
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 16),
                decoration: InputDecoration(
                    hintText: 'Usernaem: ' + widget.user.name!,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 10)),
              )),
        ],
      ),
    );
  }

  Widget _renderPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              child: TextField(
                readOnly: true,
                // autofocus: true,
                // controller: controllerUsername,
                onChanged: (value) {},
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 16),
                decoration: InputDecoration(
                    hintText: 'Password: ' + widget.user.password!,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 10)),
              )),
        ],
      ),
    );
  }

  Widget _renderLogOutButton() {
    return IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.logout_rounded));
  }

  // Widget _renderDeleteUser() {
  //   return
  // }
}
