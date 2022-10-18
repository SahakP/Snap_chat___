import 'package:flutter/material.dart';
import 'package:snap_chat_copy/login/bloc/login_bloc.dart';
import 'package:snap_chat_copy/model/user_model.dart';
import 'package:snap_chat_copy/services/database_hendler.dart';

import 'package:snap_chat_copy/widgets/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  late DatabaseHendler hendler;

  @override
  void initState() {
    super.initState();
    this.hendler = DatabaseHendler();
    this.hendler.initializeDB().whenComplete(() async {
      await this.addUsers();
      setState(() {});
    });
  }
  Future<int> addUsers() async {
    User firstUser = User(firstName: 'Mark', lastName: 'Kozlov', password: 'password',
email: 'markkozlov@gmail.com', birthday: ,userName: 'marko'
    )
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Snap_Copy',
      home: HomePage(),
    );
  }
}
