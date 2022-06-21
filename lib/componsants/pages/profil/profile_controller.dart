import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileControllers extends GetxController {
  var notification = true.obs;
  RxMap infosPerso = {}.obs;
  RxMap infosEnt = {}.obs;
  RxBool affichePas = true.obs;
  //Cette fonction check si l'utilisateur a déjà un compte...
  checkAffiche() {
    final box = GetStorage();
    //box.write("utilisateur", {});
    var o = box.read("utilisateur");
    //print(o);
    //
    if (box.read("utilisateur") != null) {
      infosPerso.value = o;
      //infosPerso = o;
    }
  }

  removeInfos() {
    final box = GetStorage();
    box.remove("utilisateur");
  }
}
