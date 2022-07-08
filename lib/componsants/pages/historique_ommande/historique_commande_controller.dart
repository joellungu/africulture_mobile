import 'dart:convert';

import 'package:africulture_mobile/utile/utils.dart';
import 'package:get/get.dart';

class HistoriqueCommandeController extends GetxController {
  //
  EncoursConnexion encoursConnexion = EncoursConnexion();
  //
  RxList listeCommande = RxList();
  //
  RxMap commande = RxMap();
  //
  RxString fr = "fr".obs;
  //
  RxList listeHistoriqueCommandes = [].obs;
  //
  commandeDuMois(String code, String numero, String date) async {
    //listeHistoriqueCommandes.value.clear();
    //print(p);
    Response rep = await encoursConnexion.commandeDuMois(code, numero, date);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
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
  getCommande(String id) async {
    Response rep = await encoursConnexion.getCommande(id);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //
      print(rep.bodyString);
      //
      commande.value = jsonDecode(rep.bodyString!);
    } else {
      commande.value = {};
      //
    }
  }
}

class EncoursConnexion extends GetConnect {
  Future<Response> commandeDuMois(
      String code, String numero, String date) async {
    print("::${Utils.url}/commande/numero/$code/$numero/$date");
    return get(
      "${Utils.url}/commande/numero/$code/$numero/$date",
    );
  } //commande

  Future<Response> getStandards(Map<String, dynamic> p) async => await get(
        "${Utils.url}/commande/${p['']}/accepté",
      );
  Future<Response> getCommande(String id) async => await get(
        "${Utils.url}/commande/$id",
      );
}
