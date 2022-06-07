import 'package:get/get.dart';

class HistoriqueController extends GetxController {
  List listeHistorique = [].obs;
  RxBool showDetails = false.obs;
  RxMap<String, dynamic> detailsBon = RxMap<String, dynamic>();

  getListe() {
    //
    for (int t = 0; t < 2; t++) {
      listeHistorique.add({
        "titre": "Reduction total",
        "datelimite": "12/12/2022",
        "content": "20\$ pour tout achat de plus de 100\$",
        "image": "lien de limage",
        "serie": "684+284842+84+8248",
        "provenance": "Kin Marche"
      });
    }
    return listeHistorique;
  }

  removeElement(int index) {
    listeHistorique.removeAt(index);
  }
}
