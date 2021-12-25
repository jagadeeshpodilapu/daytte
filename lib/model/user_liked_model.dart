// To parse this JSON data, do
//
//     final userLikedModel = userLikedModelFromJson(jsonString);

import 'dart:convert';

UserLikedModel userLikedModelFromJson(String str) => UserLikedModel.fromJson(json.decode(str));

String userLikedModelToJson(UserLikedModel data) => json.encode(data.toJson());

class UserLikedModel {
    UserLikedModel({
       required this.message,
      required  this.data,
    });

    String message;
    Data data;

    factory UserLikedModel.fromJson(Map<String, dynamic> json) => UserLikedModel(
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
        this.isMatched,
    });

  bool? isMatched;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        isMatched: json["isMatched"],
      );

  Map<String, dynamic> toJson() => {
        "isMatched": isMatched,
      };
}

UserLikedToModel userLikedByModelFromJson(String str) =>
    UserLikedToModel.fromJson(json.decode(str));

String userLikedByModelToJson(UserLikedToModel data) =>
    json.encode(data.toJson());

class UserLikedToModel {
  UserLikedToModel({
    required this.message,
    required this.userLikedDataInfo,
  }) {
    // TODO: implement
    throw UnimplementedError();
  }

  String message;
  UserLikedData userLikedDataInfo;

  factory UserLikedToModel.fromJson(Map<String, dynamic> json) =>
      UserLikedToModel(
        message: json["message"],
        userLikedDataInfo: UserLikedData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": userLikedDataInfo.toJson(),
      };
}

class UserLikedData {
  UserLikedData({
    this.isMatched,
    this.likeType,
    this.id,
    this.likedBy,
    this.likedTo,
    this.isLiked,
    this.dataId,
  });

  bool? isMatched;
  String? likeType;
  String? id;
  Liked? likedBy;
  Liked? likedTo;
  bool? isLiked;
  String? dataId;

  factory UserLikedData.fromJson(Map<String, dynamic> json) => UserLikedData(
        isMatched: json["isMatched"],
        likeType: json["likeType"],
        id: json["_id"],
        likedBy: Liked.fromJson(json["likedBy"]),
        likedTo: Liked.fromJson(json["likedTo"]),
        isLiked: json["isLiked"],
        dataId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "isMatched": isMatched,
        "likeType": likeType,
        "_id": id,
        "likedBy": likedBy!.toJson(),
        "likedTo": likedTo!.toJson(),
        "isLiked": isLiked,
        "id": dataId,
      };
}

class Liked {
  Liked({
    this.id,
    this.firstname,
    this.lastname,
    this.profileImg,
  });

  String? id;
  String? firstname;
  String? lastname;
  String? profileImg;

  factory Liked.fromJson(Map<String, dynamic> json) => Liked(
        id: json["_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        profileImg: json["profileImg"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "profileImg": profileImg,
      };
}
