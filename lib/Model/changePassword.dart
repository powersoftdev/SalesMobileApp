// To parse this JSON data, do
//
//     final changePassword = changePasswordFromJson(jsonString);

// ignore_for_file: camel_case_types

import 'dart:convert';

changePassword changePasswordFromJson(String str) =>
    changePassword.fromJson(json.decode(str));

String changePasswordToJson(changePassword data) => json.encode(data.toJson());

class changePassword {
  changePassword({
    required this.username,
    required this.oldPassword,
    required this.newPassword,
  });

  String username;
  String oldPassword;
  String newPassword;

  factory changePassword.fromJson(Map<String, dynamic> json) => changePassword(
        username: json["Username"],
        oldPassword: json["OldPassword"],
        newPassword: json["NewPassword"],
      );

  Map<String, dynamic> toJson() => {
        "Username": username,
        "OldPassword": oldPassword,
        "NewPassword": newPassword,
      };
}
