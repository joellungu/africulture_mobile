import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  var homologin = true.obs;

  seLoger(bool v) {
    homologin.value = true;
  }

  bool getLoger() {
    final box = GetStorage();
    //
    final c = box.read("utilisateur");
    print("data: $c");
    //
    if (c != null) {
      homologin.value = true;
    } else {
      homologin.value = false;
    }
    return homologin.value;
  }
}
