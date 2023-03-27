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
    /*
    */
    listecat.value.add({
      "icon": Icons.art_track,
      "titre": "c1",
      "id": "1",
    });
    listecat.value.add({
      "icon": Icons.snowshoeing,
      "titre": "c2",
      "id": "2",
    });
    listecat.value.add({
      "icon": Icons.shield_rounded,
      "titre": "c3",
      "id": "3",
    });
    listecat.value.add({
      "icon": Icons.add_circle,
      "titre": "c4",
      "id": "4",
    });
    listecat.value.add({
      "icon": Icons.card_giftcard,
      "titre": "c5",
      "id": "5",
    });
    listecat.value.add({
      "icon": Icons.collections_sharp,
      "titre": "c6",
      "id": "6",
    });
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
  Future<Response> getProduitCategorie(int categorie) async => await get(
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
