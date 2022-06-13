import 'package:africulture_mobile/utile/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/panier/panier_controller.dart';

class CartePanier extends StatelessWidget {
  RxInt v = 1.obs;
  int index;
  bool l = true;
  RxDouble prix = RxDouble(0); //
  RxDouble resultat = RxDouble(0);

  PanierController panierController = Get.find();

  CartePanier(this.index, this.l, int quant) {
    prix = RxDouble(panierController.listeProduit[index]['prix']);
    resultat = RxDouble(panierController.listeProduit[index]['prix']);
    v.value = quant;
  }

  /*
  "id": "${p['id']}",
  "image":
      "produit/image/${p['id']}/img0",
  "devise": "${p['deviseMar']}",
  "prix": "${p['prixMar']}",
  "ch": quantite,
  */

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                //color: Colors.transparent,
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      //
                      panierController.listeProduit.removeLast();
                    },
                    icon: Icon(Icons.remove_circle_outline),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Image.network(
                    "${Utils.url}/${panierController.listeProduit[index]['image']}"),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                //color: Colors.greenAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${panierController.listeProduit[index]['titre']}",
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => Text(
                            "${panierController.listeProduit[index]['devise']} ${resultat.value}"),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    l
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: 30,
                              width: 50,
                              alignment: Alignment.centerLeft,
                              child: DropdownButtonHideUnderline(
                                  child: Obx(
                                () => DropdownButton(
                                  value: v.value,
                                  items: List.generate(
                                    11,
                                    (index) => DropdownMenuItem(
                                      child: Text("${index + 1}"),
                                      value: index + 1,
                                    ),
                                  ),
                                  onChanged: (Object? value) {
                                    v.value = value as int;
                                    resultat.value = prix.value * v.value;
                                    panierController.listeProduit[index]
                                        ['quantite'] = v.value;
                                    panierController.listeProduit[index]
                                        ['prix'] = resultat.value;
                                  },
                                ),
                              )),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300)),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
