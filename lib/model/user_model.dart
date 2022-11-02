final now = DateTime.now();

class User {
  String? firstName;
  String? lastName;
  String? password;
  String? email;
  String? phone;
  String? userName;
  DateTime? birthday;

  User({
    this.firstName,
    this.lastName,
    this.password,
    this.email,
    this.phone,
    this.birthday,
    this.userName,
  });

  @override
  String toString() {
    return 'User{userName: $userName,firstName: $firstName, lastName: $lastName,'
        'password: $password, email: $email,'
        'phone: $phone,birthday: $birthday}';
  }

  User.fromMap(Map<String, dynamic> user)
      : firstName = user['firstName'] as String,
        lastName = user['lastName'] as String,
        password = user['password'] as String,
        email = user['email'] as String,
        phone = user['phone'] as String,
        birthday = DateTime.parse(user['birthday']),
        userName = user['userName'] as String;

  User.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'],
        userName = json['userName'],
        email = json['email'],
        birthday = json['birthDate'],
        phone = json['phone'],
        lastName = json['lastName'],
        password = json['password'];

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'email': email,
      'phone': phone,
      'birthday': birthday.toString(),
      'userName': userName,
    };
  }

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'userName': userName,
        'email': email,
        'birthday': birthday,
        'phone': phone,
        'lastName': lastName,
        'password': password,
      };
}
