// To parse this JSON data, do
//
//     final findNearestModel = findNearestModelFromJson(jsonString);

import 'dart:convert';

FindNearestModel findNearestModelFromJson(String str) =>
    FindNearestModel.fromJson(json.decode(str));

String findNearestModelToJson(FindNearestModel data) =>
    json.encode(data.toJson());

class FindNearestModel {
  FindNearestModel({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory FindNearestModel.fromJson(Map<String, dynamic> json) =>
      FindNearestModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.users,
    this.totalCount,
  });

  List<User>? users;
  int? totalCount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
        totalCount: json["total_count"],
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users!.map((x) => x.toJson())),
        "total_count": totalCount,
      };
}

class User {
  User({
    this.provider,
    this.passion,
    this.showAgeRange,
    this.showMe,
    this.location,
    this.isSuperAdmin,
    this.isVerified,
    this.isBlocked,
    this.id,
    this.mobileNumber,
    this.otp,
    this.deviceToken,
    this.dob,
    this.email,
    this.firstname,
    this.lastname,
    this.lat,
    this.long,
    this.gender,
    this.interestedIn,
    this.institute,
    this.lastSeen,
    this.status,
    this.age,
    this.profileImg,
    this.shortDescription,
    this.filterRadius,
  });

  String? provider;
  List<Passion>? passion;
  List<int>? showAgeRange;
  bool? showMe;
  String? location;
  bool? isSuperAdmin;
  bool? isVerified;
  bool? isBlocked;
  String? id;
  String? mobileNumber;
  String? otp;
  String? deviceToken;
  DateTime? dob;
  String? email;
  String? firstname;
  String? lastname;
  double? lat;
  double? long;
  String? gender;
  String? interestedIn;
  String? institute;
  String? lastSeen;
  String? status;
  dynamic age;
  ProfileImg? profileImg;
  String? shortDescription;
  int? filterRadius;

  factory User.fromJson(Map<String, dynamic> json) => User(
        provider: json["provider"],
        passion:
            List<Passion>.from(json["passion"].map((x) => Passion.fromJson(x))),
        showAgeRange: List<int>.from(json["showAgeRange"].map((x) => x)),
        showMe: json["showMe"],
        location: json["location"],
        isSuperAdmin: json["is_super_admin"],
        isVerified: json["is_verified"],
        isBlocked: json["is_blocked"],
        id: json["_id"],
        mobileNumber: json["mobile_number"],
        otp: json["otp"],
        deviceToken: json["device_token"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        email: json["email"] == null ? null : json["email"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        long: json["long"] == null ? null : json["long"].toDouble(),
        gender: json["gender"] == null ? null : json["gender"],
        interestedIn:
            json["interestedIn"] == null ? null : json["interestedIn"],
        institute: json["institute"] == null ? null : json["institute"],
        lastSeen: json["lastSeen"],
        status: json["status"],
        age: json["age"],
        profileImg: json["profileImg"] == null
            ? null
            : ProfileImg.fromJson(json["profileImg"]),
        shortDescription:
            json["shortDescription"] == null ? null : json["shortDescription"],
        filterRadius:
            json["filterRadius"] == null ? null : json["filterRadius"],
      );

  Map<String, dynamic> toJson() => {
        "provider": provider,
        "passion": List<dynamic>.from(passion!.map((x) => x.toJson())),
        "showAgeRange": List<dynamic>.from(showAgeRange!.map((x) => x)),
        "showMe": showMe,
        "location": location,
        "is_super_admin": isSuperAdmin,
        "is_verified": isVerified,
        "is_blocked": isBlocked,
        "_id": id,
        "mobile_number": mobileNumber,
        "otp": otp,
        "device_token": deviceToken,
        "dob": dob == null ? null : dob!.toIso8601String(),
        "email": email == null ? null : email,
        "firstname": firstname == null ? null : firstname,
        "lastname": lastname == null ? null : lastname,
        "lat": lat == null ? null : lat,
        "long": long == null ? null : long,
        "gender": gender == null ? null : gender,
        "interestedIn": interestedIn == null ? null : interestedIn,
        "institute": institute == null ? null : institute,
        "lastSeen": lastSeen,
        "status": status,
        "age": age,
        "profileImg": profileImg == null ? null : profileImg?.toJson(),
        "shortDescription": shortDescription == null ? null : shortDescription,
        "filterRadius": filterRadius == null ? null : filterRadius,
      };
}

class Passion {
  Passion({
    this.isActiveStatus,
    this.id,
    this.name,
  });

  bool? isActiveStatus;
  String? id;
  String? name;

  factory Passion.fromJson(Map<String, dynamic> json) => Passion(
        isActiveStatus: json["is_active_status"],
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "is_active_status": isActiveStatus,
        "_id": id,
        "name": name,
      };
}

class ProfileImg {
  ProfileImg({
    this.id,
    this.userId,
    this.imgPath,
  });

  String? id;
  String? userId;
  String? imgPath;

  factory ProfileImg.fromJson(Map<String, dynamic> json) => ProfileImg(
        id: json["_id"],
        userId: json["userId"],
        imgPath: json["imgPath"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "imgPath": imgPath,
      };
}
