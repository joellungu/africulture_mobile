import 'dart:ffi';

import 'package:africulture_mobile/componsants/pages/panier/adresse/adresse_controller.dart';
import 'package:africulture_mobile/componsants/pages/profil/profile_controller.dart';
import 'package:africulture_mobile/componsants/pages/vendeur/vendeur_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';

import 'commande_vendeur_controller.dart';

class CommandeVendeur extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CommandeVendeur();
  }
}

class _CommandeVendeur extends State<CommandeVendeur> {
  CommandeVendeurController commandeVendeurController = Get.find();
  ProfileControllers profileController = Get.find();
  AdresseController adresseController = Get.find();
  VendeurController vendeurController = Get.find();
  //
  @override
  void initState() {
    //
    commandeVendeurController.commandeDuMois(
        "${vendeurController.infosEnt.value['id']}", "${DateTime.now()}");
    //
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historique de commandes"),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
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
        () => Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: List.generate(
                commandeVendeurController.listeHistoriqueCommandes.length,
                (index) {
              String date = commandeVendeurController
                  .listeHistoriqueCommandes[index]["date"];
              //String date = v["date"];
              List<String> ds = date.split(" ");
              String d1 = ds[0].split("-")[0];
              String d2 = ds[0].split("-")[1];
              String d3 = ds[0].split("-")[2];
              DateTime dd = DateTime.parse(date);
              //print(d1);
              //print(d2);
              //print(d3);

              return ListTile(
                onTap: () {
                  //Get.to(DetailsCommande(commandeVendeurController
                  //  .listeHistoriqueCommandes[index]));
                },
                leading: Icon(Icons.shopping_basket),
                title: Text(
                    "${commandeVendeurController.listeHistoriqueCommandes[index]['titre']}"),
                subtitle: Text(
                    "Quantite: ${commandeVendeurController.listeHistoriqueCommandes[index]['quantite']}\n code: ${commandeVendeurController.listeHistoriqueCommandes[index]['code']}"),
                trailing: commandeVendeurController
                            .listeHistoriqueCommandes[index]['stRecu'] ??
                        false
                    ? Icon(
                        Icons.check,
                        color: Colors.green,
                      )
                    : Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
