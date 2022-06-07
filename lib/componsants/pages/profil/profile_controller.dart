import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileControllers extends GetxController {
  var notification = true.obs;
  RxMap infosPerso = {}.obs;
  RxMap infosEnt = {}.obs;
  RxBool affichePas = true.obs;
  checkAffiche() {
    final box = GetStorage();
    print(box.read<Map<dynamic, dynamic>>("utilisateur"));
    //
    infosPerso.value = box.read<Map<dynamic, dynamic>>("utilisateur") != null
        ? box.read<Map<dynamic, dynamic>>("utilisateur")!
        : {};
  }

  removeInfos() {
    final box = GetStorage();
    box.remove("utilisateur");
  }
}
