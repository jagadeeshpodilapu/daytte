// To parse this JSON data, do
//
//     final deleteGalleryModel = deleteGalleryModelFromJson(jsonString);

import 'dart:convert';

DeleteGalleryModel deleteGalleryModelFromJson(String str) =>
    DeleteGalleryModel.fromJson(json.decode(str));

String deleteGalleryModelToJson(DeleteGalleryModel data) =>
    json.encode(data.toJson());

class DeleteGalleryModel {
  DeleteGalleryModel({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory DeleteGalleryModel.fromJson(Map<String, dynamic> json) =>
      DeleteGalleryModel(
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
    this.id,
  });

  String? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
