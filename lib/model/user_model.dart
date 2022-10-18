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
  //   return firstName.toString() +
  //       ' ' +
  //       lastName.toString() +
  //       ' ' +
  //       username.toString() +
  //       ' ' +
  //       birthday.toString() +
  //       ' ' +
  //       phoneNumber.toString();
  // }
}
