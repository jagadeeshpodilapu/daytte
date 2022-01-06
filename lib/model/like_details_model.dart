// To parse this JSON data, do
//
//     final likedModel = likedModelFromJson(jsonString);

import 'dart:convert';

LikedModel likedModelFromJson(String str) =>
    LikedModel.fromJson(json.decode(str));

String likedModelToJson(LikedModel data) => json.encode(data.toJson());

class LikedModel {
  LikedModel({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory LikedModel.fromJson(Map<String, dynamic> json) => LikedModel(
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
    this.likes,
    this.totalCount,
  });

  List<Like>? likes;
  int? totalCount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        likes: List<Like>.from(json["likes"].map((x) => Like.fromJson(x))),
        totalCount: json["total_count"],
      );

  Map<String, dynamic> toJson() => {
        "likes": List<dynamic>.from(likes!.map((x) => x.toJson())),
        "total_count": totalCount,
      };
}

class Like {
  Like({
    this.id,
    this.likedBy,
    this.likeId,
  });

  String? id;
  LikedBy? likedBy;
  String? likeId;

  factory Like.fromJson(Map<String, dynamic> json) => Like(
        id: json["_id"],
        likedBy: LikedBy.fromJson(json["likedBy"]),
        likeId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "likedBy": likedBy?.toJson(),
        "id": likeId,
      };
}

class LikedBy {
  LikedBy({
    this.location,
    this.id,
    this.dob,
    this.firstname,
    this.lastname,
    this.gender,
    this.profileImg,
  });

  String? location;
  String? id;
  DateTime? dob;
  String? firstname;
  String? lastname;
  String? gender;
  String? profileImg;

  factory LikedBy.fromJson(Map<String, dynamic> json) => LikedBy(
        location: json["location"],
        id: json["_id"],
        dob: DateTime.parse(json["dob"]),
        firstname: json["firstname"],
        lastname: json["lastname"],
        gender: json["gender"],
        profileImg: json["profileImg"],
      );

  Map<String, dynamic> toJson() => {
        "location": location,
        "_id": id,
        "dob": dob!.toIso8601String(),
        "firstname": firstname,
        "lastname": lastname,
        "gender": gender,
        "profileImg": profileImg,
      };
}


