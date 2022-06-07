import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/carte_panier.dart';
import 'commander/commander.dart';
import 'panier_controller.dart';

class Pagner extends StatelessWidget {
  PanierController panierController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mon panier",
        ),
        backgroundColor: Colors.white,
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
          Container(
            height: 50,
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                      text: "TOTAL", children: [TextSpan(text: "18 Articles")]),
                ),
                TextButton(
                  onPressed: () {
                    panierController.listeProduit.clear();
                  },
                  child: Text(
                    "VIDER LE PANIER",
                    style: TextStyle(
                      color: Colors.red.shade700,
                    ),
                  ),
                )
              ],
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
                      return CartePanier();
                    }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (panierController.listeProduit.value.length == 0) {
                          Get.snackbar("Panier", "Le Panier est vide !");
                        } else {
                          Get.to(Commander());
                        }
                      },
                      child: Text("Passer la commander"),
                    ),
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
