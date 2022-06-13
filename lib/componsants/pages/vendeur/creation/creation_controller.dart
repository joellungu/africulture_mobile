import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'creation_connexion.dart';

class CreationController extends GetxController {
  //
  final box = GetStorage();
  //
  RxMap produit = RxMap();

  //"idfournisseur":"0",

  RxString titreMar = RxString("");
  RxString deviseMar = RxString("");
  RxString prixMar = RxString("");
  RxString poidsUnitaire = RxString("");
  RxString profondeur = RxString(""); //
  RxString largeur = RxString(""); //
  RxString longueur = RxString(""); //
  RxString paysOrigine = RxString("");
  RxString codePays = RxString("");
  RxString stockMar = RxString("");
  RxString descriptionMar = RxString("");
  RxString infosSupplementaireMar = RxString("");
  RxString categorieMar = RxString("Art");
  //
  RxMap tailleUtilite = RxMap();
  //
  RxDouble avancement = RxDouble(Get.width / 3);
  RxString titre = "".obs;
  //*/
  RxInt load = 0.obs;
  //
  //
  CreationConnexion creationConnexion = CreationConnexion();
  //
  //
  Future<int> enregistrerProduit(Map<String, dynamic> p) async {
    Response rep = await creationConnexion.enregistreProduit(p);
    if (rep.statusCode == 201 || rep.statusCode == 200) {
      //
      print("::::::::::::${rep.statusCode}");
      print("::::::::::::${rep.body}");
      //
      print("${rep.body.runtimeType}");
      box.write("produit", rep.body);
      //box.write("produit", rep.statusCode);
      /*
      Get.back();
      Get.snackbar(
        "Etape 1",
        "Veuillez maintenant associer les images",
        duration: Duration(seconds: 7),
      );
      */
      Map<String, dynamic> x = rep.body;
      print("__: ${x['id']}");
      print("__: $x");

      return x['id'];
    } else {
      //
      print(":::::::::::::${rep.statusCode}");
      print(":::::::::::::${rep.body}");
      //Get.back();
      /*
      Get.snackbar(
        "Etape 1",
        "Erreur d'ajout code: ${rep.statusCode}\nM: ${rep.body}",
        duration: Duration(seconds: 7),
      );
      */
      return 0;
    }
  }

  Future<bool> enregistrerImageProduit(List<Map<String, dynamic>> p) async {
    //idproduit;image
    Response rep = await creationConnexion.enregistrerImageProduit(p);
    if (rep.statusCode == 201 ||
        rep.statusCode == 200 ||
        rep.statusCode == 204) {
      //
      print("${rep.body}");
      box.write("produit", rep.body);
      Get.back();
      Get.snackbar("SUCCESS", "Enregistrement effectué");
      return true;
    } else {
      //
      print("${rep.statusCode}");
      //
      print("${rep.body}");
      //
      Get.back();
      Get.snackbar(
          "ERREUR", "Erreur d'ajout code: ${rep.statusCode}\nM: ${rep.body}");
      return false;
    }
  }
}
