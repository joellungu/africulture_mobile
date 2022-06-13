import 'package:africulture_mobile/componsants/pages/panier/adresse/adresse_controller.dart';
import 'package:africulture_mobile/componsants/pages/panier/expedition/expedition_controller.dart';
import 'package:africulture_mobile/componsants/pages/panier/panier_controller.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../commander/commander_controller.dart';

enum BestTutorSite { STANDARD, EXPRESS }

class Expedition extends StatefulWidget {
  PageController pageController = PageController();
  //
  List<String> titres = [];
  //
  Expedition(this.pageController, this.titres);

  @override
  State<StatefulWidget> createState() {
    return _Expedition();
  }
}

class _Expedition extends State<Expedition> {
  _Expedition() {
    panierController.listeProduit.forEach((element) {
      tc.value = tc.value + (element['prix'] * element['quantite']);
      //tc.value = tc.value + (element['prix'] * element['quantite']);
    });
    //
    tcc = tc.value;
    //
    tc.value = tc.value + tva;
  }
  //
  BestTutorSite _site = BestTutorSite.STANDARD;
  //
  PanierController panierController = Get.find();
  CommanderController commanderController = Get.find();
  AdresseController adresseController = Get.find();
  ExpeditionController expeditionController = Get.find();
  //
  double tva = 10;
  RxDouble tc = 0.0.obs;
  double tcc = 0.0;
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
          child: ListView(
            padding: const EdgeInsets.all(10),
            controller: ScrollController(),
            children: [
              Obx(
                () => Text.rich(
                  TextSpan(
                    text: "TOTAL DE COMMANDE\n",
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                    children: [
                      TextSpan(
                        text: "\$ $tcc\n",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                      WidgetSpan(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star_border_outlined,
                            size: 15,
                            color: Colors.yellow.shade700,
                          ),
                          Icon(
                            Icons.star_border_outlined,
                            size: 15,
                            color: Colors.yellow.shade700,
                          ),
                          Icon(
                            Icons.star_border_outlined,
                            size: 15,
                            color: Colors.yellow.shade700,
                          ),
                          Icon(
                            Icons.star_border_outlined,
                            size: 15,
                            color: Colors.yellow.shade700,
                          ),
                          Icon(
                            Icons.star_border_outlined,
                            size: 15,
                            color: Colors.yellow.shade700,
                          )
                        ],
                      )),
                      TextSpan(
                        text: '',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: 'TOTAL GENERAL \n',
                        style: TextStyle(
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: "\$ ${tc.value} \n",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: 'Pays de destination \n',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: "***${adresseController.pays.value}***\n",
                        style: TextStyle(
                          //color: Colors.grey.shade700,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: 'Frais de transfère\n',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      TextSpan(
                        text: "\$ $tva\n",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Type d'expedition"),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ListTile(
                      title: const Text(
                        'STANDARD',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Radio(
                        value: BestTutorSite.STANDARD,
                        groupValue: _site,
                        onChanged: (BestTutorSite? value) {
                          setState(() {
                            _site = value!;
                            tc.value = tc.value / 1.7;
                            expeditionController.express.value = false;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        'EXPRESS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Radio(
                        value: BestTutorSite.EXPRESS,
                        groupValue: _site,
                        onChanged: (BestTutorSite? value) {
                          setState(() {
                            _site = value!;
                            tc.value = tc.value * 1.7;
                            expeditionController.express.value = true;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )
              /*
              ExpandablePanel(
                header: Text(
                  "Expresse",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                collapsed: Text(
                  "",
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Container(
                  height: Get.height / 2,
                  //width: Get.width / 1.5,
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    childAspectRatio: 1,
                    controller: ScrollController(),
                    children: List.generate(
                      3,
                      (index) => Card(
                        elevation: 0,
                        child: InkWell(
                            onTap: () {
                              //Get.to(() => Produit());
                            },
                            child: ChoixExp("DHL type $index")),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ExpandablePanel(
                header: Text(
                  "Standard",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                collapsed: Text(
                  "",
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Text(
                  "",
                  softWrap: true,
                ),
              ),
            */
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
                    commanderController.titre.value = "Adresse";
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
                    commanderController.titre.value = "Commandes";
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

class ChoixExp extends StatelessWidget {
  String titre;
  //
  ExpeditionController produitController = Get.find();
  //
  ChoixExp(this.titre);
  //
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //
        produitController.choix.value = titre;
      },
      child: Obx(
        () => Card(
          elevation: 0,
          //color: produitController.choix.value == titre
          //  ? Colors.yellow.shade700
          //  : Colors.grey.shade200,
          child: Container(
            width: 40,
            height: 40,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      titre,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                produitController.choix.value == titre
                    ? Padding(
                        padding: EdgeInsets.all(0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Opacity(
                            opacity: 0.3,
                            child: Container(
                              color: Colors.white,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.check,
                                color: Colors.black,
                                size: 100,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            alignment: Alignment.center,
            //color: produitController.choix.value == titre
            //  ? Colors.yellow.shade700
            //  : Colors.grey.shade200,
          ),
        ),
      ),
    );
  }
}
