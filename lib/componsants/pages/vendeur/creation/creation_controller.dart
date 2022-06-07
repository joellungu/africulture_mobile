import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'creation_connexion.dart';

class CreationController extends GetxController {
  //
  CreationConnexion creationConnexion = CreationConnexion();
  final box = GetStorage();
  //
  RxInt load = 0.obs;
  //
  enregistrerProduit(Map<String, dynamic> p) async {
    Response rep = await creationConnexion.enregistreProduit(p);
    if (rep.statusCode == 201 || rep.statusCode == 200) {
      //
      print("${rep.statusCode}");
      print("${rep.body}");
      //
      print("${rep.body.runtimeType}");
      box.write("produit", rep.body);
      //box.write("produit", rep.statusCode);
      Get.back();
      Get.snackbar("Etape 1", "Veuillez maintenant associer les images",
          duration: Duration(seconds: 7));
    } else {
      //
      print("${rep.statusCode}");
      print("${rep.body}");
      Get.back();
      Get.snackbar(
          "Etape 1", "Erreur d'ajout code: ${rep.statusCode}\nM: ${rep.body}",
          duration: Duration(seconds: 7));
    }
  }

  Future<bool> enregistrerImageProduit(Map<String, dynamic> p) async {
    //idproduit;image
    Response rep = await creationConnexion.enregistrerImageProduit(p);
    if (rep.statusCode == 201 || rep.statusCode == 200) {
      //
      print("${rep.body}");
      box.write("produit", rep.body);
      Get.back();
      Get.snackbar("Etape 2", "Veuillez maintenant associer les images");
      return true;
    } else {
      //
      print("${rep.statusCode}");
      //
      print("${rep.body}");
      //
      Get.back();
      Get.snackbar(
          "Etape 2", "Erreur d'ajout code: ${rep.statusCode}\nM: ${rep.body}");
      return false;
    }
  }
}
