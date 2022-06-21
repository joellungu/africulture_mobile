import 'package:africulture_mobile/utile/utils.dart';
import 'package:get/get.dart';

class MesProduitsController extends GetxController {
  RxDouble avancement = 0.0.obs;
  //
  MesProduitsConnexion mesProduitsConnexion = MesProduitsConnexion();
  //
  Future<Response> getMesProduits(String idf, String categorie) async {
    //idproduit;image
    Response rep = await mesProduitsConnexion.getMesProduits(idf, categorie);
    return rep;
  }
}

class MesProduitsConnexion extends GetConnect {
  Future<Response> getMesProduits(String idf, String categorie) async =>
      await get(
        "${Utils.url}/produit/mesproduits/$idf/$categorie",
      );
}


//