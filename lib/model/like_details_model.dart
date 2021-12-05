// To parse this JSON data, do
//
//     final likeDetailsModel = likeDetailsModelFromJson(jsonString);

import 'dart:convert';

LikeDetailsModel likeDetailsModelFromJson(String str) => LikeDetailsModel.fromJson(json.decode(str));

String likeDetailsModelToJson(LikeDetailsModel data) => json.encode(data.toJson());

class LikeDetailsModel {
    LikeDetailsModel({
        required this.message,
        required this.data,
    });

    String message;
    Data data;

    factory LikeDetailsModel.fromJson(Map<String, dynamic> json) => LikeDetailsModel(
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
        required this.likes,
        required this.totalCount,
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
        this.isMatched,
        this.likeType,
        this.id,
        this.likedBy,
        this.likedTo,
        this.isLiked,
        this.likeId,
    });

    bool? isMatched;
    String? likeType;
    String? id;
    String? likedBy;
    LikedTo? likedTo;
    bool? isLiked;
    String? likeId;

    factory Like.fromJson(Map<String, dynamic> json) => Like(
        isMatched: json["isMatched"],
        likeType: json["likeType"],
        id: json["_id"],
        likedBy: json["likedBy"],
        likedTo: LikedTo.fromJson(json["likedTo"]),
        isLiked: json["isLiked"],
        likeId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "isMatched": isMatched,
        "likeType": likeType,
        "_id": id,
        "likedBy": likedBy,
        "likedTo": likedTo!.toJson(),
        "isLiked": isLiked,
        "id": likeId,
    };
}

class LikedTo {
    LikedTo({
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

    factory LikedTo.fromJson(Map<String, dynamic> json) => LikedTo(
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
