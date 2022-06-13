import 'package:africulture_mobile/utile/utils.dart';
import 'package:get/get.dart';

class ExpeditionController extends GetxController
    with StateMixin<Map<String, dynamic>> {
  RxString choix = "".obs;
  RxBool express = false.obs;
  prixExpedition(Map<String, dynamic> exp) async {}
}

class ProduitConnexion extends GetConnect {
  //
  Future<Response> loadProduit(String id) async =>
      get("${Utils.url}/produit/$id");
  //
  //

}
