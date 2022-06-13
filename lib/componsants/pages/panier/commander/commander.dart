import 'package:africulture_mobile/componsants/pages/panier/listage/listage.dart';
import 'package:africulture_mobile/componsants/pages/panier/paiement/paiement.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/carte_panier.dart';
import '../adresse/adresse.dart';
import '../expedition/expedition.dart';
import '../panier_controller.dart';
import 'commander_controller.dart';

class Commander extends StatelessWidget {
  PageController pageController = PageController();

  CommanderController commanderController = Get.find();

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
                Adresse(pageController, titres),
                Expedition(pageController, titres),
                Listage(pageController, titres),
                Paiement(pageController, titres),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
