import 'package:get/get.dart';

class ListBonController extends GetxController {
  List listeDeBons = [].obs;

  getListe() {
    //
    for (int t = 0; t < 2; t++) {
      listeDeBons.add({
        "titre": "Reduction total",
        "datelimite": "12/12/2022",
        "content": "20\$ pour tout achat de plus de 100\$",
        "image": "lien de limage",
        "serie": "684+284842+84+8248",
        "provenance": "Kin Marche"
      });
    }
    return listeDeBons;
  }

  removeElement(int index) {
    listeDeBons.removeAt(index);
  }
}
