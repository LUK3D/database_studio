import 'package:backdev/controllers/LoginController.dart';
import 'package:backdev/models/DatabaseModel.dart';
import 'package:backdev/models/TableModel.dart';
import 'package:backdev/server/requests.dart';
import 'package:get/get.dart';

class ExplorerController extends GetxController {
  var databases = <DatabaseModel>[].obs;
  var tables = <ModTable>[].obs;
  var selectedTable = "".obs;
  var loginController = Get.find<LoginController>();

  var selectedDatabase = DatabaseModel(name: "").obs;

  Future<List<ModTable>> getChilds({required String database}) async {
    tables.value = [];
    return await REQUESTS().getTables(
        database: database,
        callback: (val) {
          tables.value = val;
        });
  }

  @override
  void onInit() {
    for (var db in loginController.databases) {
      databases.value.add(DatabaseModel(name: db));
    }

    // TODO: implement onInit
    super.onInit();
  }
}
