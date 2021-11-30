// To parse this JSON data, do
//
//     final userInfoModel = userInfoModelFromJson(jsonString);

import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) =>
    UserInfoModel.fromJson(json.decode(str));

String userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
  UserInfoModel({
    required this.message,
    required this.userProperties,
  });

  String message;
  UserProperties userProperties;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        message: json["message"],
        userProperties: UserProperties.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": userProperties.toJson(),
      };
}

class UserProperties {
  UserProperties({
    this.accessToken,
    this.user,
  });

  String? accessToken;
  User? user;

  factory UserProperties.fromJson(Map<String, dynamic> json) => UserProperties(
        accessToken: json["access_token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "user": user?.toJson(),
      };
}

class User {
  User({
    this.provider,
    this.passion,
    this.showAgeRange,
    this.showMe,
    this.isSuperAdmin,
    this.isVerified,
    this.isBlocked,
    this.id,
    this.mobileNumber,
    this.otp,
    this.deviceToken,
    this.newUser,
    this.profileImg,
   // this.filterRadius,
  });

  String? provider;
  List<dynamic>? passion;
  List<dynamic>? showAgeRange;
  bool? showMe;
  bool? isSuperAdmin;
  bool? isVerified;
  bool? isBlocked;
  String? id;
  String? mobileNumber;
  String? otp;
  String? deviceToken;
  bool? newUser;
  String? profileImg;
  // double? filterRadius;

  factory User.fromJson(Map<String, dynamic> json) => User(
        provider: json["provider"],
        passion:json["passion"]!=null? List<dynamic>.from(json["passion"].map((x) => x)):[],
        showAgeRange: List<dynamic>.from(json["showAgeRange"].map((x) => x)),
        showMe: json["showMe"],
        isSuperAdmin: json["is_super_admin"],
        isVerified: json["is_verified"],
        isBlocked: json["is_blocked"],
        id: json["_id"],
        mobileNumber: json["mobile_number"],
        otp: json["otp"],
        deviceToken: json["device_token"],
        newUser: json["newUser"],
        profileImg: json["profileImg"],
        // filterRadius: json['filterRadius'] ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "provider": provider,
        "passion": List<dynamic>.from(passion!.map((x) => x)),
        "showAgeRange": List<dynamic>.from(showAgeRange!.map((x) => x)),
        "showMe": showMe,
        "is_super_admin": isSuperAdmin,
        "is_verified": isVerified,
        "is_blocked": isBlocked,
        "_id": id,
        "mobile_number": mobileNumber,
        "otp": otp,
        "device_token": deviceToken,
        "newUser": newUser,
        "profileImg": profileImg,
      };
}
