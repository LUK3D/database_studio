// To parse this JSON data, do
//
//     final databaseModel = databaseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<DatabaseModel> databaseModelFromJson(String str) =>
    List<DatabaseModel>.from(
        json.decode(str).map((x) => DatabaseModel.fromJson(x)));

String databaseModelToJson(List<DatabaseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DatabaseModel {
  DatabaseModel({
    required this.name,
  });

  final String name;

  factory DatabaseModel.fromJson(Map<String, dynamic> json) => DatabaseModel(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
