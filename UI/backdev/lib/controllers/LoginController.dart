import 'package:backdev/server/requests.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var selectedDB = ''.obs;

  var databases = <String>[].obs;
  var server = "".obs;

  var connected = false.obs;

  void connect() {
    REQUESTS().getDatabases(
        server: server.value,
        callback: (data) {
          databases.value = data.map((e) => e.name).toList();
        });
  }
}
