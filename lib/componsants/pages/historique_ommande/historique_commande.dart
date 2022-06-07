import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/carte_panier.dart';
import 'historique_commande_controller.dart';

class HistoriqueCommande extends StatelessWidget {
  HistoriqueCommandeController historiqueCommandeController = Get.find();

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historique de commandes"),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
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
      body: Obx(
        () => ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                  historiqueCommandeController
                      .listeHistoriqueCommandes.value.length, (index) {
                return CartePanier();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
