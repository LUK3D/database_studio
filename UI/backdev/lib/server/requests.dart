import 'dart:convert';

import 'package:backdev/models/DatabaseModel.dart';
import 'package:dio/dio.dart';

class REQUESTS {
  final databases = "databases";
  final tables = "tables";
  final columns = "columns";
  final sprocedures = "sprocedures";
  final spScript = "spScript";
  final functions = "functions";
  final relations = "relations";
  final baseUrl = "http://127.0.0.1:3011/";

  void getDatabases(
      {required server,
      database,
      required Function(List<DatabaseModel>) callback,
      user,
      password}) {
    Dio().post(baseUrl + databases, data: {
      "server": server,
      "database": database,
      "user": user,
      "password": password
    }).then((value) {
      print("We are back with: ${value.data}");
      callback(databaseModelFromJson(jsonEncode(value.data)));
    });
  }
}
