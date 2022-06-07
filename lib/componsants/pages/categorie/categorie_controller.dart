import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utile/utils.dart';

class CategorieController extends GetxController {
  RxList listecat = [].obs; //<Map<String, dynamic>>//
  //
  DemandeurConnexion demandeurConnexion = DemandeurConnexion();
  //
  RxList images = RxList([]);
  //
  getCategorie() {
    //
    listecat.value.add({"icon": Icons.art_track, "titre": "Art"});
    listecat.value.add({"icon": Icons.snowshoeing, "titre": "Vetements"});
    listecat.value.add({"icon": Icons.shield_rounded, "titre": "Gastronomie"});
    listecat.value.add({"icon": Icons.add_circle, "titre": "Nourriture"});
    listecat.value.add({"icon": Icons.card_giftcard, "titre": "Cosmetique"});
    listecat.value.add({"icon": Icons.collections_sharp, "titre": "Mobilier"});
    listecat.value.add({"icon": Icons.book_outlined, "titre": "Décoration"});
    listecat.value.add({"icon": Icons.shield_rounded, "titre": "Autre"});
  }

  //
  getListeImages(String idproduit) async {
    print("Le id du produit vaut: $idproduit");
    Response rep = await demandeurConnexion.getListeImages(idproduit);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      print(rep.bodyString!);
      images.value = jsonDecode(rep.bodyString!);
      //load.value = true;
      print("cool ${images.value}");
    } else {
      //load.value = false;
      print("pas cool");
    }
  }
}
//

class DemandeurConnexion extends GetConnect {
  Future<Response> getParCategorie(String categorie) async => await get(
        "${Utils.url}/produit/categorie/$categorie",
      );
  Future<Response> getProduitCategorie(String categorie) async => await get(
        "${Utils.url}/produit/categorie/$categorie",
      );

  Future<Response> allDemandeur() async => await get(
        "${Utils.url}/client/allstarter/accepté",
      );

  Future<Response> updateDemandeur(Map<dynamic, dynamic> up) async => await put(
        "${Utils.url}/client/update",
        jsonEncode(up),
      );
  //
  Future<Response> getListeImages(String categorie) async => await get(
        "${Utils.url}/produit/liste_images/$categorie",
      );
  //
}
