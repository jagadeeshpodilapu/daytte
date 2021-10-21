// To parse this JSON data, do
//
//     final passionModel = passionModelFromJson(jsonString);

import 'dart:convert';

PassionModel passionModelFromJson(String str) => PassionModel.fromJson(json.decode(str));

String passionModelToJson(PassionModel data) => json.encode(data.toJson());

class PassionModel {
    PassionModel({
        required this.message,
        required this.data,
    });

    String message;
    Data data;

    factory PassionModel.fromJson(Map<String, dynamic> json) => PassionModel(
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
        this.passion,
        this.totalCount,
    });

    List<Passion>? passion;
    int? totalCount;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        passion: List<Passion>.from(json["passion"].map((x) => Passion.fromJson(x))),
        totalCount: json["total_count"],
    );

    Map<String, dynamic> toJson() => {
        "passion": List<dynamic>.from(passion!.map((x) => x.toJson())),
        "total_count": totalCount,
    };
}

class Passion {
    Passion({
        this.isActiveStatus,
        this.id,
        this.name,
    });

    bool? isActiveStatus;
    String? id;
    String? name;

    factory Passion.fromJson(Map<String, dynamic> json) => Passion(
        isActiveStatus: json["is_active_status"],
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "is_active_status": isActiveStatus,
        "_id": id,
        "name": name,
    };
}
