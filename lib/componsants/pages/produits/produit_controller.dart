import 'dart:convert';

import 'package:africulture_mobile/utile/utils.dart';
import 'package:get/get.dart';

class ProduitController extends GetxController
    with StateMixin<Map<String, dynamic>> {
  //
  RxInt load = 0.obs;
  RxString ch = "".obs;
  RxString pt = "".obs;
  //
  RxList listeImages = [].obs;
  //
  ProduitConnexion produitConnexion = ProduitConnexion();
  //
  RxMap produitDetails = RxMap();
  //
  loadProduit(String id) async {
    Response r = await produitConnexion.loadProduit(id);
    if (r.statusCode == 200 || r.statusCode == 201) {
      produitDetails = jsonDecode(r.bodyString!);
      //
      Response r2 =
          await produitConnexion.loadImagesProduit(produitDetails['id']);

      if (r2.statusCode == 200 || r2.statusCode == 201) {
        //
        listeImages = jsonDecode(r2.bodyString!);
        //
        load.value = 1;
      } else {
        load.value = 1;
      }
    } else {
      load.value = 2;
    }
  }
}

class ProduitConnexion extends GetConnect {
  //
  Future<Response> loadProduit(String id) async =>
      get("${Utils.url}/produit/$id");
  //
  Future<Response> loadImagesProduit(String id) async =>
      get("${Utils.url}/produit/liste_images/$id");
  //

}
