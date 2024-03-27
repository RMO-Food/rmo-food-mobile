import 'dart:convert';

class User {
  final String? email;
  final String? password;

  User({this.email, this.password});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(email: json['email'], password: json['password']);

  String toMap() => jsonEncode({"email": email, "password": password});
}
