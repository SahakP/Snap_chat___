final now = DateTime.now();

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

  // @override
  // String toString() {
  //   return 'User{userName: $userName,firstName: $firstName, lastName: $lastName,'
  //       'password: $password, email: $email,'
  //       'phoneNumber: $phoneNumber,birthday: $birthday}';
  // }

  factory User.fromMap(Map<String, dynamic> user) {
    return User(
      firstName: user['firstName'] as String,
      lastName: user['lastName'] as String,
      password: user['password'] as String,
      email: user['email'] as String,
      phoneNumber: user['phoneNumber'] as String,
      birthday: DateTime.parse(user['birthday']),
      userName: user['userName'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'email': email,
      'phoneNumber': phoneNumber,
      'birthday': birthday.toString(),
      'userName': userName,
    };
  }
}
