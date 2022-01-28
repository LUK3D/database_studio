import 'dart:convert';

import 'package:backdev/controllers/LoginController.dart';
import 'package:backdev/models/DatabaseModel.dart';
import 'package:backdev/models/TableModel.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class REQUESTS extends GetxController {
  final databases = "databases";
  final tables = "tables";
  final columns = "columns";
  final sprocedures = "sprocedures";
  final spScript = "spScript";
  final functions = "functions";
  final relations = "relations";
  final baseUrl = "http://127.0.0.1:3011/";

  var loginController = Get.find<LoginController>();

  void getDatabases({
    database,
    required Function(List<DatabaseModel>) callback,
  }) {
    Dio().post(baseUrl + databases, data: {
      "server": loginController.server.value,
      "engine": loginController.engine.value,
      "user": loginController.user.value,
      "password": loginController.password.value,
      "database": database,
    }).then((value) {
      print("We are back with: ${value.data}");
      callback(databaseModelFromJson(jsonEncode(value.data)));
    });
  }

  Future<List<ModTable>> getTables(
      {database, required Function(List<ModTable>) callback}) async {
    List<ModTable> val = [];
    await Dio().get(baseUrl + tables, queryParameters: {
      "server": loginController.server.value,
      "engine": loginController.engine.value,
      "user": loginController.user.value,
      "password": loginController.password.value,
      "database": database,
    }).then((value) {
      print("We are back with: ${value.data}");
      val = modTableFromJson(jsonEncode(value.data));
      callback(val);
    });

    return val;
  }
}
