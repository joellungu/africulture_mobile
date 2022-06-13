import 'package:africulture_mobile/componsants/pages/panier/panier_controller.dart';
import 'package:africulture_mobile/componsants/widgets/carte_panier.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../commander/commander_controller.dart';

class Listage extends StatefulWidget {
  PageController pageController = PageController();
  //
  List<String> titres = [];
  //
  Listage(this.pageController, this.titres);

  @override
  State<StatefulWidget> createState() {
    return _Listage();
  }
}

class _Listage extends State<Listage> {
  //

  PanierController panierController = Get.find();
  CommanderController commanderController = Get.find();
  //
  double conte = Get.width / 4;
  int i = 1;
  //

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Obx(
            () => ListView(
              padding: EdgeInsets.only(
                top: 20,
              ),
              children:
                  List.generate(panierController.listeProduit.length, (index) {
                return CartePanier(index, false,
                    panierController.listeProduit[index]['quantite']);
              }),
            ),
          ),
        ),
        Container(
          height: 40,
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  if (i > 0) {
                    print("Avant: $i");
                    i--;
                    print("Après: $i");
                    commanderController.avancement.value =
                        commanderController.avancement.value - conte;
                    commanderController.titre.value = "Expédition";
                    widget.pageController.previousPage(
                      duration: Duration(seconds: 1),
                      curve: Curves.ease,
                    );
                  }
                },
                child: const Text("Retour"),
              ),
              TextButton(
                onPressed: () {
                  if (i <= 2) {
                    print("Avant: $i");
                    i++;
                    print("Après: $i");
                    commanderController.avancement.value =
                        commanderController.avancement.value + conte;
                    commanderController.titre.value = "Paiment";
                    widget.pageController.nextPage(
                      duration: Duration(seconds: 1),
                      curve: Curves.ease,
                    );
                  }
                  //
                },
                child: const Text("Suivant"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
