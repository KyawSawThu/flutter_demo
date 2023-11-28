import 'package:flutter_demo/core/network/network_helper.dart';
import 'package:flutter_demo/core/utility/dart/dictionary.dart';

class LoginRequest implements RequestObject {
  String email;
  String password;

  LoginRequest({required this.email, required this.password});

  @override
  Dictionary toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}