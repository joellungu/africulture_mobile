import 'dart:convert';

import 'package:africulture_mobile/utile/utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavoritController extends GetxController with StateMixin<List> {
  RxList listeFavorits = [].obs;
  FavoritConnexion favoritConnexion = FavoritConnexion();
  //
  ajouter(String idproduit) async {
    final box = GetStorage();
    //
    Map u = box.read('utilisateur') ?? {};

    Response rep = await favoritConnexion.ajouter("${u['id']}", idproduit);
  }

  //
  supprimer(String idproduit) async {
    final box = GetStorage();
    //
    Map u = box.read('utilisateur') ?? {};

    Response rep = await favoritConnexion.supprimer("${u['id']}", idproduit);
  }

  //
  Future<bool> verifier(String idproduit) async {
    final box = GetStorage();
    //
    Map u = box.read('utilisateur') ?? {};

    Response rep = await favoritConnexion.verifier("${u['id']}", idproduit);
    if (rep.isOk) {
      return rep.body;
    } else {
      return false;
    }
  }

  //
  getAllFavorit() async {
    change([], status: RxStatus.loading());
    //
    final box = GetStorage();
    //
    List lf = box.read('favoris') ?? [];

    change(lf, status: RxStatus.success());
  }
}

//
class FavoritConnexion extends GetConnect {
  //
  Future<Response> ajouter(String iduser, String idproduit) async {
    return post("${Utils.url}/favorit/ajouter",
        {"iduser": iduser, "idproduit": idproduit});
  }

  //
  Future<Response> supprimer(String iduser, String idproduit) async {
    return post("${Utils.url}/favorit/supprimer",
        {"iduser": iduser, "idproduit": idproduit});
  }

  //
  Future<Response> verifier(String iduser, String idproduit) async {
    return get("${Utils.url}/favorit/verifier/$iduser/$idproduit");
  }

  //
  Future<Response> getAllFavorit(String id) {
    return get(
      "${Utils.url}/favorit/lister/$id",
    );
  }
}
