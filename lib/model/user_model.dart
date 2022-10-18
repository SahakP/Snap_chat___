import 'package:flutter/widgets.dart';
import 'package:snap_chat_copy/signup/bloc/sign_up_bloc.dart';

class User {
  String? firstName;
  String? lastName;
  String? password;
  String? email;
  String? phoneNumber;
  String? userName;
  DateTime? birthday;

  User({
    this.firstName,
    this.lastName,
    this.password,
    this.email,
    this.phoneNumber,
    this.birthday,
    this.userName,
  });

  User.fromMap(Map<String, dynamic> res)
      : firstName = res['firstName'],
        lastName = res['lastName'],
        password = res['password'],
        email = res['email'],
        phoneNumber = res['phoneNumber'],
        birthday = res['birthday'],
        userName = res['userName'];

  Map<String, Object?> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'email': email,
      'phoneNumber': phoneNumber,
      'birthday': birthday,
      'userNaem': userName
    };
  }
}
