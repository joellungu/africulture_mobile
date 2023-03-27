import 'dart:ffi';

import 'package:africulture_mobile/componsants/pages/panier/adresse/adresse_controller.dart';
import 'package:africulture_mobile/componsants/pages/profil/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';
import '../../widgets/carte_panier.dart';
import 'historique_commande_controller.dart';

class HistoriqueCommande extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HistoriqueCommande();
  }
}

class _HistoriqueCommande extends State<HistoriqueCommande> {
  HistoriqueCommandeController historiqueCommandeController = Get.find();
  ProfileControllers profileController = Get.find();
  AdresseController adresseController = Get.find();
  @override
  void initState() {
    //
    historiqueCommandeController.commandeDuMois("code",
        "${profileController.infosPerso['numero']}", "${DateTime.now()}");
    //
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historique de commandes"),
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
      ),
      body: Obx(
        () => Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: List.generate(
                historiqueCommandeController.listeHistoriqueCommandes.length,
                (index) {
              String date = historiqueCommandeController
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
                  Get.to(DetailsCommande(historiqueCommandeController
                      .listeHistoriqueCommandes[index]));
                },
                leading: Icon(Icons.shopping_basket),
                title: Text(
                    "${historiqueCommandeController.listeHistoriqueCommandes[index]['date']}"),
                subtitle: Text(
                    "${historiqueCommandeController.listeHistoriqueCommandes[index]['code']}"),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class DetailsCommande extends StatefulWidget {
  var c;
  DetailsCommande(this.c);
  @override
  State<StatefulWidget> createState() {
    return _DetailsCommande();
  }
}

class _DetailsCommande extends State<DetailsCommande>
    with TickerProviderStateMixin {
  List angles = ["Commande", "Adresse", "Statut"];
  late TabController controller;
  List lis = [];
  Map<String, dynamic> adresse = {};
  double vt = 20;
  HistoriqueCommandeController historiqueCommandeController = Get.find();
  RxString t1 = "a été déjà livré".obs;
  RxString t2 = "et en cours de traitement".obs;

  @override
  void initState() {
    //
    lis = widget.c['panier']['liste'];
    adresse = widget.c['adresse'];
    print("La liste du panier: $lis");
    //
    historiqueCommandeController.getCommande('${widget.c['id']}');
    //
    controller = TabController(length: angles.length, vsync: this);
    //expedier
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Détails de la commandes"),
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
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            //color: Colors.blue,
            alignment: Alignment.center,
            child: TabBar(
              isScrollable: true,
              controller: controller,
              indicatorWeight: 1,
              //indicator: BoxDecoration(),
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
              tabs: List.generate(angles.length, (index) {
                return Tab(
                  text: angles[index],
                );
              }),
            ),
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              controller: controller,
              children: [
                ListView(
                  padding: const EdgeInsets.all(20),
                  children: List.generate(lis.length, (index) {
                    var cc = lis[index];
                    return RichText(
                      text: TextSpan(
                          text: "titre: ${cc['titre']}\n",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: "quantite: ${cc['quantite']}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                            WidgetSpan(
                              child: Container(
                                width: double.infinity,
                                height: 2,
                                color: Colors.black,
                              ),
                            )
                          ]),
                    );
                  }),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: RichText(
                    text: TextSpan(
                      text: "",
                      children: [
                        TextSpan(
                          text: "commArrond: ${adresse['commArrond']}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: vt,
                          ),
                        ),
                        WidgetSpan(
                          child: Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "ville: ${adresse['ville']}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: vt,
                          ),
                        ),
                        WidgetSpan(
                          child: Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "numero: ${adresse['numero']}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: vt,
                          ),
                        ),
                        WidgetSpan(
                          child: Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "quartier: ${adresse['quartier']}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: vt,
                          ),
                        ),
                        WidgetSpan(
                          child: Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "codePays: ${adresse['codePays']}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: vt,
                          ),
                        ),
                        WidgetSpan(
                          child: Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "etatProvince: ${adresse['etatProvince']}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: vt,
                          ),
                        ),
                        WidgetSpan(
                          child: Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "avenue: ${adresse['avenue']}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: vt,
                          ),
                        ),
                        WidgetSpan(
                          child: Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "codePays: ${adresse['codePays']}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: vt,
                          ),
                        ),
                        WidgetSpan(
                          child: Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Obx(() => Center(
                        child: RichText(
                          text: TextSpan(
                            text:
                                "Votre commande ${widget.c['expedier'] ? t1 : t2}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [],
                          ),
                        ),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
