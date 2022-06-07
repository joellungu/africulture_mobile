import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/carte_panier.dart';
import '../adresse/adresse.dart';
import '../panier_controller.dart';
import 'commander_controller.dart';

class Commander extends StatelessWidget {
  PageController pageController = PageController();

  CommanderController commanderController = Get.find();
  PanierController panierController = Get.find();

  double conte = 0;
  int i = 0;
  List<String> titres = ["Adresse", "Expédition", "Commandes", "Paiment"];

  @override
  Widget build(BuildContext context) {
    conte = MediaQuery.of(context).size.width / 4;
    commanderController.avancement.value = conte;
    //
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(commanderController.titre.value),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            //splashController.homologin.value = true;
            commanderController.titre.value = "Adresse";
            commanderController.avancement.value = 0;
            conte = 0;
            //
            Get.back();
          },
        ),
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Colors.yellow.shade700, Colors.black],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 5,
                  color: Colors.red.shade700,
                  width: commanderController.avancement.value,
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: PageView(
              controller: pageController,
              children: [
                Adresse(),
                Container(
                  color: Colors.white,
                ),
                Obx(
                  () => ListView(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    children: List.generate(
                        panierController.listeProduit.length, (index) {
                      return CartePanier();
                    }),
                  ),
                ),
                Container(
                  color: Colors.yellow,
                )
              ],
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
                      commanderController.titre.value = titres[i];
                      pageController.previousPage(
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
                      commanderController.titre.value = titres[i];
                      pageController.nextPage(
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
      ),
    );
  }
}
