import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utile/utils.dart';

class VendeurController extends GetxController {
  RxDouble avancement = 0.0.obs;
  RxString titreProfile = "Titre_profil_vendeur".obs;
  RxBool aUnCompte = false.obs;
  RxBool suspendu = true.obs;
  RxBool check = RxBool(true); //Par defaut je check
  //
  final box = GetStorage();
  //
  @override
  void onClose() {
    //
    print("close truc");
    //
    check.value = true;
    //
    super.onClose();
  }
  //
  //super.onDelete

  //
  VendeurConnexion vendeurConnexion = VendeurConnexion();
  //
  verificationCompte() {
    var vendeurInfos = box.read("profil_vendeur");
    if (vendeurInfos != null) {
      aUnCompte.value = true; //1
      suspendu.value = vendeurInfos["suspendre"];
      print(vendeurInfos);
      checkStatut("${vendeurInfos["id"]}");
    }
  }

  checkStatut(String id) async {
    check.value = true;
    Response rep = await vendeurConnexion.checkStatut(id);
    if (rep.statusCode == 201 || rep.statusCode == 200) {
      //
      var vendeurInfos = box.read("profil_vendeur");
      vendeurInfos["suspendre"] = rep.body!;
      box.write("profil_vendeur", vendeurInfos);
      //
      print("${rep.body}");
      check.value = false;
    } else {
      check.value = false;
    }
  }

  //
  enregistreVendeur(Map<String, dynamic> p) async {
    //idproduit;image
    Response rep = await vendeurConnexion.enregistreVendeur(p);
    if (rep.statusCode == 201 || rep.statusCode == 200) {
      //
      print("${rep.body}");
      //box.write("produit", rep.body);
      Get.back();
      Get.snackbar("Etape 2", "Veuillez maintenant associer les images");
    } else {
      //
      print("${rep.statusCode}");
      //
      print("${rep.body}");
      //
      Get.back();
      Get.snackbar(
          "Etape 2", "Erreur d'ajout code: ${rep.statusCode}\nM: ${rep.body}");
    }
  }
}

class VendeurConnexion extends GetConnect {
  Future<Response> enregistreVendeur(Map<String, dynamic> p) async =>
      await post(
        "${Utils.url}/client/save",
        jsonEncode(p),
      );

  Future<Response> checkStatut(String id) async => await get(
        "${Utils.url}/client/check/$id",
      );
}
