// To parse this JSON data, do
//
//     final userGalleryModel = userGalleryModelFromJson(jsonString);

import 'dart:convert';

UserGalleryModel userGalleryModelFromJson(String str) =>
    UserGalleryModel.fromJson(json.decode(str));

String userGalleryModelToJson(UserGalleryModel data) =>
    json.encode(data.toJson());

class UserGalleryModel {
  UserGalleryModel({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory UserGalleryModel.fromJson(Map<String, dynamic> json) =>
      UserGalleryModel(
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
    this.galleries,
    this.totalCount,
  });

  List<Gallery>? galleries;
  int? totalCount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        galleries: List<Gallery>.from(
            json["galleries"].map((x) => Gallery.fromJson(x))),
        totalCount: json["total_count"],
      );

  Map<String, dynamic> toJson() => {
        "galleries": List<dynamic>.from(galleries!.map((x) => x.toJson())),
        "total_count": totalCount,
      };
}

class Gallery {
  Gallery({
    this.id,
    this.userId,
    this.imgPath,
  });

  String? id;
  String? userId;
  String? imgPath;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
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
