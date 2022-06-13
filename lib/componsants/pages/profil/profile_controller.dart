import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileControllers extends GetxController {
  var notification = true.obs;
  RxMap infosPerso = {}.obs;
  RxMap infosEnt = {}.obs;
  RxBool affichePas = true.obs;
  checkAffiche() {
    final box = GetStorage();
    //box.write("utilisateur", {});
    var o = box.read("utilisateur");
    //print(o);
    //
    infosPerso.value = o['numero'] != null ? o : {};
  }

  removeInfos() {
    final box = GetStorage();
    box.remove("utilisateur");
  }
}
