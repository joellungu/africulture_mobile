import 'dart:convert';

import 'package:africulture_mobile/componsants/contr%C3%B4ler/accueil_controller.dart';
import 'package:africulture_mobile/componsants/pages/panier/panier_controller.dart';
import 'package:africulture_mobile/componsants/pages/principale.dart';
import 'package:africulture_mobile/utile/utils.dart';
import 'package:get/get.dart';

class ValidationController extends GetxController
    with StateMixin<Map<String, dynamic>> {
  //
  AccueilController accueilController = Get.find();
  PanierController panierController = Get.find();
  //
  RxInt load = 0.obs;
  RxString ch = "".obs;
  RxString pt = "".obs;
  //
  RxList listeImages = [].obs;
  //
  ValidationConnexion validationConnexion = ValidationConnexion();
  //
  RxMap produitDetails = RxMap();
  //
  loadProduit(String code, Map<String, dynamic> c) async {
    Response r = await validationConnexion.commander(code, c); //
    if (r.statusCode == 200 || r.statusCode == 201 || r.statusCode == 204) {
      //
      Get.back();
      panierController.listeProduit.value.clear();
      Get.off(Principale());
      accueilController.setEcranIndex(0); 
      Get.snackbar(
        "SUCCESS",
        "Commande éffectué",
        duration: Duration(seconds: 5),
      );
    } else {
      //
      Get.back();
      Get.snackbar(
        "ERREUR",
        "Erreur d'ajout code: ${r.statusCode}\nM: ${r.body}",
        duration: Duration(seconds: 5),
      );
    }
  }
}

class ValidationConnexion extends GetConnect {
  //
  Future<Response> commander(String code, Map<String, dynamic> c) async {
    return post("${Utils.url}/commande/save/$code", jsonEncode(c));
  }

  //
  Future<Response> loadImagesProduit(String id) async =>
      get("${Utils.url}/produit/liste_images/$id");
  //

}
