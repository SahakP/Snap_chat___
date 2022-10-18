import 'package:snap_chat_copy/model/user_model.dart';

import '../model/user_storage.dart';

class ValidationRepo {
  bool nameValidation(String userName) {
    return userName.isNotEmpty;
  }

  bool passwordValidation(String password) {
    return password.length > 7;
  }

  User? isUserCorect(String userName, String password) {
    User? findUser;
    for (var user in StorageUser.users) {
      if (user.userName == userName && user.password == password) {
        findUser = user;
      }
    }
    return findUser;
  }

  bool birthdayValid(DateTime validData) {
    final sixteenYear = 16 * 365 * 24 * 60 * 60 * 1000;
    final nowDate = DateTime.now();
    return nowDate.difference(validData).inMilliseconds >= sixteenYear;
  }

  bool isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool isUsernameValid(String username) {
    return username.length > 4;
  }
}
