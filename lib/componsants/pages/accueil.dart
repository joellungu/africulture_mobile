import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../contrôler/accueil_controller.dart';
import 'categorie/categorie.dart';
import 'coming/coming.dart';
import 'panier/panier.dart';
import 'panier/panier_controller.dart';
import 'profil/profile.dart';
import 'recherche/recherche.dart';
//import 'vendeur/vendeur.dart';
//import 'package:get_storage/get_storage.dart';
//import 'package:hive/hive.dart';

class Accueil extends StatelessWidget {
  late AccueilController accueilController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
        appBar: AppBar(title: const Text("Pepite")
            /*Obx(
            () => accueilController.getEcranIndex() == 0
                ? Text("Accueil")
                : accueilController.getEcranIndex() == 1
                    ? Text("Historique")
                    : Text("Profil"),
          ),
          */
            ),
            */
      body: Obx(
        (() => accueilController.getEcranIndex() == 0
            ? Coming()
            : accueilController.getEcranIndex() == 1
                ? Categories(
                    //key: UniqueKey(),
                    )
                : accueilController.getEcranIndex() == 2
                    ? Recherche()
                    : accueilController.getEcranIndex() == 3
                        ? Panier()
                        //: accueilController.getEcranIndex() == 4
                        //  ? Vendeur()
                        : Profil()),
      ),
      bottomNavigationBar: BtmNavBar(),
    );
  }
}

class BtmNavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BtnNavBar();
  }
}

class _BtnNavBar extends State<BtmNavBar> {
  int v = 0;
  //
  late AccueilController accueilController;
  PanierController panierController = Get.find();
  //
  //= Get.put(()=> AccueilController());
  @override
  void initState() {
    accueilController = Get.find();
    //
    load();
    //
    super.initState();
  }

  load() async {
    //var box = await Hive.box('utilisateur');
    //final box = GetStorage();
    //print("----------------: ${box.read("utilisateur")}");
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        onTap: (i) {
          setState(() {
            //v = i;
            accueilController.setEcranIndex(i);
          });
        },
        currentIndex: accueilController.ecranIndex.value,
        selectedItemColor: Colors.yellow.shade700,
        unselectedItemColor: Colors.black,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: "__"),
          const BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "__"),
          const BottomNavigationBarItem(icon: Icon(Icons.search), label: "__"),
          BottomNavigationBarItem(icon: indexPanier()!, label: "__"),
          //BottomNavigationBarItem(icon: indexVendeur()!, label: "__"),
          const BottomNavigationBarItem(icon: Icon(Icons.person), label: "__"),
        ],
      ),
    );
  }

  Widget? indexPanier() {
    return Container(
      height: 40,
      width: 40,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(),
            child: Align(
              alignment: Alignment.center,
              child: Icon(Icons.shopping_cart),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3, right: 0),
            child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                      color: Colors.red.shade700,
                      borderRadius: BorderRadius.circular(5)),
                  alignment: Alignment.center,
                  child: Text(
                    "${panierController.listeProduit.value.length}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }

  //
  Widget? indexVendeur() {
    return Container(
      height: 40,
      width: 40,
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(),
            child: Align(
              alignment: Alignment.center,
              child: Icon(Icons.add_business),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 7),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: Colors.red.shade700,
                    borderRadius: BorderRadius.circular(5)),
                alignment: Alignment.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
