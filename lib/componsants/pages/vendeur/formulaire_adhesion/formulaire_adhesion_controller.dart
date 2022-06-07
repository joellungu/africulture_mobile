import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utile/utils.dart';
import '../vendeur_controller.dart';

class FormulaireAdhesionController extends GetxController {
  RxDouble avancement = 0.0.obs;
  RxString titreProfile = "Titre_profil_vendeur".obs;
  RxBool aUnCompte = false.obs;
  VendeurController vendeurController = Get.find();
  final box = GetStorage();
  //
  VendeurConnexion vendeurConnexion = VendeurConnexion();
  //
  enregistreVendeur(Map<String, dynamic> p) async {
    //idproduit;image
    Response rep = await vendeurConnexion.enregistreVendeur(p);
    if (rep.statusCode == 201 || rep.statusCode == 200) {
      //
      print("${rep.body}");
      //box.write("produit", rep.body);
      Get.back();
      Get.snackbar("Succes", "Votre démande à bien été effectué");
      //
      box.write("profil_vendeur", rep.body);
      //
      vendeurController.aUnCompte.value = true;
    } else {
      //
      print("${rep.statusCode}");
      //
      print("${rep.body}");
      //
      Get.back();
      Get.snackbar("Erreur", "Erreur code: ${rep.statusCode}\nM: ${rep.body}");
    }
  }
}

class VendeurConnexion extends GetConnect {
  Future<Response> enregistreVendeur(Map<String, dynamic> p) async =>
      await post(
        "${Utils.url}/client/save",
        jsonEncode(p),
      );
}
