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
