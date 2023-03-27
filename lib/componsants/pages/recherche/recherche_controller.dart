import 'package:africulture_mobile/utile/utils.dart';
import 'package:get/get.dart';

class RechercheController extends GetxController with StateMixin<List> {
  RxList listeProduits = [].obs;
  RechercheConnection rechercheConnection = RechercheConnection();
  start() async {
    change([], status: RxStatus.empty());
  }

  getProduits(String nom) async {
    change([], status: RxStatus.loading());
    Response rep = await rechercheConnection.getElements(nom);
    if (rep.isOk) {
      listeProduits = RxList(rep.body);
      change(listeProduits, status: RxStatus.success());
    } else {
      change([], status: RxStatus.empty());
    }
  }
}

class RechercheConnection extends GetConnect {
  Future<Response> getElements(String nom) async {
    return get("${Utils.url}/produit/recherche/$nom");
  }
}
