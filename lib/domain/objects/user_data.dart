import 'package:flutter_demo/core/utility/dart/dictionary.dart';

class UserData {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;

  UserData({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNumber,
  });

  factory UserData.fromJson(Dictionary json) {
    return UserData(
      username: json["username"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      mobileNumber: json["mobile_number"],
    );
  }

  static List<UserData> listFromJson(List<dynamic> json) {
    return json
            .map((e) => UserData.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
  }

}
