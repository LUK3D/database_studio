import 'package:backdev/controllers/LoginController.dart';
import 'package:backdev/models/DatabaseModel.dart';
import 'package:get/get.dart';
import 'package:tree_view/tree_view.dart';

class ExplorerController extends GetxController {
  var databases = <DatabaseModel>[].obs;
  var loginController = Get.find<LoginController>();

  var selectedDatabase = DatabaseModel(name: "").obs;

  @override
  void onInit() {
    for (var db in loginController.databases) {
      databases.value.add(DatabaseModel(name: db));
    }

    // TODO: implement onInit
    super.onInit();
  }
}
