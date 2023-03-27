import 'package:africulture_mobile/componsants/pages/login/login.dart';
import 'package:africulture_mobile/componsants/pages/profil/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/carte_panier.dart';
import 'commander/commander.dart';
import 'panier_controller.dart';

class Panier extends StatelessWidget {
  PanierController panierController = Get.find();
  ProfileControllers profileControllers = Get.find();
  //
  List l = ["DHL", "Boloré", "POST-RDC", "Autre"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "panier".tr,
        ),
        //backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.centerLeft,
        //       end: Alignment.centerRight,
        //       colors: <Color>[Colors.yellow.shade700, Colors.black],
        //     ),
        //   ),
        // ),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "TOTAL   ",
                      children: [
                        TextSpan(
                          text:
                              "${panierController.listeProduit.value.length} Articles",
                        )
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      panierController.listeProduit.clear();
                    },
                    child: Text(
                      "vider_panier".tr,
                      style: TextStyle(
                        color: Colors.red.shade700,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Obx(
              () => ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                        panierController.listeProduit.value.length, (index) {
                      return CartePanier(
                          index,
                          true,
                          panierController.listeProduit.value[index]
                              ['quantite']);
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: InkWell(
                      onTap: () {
                        if (panierController.listeProduit.value.isEmpty) {
                          Get.snackbar("panier".tr, "vider_panier".tr);
                        } else {
                          //
                          Map<dynamic, dynamic> m =
                              profileControllers.infosPerso;

                          if (m['numero'] != null) {
                            Get.to(Commander());
                          } else {
                            Get.to(Login());
                            Get.snackbar(
                              "Compte",
                              "Vous n'avez pas un compte",
                              duration: Duration(seconds: 5),
                            );
                          }
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        child: Text(
                          "passer_commande".tr,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[
                              Colors.yellow.shade700,
                              Colors.black
                            ],
                          ),
                        ),
                      ),
                    ),
                    /*
                    ElevatedButton(
                      onPressed: () {
                        if (panierController.listeProduit.value.isEmpty) {
                          Get.snackbar("Panier", "Le Panier est vide !");
                        } else {
                          //
                          Map<dynamic, dynamic> m =
                              profileControllers.infosPerso;

                          if (m['numero'] != null) {
                            Get.to(Commander());
                          } else {
                            Get.snackbar(
                              "Compte",
                              "Vous n'avez pas un compte veuilliez en créer dans profil.",
                              duration: Duration(seconds: 5),
                            );
                          }
                        }
                      },
                      child: Text("Passer la commander"),
                    ),
                    */
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
