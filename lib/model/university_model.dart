// To parse this JSON data, do
//
//     final universityListModel = universityListModelFromJson(jsonString);

import 'dart:convert';

UniversityListModel universityListModelFromJson(String str) =>
    UniversityListModel.fromJson(json.decode(str));

String universityListModelToJson(UniversityListModel data) =>
    json.encode(data.toJson());

class UniversityListModel {
  UniversityListModel({
    required this.message,
    required this.universityList,
  });

  String message;
  UniversityList universityList;

  factory UniversityListModel.fromJson(Map<String, dynamic> json) =>
      UniversityListModel(
        message: json["message"],
        universityList: UniversityList.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": universityList.toJson(),
      };
}

class UniversityList {
  UniversityList({
    required this.passion,
    required this.totalCount,
  });

  List<UniversityInfo> passion;
  int totalCount;

  factory UniversityList.fromJson(Map<String, dynamic> json) => UniversityList(
        passion: List<UniversityInfo>.from(
            json["passion"].map((x) => UniversityInfo.fromJson(x))),
        totalCount: json["total_count"],
      );

  Map<String, dynamic> toJson() => {
        "passion": List<dynamic>.from(passion.map((x) => x.toJson())),
        "total_count": totalCount,
      };
}

class UniversityInfo {
  UniversityInfo({
    this.isActiveStatus,
    this.id,
    this.name,
  });

  bool? isActiveStatus;
  String? id;
  String? name;

  factory UniversityInfo.fromJson(Map<String, dynamic> json) => UniversityInfo(
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
