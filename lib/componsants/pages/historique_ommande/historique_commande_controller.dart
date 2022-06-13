import 'dart:convert';

import 'package:africulture_mobile/utile/utils.dart';
import 'package:get/get.dart';

class HistoriqueCommandeController extends GetxController {
  //
  EncoursConnexion encoursConnexion = EncoursConnexion();
  //
  RxList listeCommande = RxList();
  //
  RxList listeHistoriqueCommandes = [].obs;
  //
  commandeDuMois(String code, String numero, String date) async {
    //print(p);
    Response rep = await encoursConnexion.commandeDuMois(code, numero, date);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //
      print(rep.bodyString);
      //
      listeCommande.value = jsonDecode(rep.bodyString!);
    } else {
      //
      Get.snackbar("Panier", "Le Panier est vide !");
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
  }

  Future<Response> getStandards(Map<String, dynamic> p) async => await get(
        "${Utils.url}/commande/${p['']}/accepté",
      );
}
