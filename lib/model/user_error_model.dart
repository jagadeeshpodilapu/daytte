// To parse this JSON data, do
//
//     final userErrorModel = userErrorModelFromJson(jsonString);

import 'dart:convert';

UserErrorModel userErrorModelFromJson(String str) =>
    UserErrorModel.fromJson(json.decode(str));

String userErrorModelToJson(UserErrorModel data) => json.encode(data.toJson());

class UserErrorModel {
  UserErrorModel({
    required this.statusCode,
    required this.message,
    required this.error,
  });

  int statusCode;
  String message;
  String error;

  factory UserErrorModel.fromJson(Map<String, dynamic> json) => UserErrorModel(
        statusCode: json["statusCode"],
        message: json["message"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "error": error,
      };
}
