// To parse this JSON data, do
//
//     final chatHistoryModel = chatHistoryModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

ChatHistoryModel chatHistoryModelFromJson(String str) =>
    ChatHistoryModel.fromJson(json.decode(str));

String chatHistoryModelToJson(ChatHistoryModel data) =>
    json.encode(data.toJson());

class ChatHistoryModel {
  ChatHistoryModel({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory ChatHistoryModel.fromJson(Map<String, dynamic> json) =>
      ChatHistoryModel(
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
    this.chats,
    this.totalCount,
  });

  List<Chat>? chats;
  int? totalCount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        chats: List<Chat>.from(json["chats"].map((x) => Chat.fromJson(x))),
        totalCount: json["total_count"],
      );

  Map<String, dynamic> toJson() => {
        "chats": List<dynamic>.from(chats!.map((x) => x.toJson())),
        "total_count": totalCount,
      };
}

class Chat {
  Chat({
    this.isRead,
    this.isDeleted,
    this.isEdited,
    this.id,
    this.sender,
    this.receiver,
    this.message,
    this.messageType,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.chatId,
  });

  bool? isRead;
  bool? isDeleted;
  bool? isEdited;
  String? id;
  String? sender;
  String? receiver;
  String? message;
  int? messageType;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? chatId;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        isRead: json["isRead"],
        isDeleted: json["isDeleted"],
        isEdited: json["isEdited"],
        id: json["_id"],
        sender: json["sender"],
        receiver: json["receiver"],
        message: json["message"],
        messageType: json["messageType"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        chatId: json["id"],
      );


  Map<String, dynamic> toJson() => {
        "isRead": isRead,
        "isDeleted": isDeleted,
        "isEdited": isEdited,
        "_id": id,
        "sender": sender,
        "receiver": receiver,
        "message": message,
        "messageType": messageType,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "id": chatId,
      };
}
