import 'dart:convert';

import 'package:africulture_mobile/utile/utils.dart';
import 'package:get/get.dart';

class CommandeVendeurController extends GetxController {
  //
  CommandeVendeurConnexion commandeVendeurConnexion =
      CommandeVendeurConnexion();
  //
  RxList listeCommande = RxList();
  //
  RxMap commande = RxMap();
  //
  RxString fr = "fr".obs;
  //
  RxList listeHistoriqueCommandes = [].obs;
  //
  commandeDuMois(String idf, String date) async {
    //listeHistoriqueCommandes.value.clear();
    //print(p);
    Response rep = await commandeVendeurConnexion.commandeDuMois(idf, date);
    if (rep.isOk) {
      //
      print(rep.bodyString);
      //
      listeHistoriqueCommandes.value = jsonDecode(rep.bodyString!);
    } else {
      listeHistoriqueCommandes.value = [];
      //
      Get.snackbar("Panier", "Le Panier est vide !");
    }
  }

  //
}

class CommandeVendeurConnexion extends GetConnect {
  Future<Response> commandeDuMois(String idf, String date) async {
    print("::${Utils.url}/vendeurcommande/all/$idf/$date");
    //http://localhost:8080/vendeurcommande/all/0/2022-07-07 11
    return get(
      "${Utils.url}/vendeurcommande/all/$idf/$date",
    );
  } //commande

  //Future<Response> getStandards(Map<String, dynamic> p) async => await get(
  //    "${Utils.url}/commande/${p['']}/accepté",
  //);
}
