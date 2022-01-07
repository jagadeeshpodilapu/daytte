// To parse this JSON data, do
//
//     final chatAllModel = chatAllModelFromJson(jsonString);

import 'dart:convert';

ChatAllModel chatAllModelFromJson(String str) => ChatAllModel.fromJson(json.decode(str));

String chatAllModelToJson(ChatAllModel data) => json.encode(data.toJson());

class ChatAllModel {
    ChatAllModel({
        required this.message,
       required this.data,
    });

    String message;
    Data data;

    factory ChatAllModel.fromJson(Map<String, dynamic> json) => ChatAllModel(
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
        this.isDeleted,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.userId,
        this.chatUser,
    });

    bool? isDeleted;
    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    String? userId;
    ChatUser? chatUser;

    factory User.fromJson(Map<String, dynamic> json) => User(
        isDeleted: json["isDeleted"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        userId: json["id"],
        chatUser: ChatUser.fromJson(json["chatUser"]),
    );

    Map<String, dynamic> toJson() => {
        "isDeleted": isDeleted,
        "_id": id,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "id": userId,
        "chatUser": chatUser!.toJson(),
    };
}

class ChatUser {
    ChatUser({
        this.id,
        this.firstname,
        this.lastname,
        this.profileImg,
        this.msg,
    });

    String? id;
    String? firstname;
    String? lastname;
    String? profileImg;
    Msg? msg;

    factory ChatUser.fromJson(Map<String, dynamic> json) => ChatUser(
        id: json["_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        profileImg: json["profileImg"],
        msg: Msg.fromJson(json["msg"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "profileImg": profileImg,
        "msg": msg!.toJson(),
    };
}

class Msg {
    Msg({
        this.message,
        this.createdAt,
        this.updatedAt,
        this.id,
    });

    String? message;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? id;

    factory Msg.fromJson(Map<String, dynamic> json) => Msg(
        message: json["message"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "id": id,
    };
}
