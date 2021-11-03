import 'dart:convert';

class EditDetailsModel {
  String message;

  EditDetailsModel({required this.message});

  factory EditDetailsModel.fromJson(Map<String, dynamic> json) =>
      EditDetailsModel(
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'message': message,
      };
}

GetEditDetailsModel getEditDetailsModelFromJson(String str) =>
    GetEditDetailsModel.fromJson(json.decode(str));

String getEditDetailsModelToJson(GetEditDetailsModel data) =>
    json.encode(data.toJson());

class GetEditDetailsModel {
  GetEditDetailsModel({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory GetEditDetailsModel.fromJson(Map<String, dynamic> json) =>
      GetEditDetailsModel(
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
    required this.galleries,
    required this.totalCount,
  });

  List<Gallery> galleries;
  int totalCount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        galleries: List<Gallery>.from(
            json["galleries"].map((x) => Gallery.fromJson(x))),
        totalCount: json["total_count"],
      );

  Map<String, dynamic> toJson() => {
        "galleries": List<dynamic>.from(galleries.map((x) => x.toJson())),
        "total_count": totalCount,
      };
}

class Gallery {
  Gallery({
    required this.id,
    required this.userId,
    required this.imgPath,
  });

  String id;
  String userId;
  String imgPath;

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

