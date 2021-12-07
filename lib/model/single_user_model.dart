import 'dart:convert';

class SingleUserModel {
  SingleUserModel({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory SingleUserModel.fromJson(Map<String, dynamic> json) =>
      SingleUserModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    this.user,
  });

  User? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
      );
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
    this.dob,
    this.email,
    this.firstname,
    this.lastname,
    this.lat,
    this.long,
    this.gender,
    this.interestedIn,
    this.shortDescription,
    this.filterRadius,
    this.profileImg,
  });

  String? provider;
  List<Passion>? passion;
  List<int>? showAgeRange;
  bool? showMe;
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
  String? shortDescription;
  int? filterRadius;
  ProfileImg? profileImg;

  factory User.fromJson(Map<String, dynamic> json) => User(
        provider: json["provider"],
        passion: json["passion"] != null
            ? List<Passion>.from(
                json["passion"].map((x) => Passion.fromJson(x)))
            : [],
        showAgeRange: List<int>.from(json["showAgeRange"].map((x) => x)),
        showMe: json["showMe"],
        isSuperAdmin: json["is_super_admin"],
        isVerified: json["is_verified"],
        isBlocked: json["is_blocked"],
        id: json["_id"],
        mobileNumber: json["mobile_number"],
        otp: json["otp"],
        deviceToken: json["device_token"],
        dob: DateTime.parse(json["dob"]),
        email: json["email"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        lat: json["lat"].toDouble(),
        long: json["long"].toDouble(),
        gender: json["gender"],
        interestedIn: json["interestedIn"],
        shortDescription: json["shortDescription"],
        filterRadius: json["filterRadius"],
        profileImg: ProfileImg.fromJson(json["profileImg"]),
      );

  Map<String, dynamic> toJson() => {
        "provider": provider,
        "passion": List<dynamic>.from(passion!.map((x) => x.toJson())),
        "showAgeRange": List<dynamic>.from(showAgeRange!.map((x) => x)),
        "showMe": showMe,
        "is_super_admin": isSuperAdmin,
        "is_verified": isVerified,
        "is_blocked": isBlocked,
        "_id": id,
        "mobile_number": mobileNumber,
        "otp": otp,
        "device_token": deviceToken,
        "dob": dob!.toIso8601String(),
        "email": email,
        "firstname": firstname,
        "lastname": lastname,
        "lat": lat,
        "long": long,
        "gender": gender,
        "interestedIn": interestedIn,
        "shortDescription": shortDescription,
        "filterRadius": filterRadius,
        "profileImg": profileImg!.toJson(),
      };
}

class Passion {
  Passion({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Passion.fromJson(Map<String, dynamic> json) => Passion(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
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
