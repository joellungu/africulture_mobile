import 'dart:convert';

import 'package:africulture_mobile/utile/utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ComingController extends GetxController {
  //
  final box = GetStorage();
  //
  RxInt loadPub = 0.obs;
  RxList loadPubListe = RxList();
  //
  RxInt loadN = 0.obs;
  RxList loadNListe = RxList();
  //
  RxInt loadV = 0.obs;
  RxList loadVListe = RxList();
  //
  RxInt loadPro = 0.obs;
  RxList loadProListe = RxList();

  //
  ComingConnexion comingConnexion = ComingConnexion();
  //
  RxInt statutLoad = 0.obs;
  Map<String, dynamic> donneesAccueil = RxMap();
  void nouvelleP() async {
    loadNListe = RxList();
    //
    loadN.value = 0;
    //
    Response r = await comingConnexion.nouvelleP();
    //
    if (r.statusCode == 200 || r.statusCode == 201) {
      //
      loadNListe.value = jsonDecode(r.bodyString!);
      loadNListe.value = loadNListe.reversed.toList();
      loadN.value = 1;
    } else {
      //
      loadN.value = 2;
    }
  }

  void meilleurV() async {
    //
    Response r = await comingConnexion.meilleurV();
    //
    if (r.statusCode == 200 || r.statusCode == 201) {
      //
      loadVListe = jsonDecode(r.bodyString!);
      loadV.value = 1;
    } else {
      //
      loadN.value = 0;
    }
  }

  void promotion() async {
    //
    Response r = await comingConnexion.promotion();
    //
    if (r.statusCode == 200 || r.statusCode == 201) {
      //
      loadProListe = jsonDecode(r.bodyString!);
      loadPro.value = 1;
    } else {
      //
      loadN.value = 0;
    }
  }

  void produitPub() async {
    //
    Response r = await comingConnexion.produitPub();
    //
    if (r.statusCode == 200 || r.statusCode == 201) {
      //
      loadPubListe = jsonDecode(r.bodyString!);
      loadPub.value = 1;
    } else {
      //
      loadN.value = 0;
    }
  }
}

class ComingConnexion extends GetConnect {
  //Future<Response> getProduit(String id) async => await get("${Utils.url}/produit/$id");

  Future<Response> nouvelleP() async => await get("${Utils.url}/produit/all");

  Future<Response> meilleurV() async =>
      await get("${Utils.url}/produit/meilleur");

  Future<Response> promotion() async =>
      await get("${Utils.url}/produit/promotion");

  Future<Response> produitPub() async => await get("${Utils.url}/produit/pub");
}
