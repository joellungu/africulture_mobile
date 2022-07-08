import 'package:africulture_mobile/componsants/pages/panier/paiement/validation_controller.dart';
import 'package:africulture_mobile/componsants/pages/panier/panier_controller.dart';
import 'package:africulture_mobile/componsants/widgets/carte_panier.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
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
  ValidationController validationController = Get.find();
  //
  double conte = Get.width / 4;
  int i = 1;
  //
  @override
  void initState() {
    //
    validationController.precommande(panierController.listeProduit.value);
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => validationController.valeurValidationPrecommande.value
          ? Column(
              children: [
                validationController.validationPrecommande['passe']
                    ? Expanded(
                        flex: 1,
                        child: ListView(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          children: List.generate(
                            panierController.listeProduit.length,
                            (index) {
                              return CartePanier(
                                index,
                                false,
                                panierController.listeProduit[index]
                                    ['quantite'],
                              );
                            },
                          ),
                        ),
                      )
                    : Expanded(
                        flex: 1,
                        child: SingleChildScrollView(
                          child: Column(
                            //
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                validationController
                                    .validationPrecommande['justification']
                                    .length,
                                (index) => ListTile(
                                      leading: Icon(Icons.error),
                                      title: Text(
                                          "${validationController.validationPrecommande['justification'][index]}"),
                                    )),
                          ),
                        ),
                      ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Obx(
                    () => Row(
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
                        validationController.validationPrecommande['passe']
                            ? TextButton(
                                onPressed: () {
                                  if (i <= 2) {
                                    print("Avant: $i");
                                    i++;
                                    print("Après: $i");
                                    commanderController.avancement.value =
                                        commanderController.avancement.value +
                                            conte;
                                    commanderController.titre.value = "Paiment";
                                    widget.pageController.nextPage(
                                      duration: Duration(seconds: 1),
                                      curve: Curves.ease,
                                    );
                                  }
                                  //
                                },
                                child: const Text("Suivant"),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                )
              ],
            )
          : Container(
              height: Get.height,
              width: Get.width,
              child: Center(
                child: Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.grey.shade200,
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        color: Colors.green,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Card(
                            elevation: 1,
                            child: Container(
                              height: 100,
                              width: 100,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  color: Colors.amber,
                                  child: Card(
                                    elevation: 1,
                                    child: Container(
                                      height: 20,
                                      width: 250,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  color: Colors.amber,
                                  child: Card(
                                    elevation: 1,
                                    child: Container(
                                      height: 20,
                                      width: 250,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  color: Colors.amber,
                                  child: Card(
                                    elevation: 1,
                                    child: Container(
                                      height: 20,
                                      width: 250,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Card(
                            elevation: 1,
                            child: Container(
                              height: 100,
                              width: 100,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    color: Colors.amber,
                                    child: Card(
                                      elevation: 1,
                                      child: Container(
                                        height: 20,
                                        width: 250,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    color: Colors.amber,
                                    child: Card(
                                      elevation: 1,
                                      child: Container(
                                        height: 20,
                                        width: 250,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    color: Colors.amber,
                                    child: Card(
                                      elevation: 1,
                                      child: Container(
                                        height: 20,
                                        width: 250,
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Card(
                            elevation: 1,
                            child: Container(
                              height: 100,
                              width: 100,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    color: Colors.amber,
                                    child: Card(
                                      elevation: 1,
                                      child: Container(
                                        height: 20,
                                        width: 250,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    color: Colors.amber,
                                    child: Card(
                                      elevation: 1,
                                      child: Container(
                                        height: 20,
                                        width: 250,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    color: Colors.amber,
                                    child: Card(
                                      elevation: 1,
                                      child: Container(
                                        height: 20,
                                        width: 250,
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Card(
                            elevation: 1,
                            child: Container(
                              height: 100,
                              width: 100,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    color: Colors.amber,
                                    child: Card(
                                      elevation: 1,
                                      child: Container(
                                        height: 20,
                                        width: 250,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    color: Colors.amber,
                                    child: Card(
                                      elevation: 1,
                                      child: Container(
                                        height: 20,
                                        width: 250,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    color: Colors.amber,
                                    child: Card(
                                      elevation: 1,
                                      child: Container(
                                        height: 20,
                                        width: 250,
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
