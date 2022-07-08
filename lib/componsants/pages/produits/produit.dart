import 'package:africulture_mobile/componsants/pages/panier/panier.dart';
import 'package:africulture_mobile/utile/utils.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../contrôler/accueil_controller.dart';
import '../../widgets/carte_produit.dart';
import '../favorit/favorit_controller.dart';
import '../panier/panier_controller.dart';
import 'produit_controller.dart';

class Produit extends GetView<ProduitController> {
  Map<String, dynamic> p = {};
  //
  TextEditingController quantite = TextEditingController(text: "1");
  //
  Produit(this.p) {
    print("produit: $p");
    lienImage.value = "produit/image/${p['id']}/img0";
    nombreImages.value = p['nombreImages'];
  }
  //
  AccueilController accueilController = Get.find();
  //
  ProduitController produitController = Get.find();
  //
  var selectedValue;
  PanierController panierController = Get.find();
  FavoritController favoritController = Get.find();
  RxBool fav = false.obs;
  RxString lienImage = "assets/img (1).jpg".obs;
  RxInt nombreImages = 0.obs;
  RxDouble ann = 40.0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        child: controller.load == 0
            ? Scaffold(
                body: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      pinned: true,
                      leading: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                      expandedHeight: 250.0,
                      actions: [
                        Obx(
                          () => IconButton(
                            onPressed: () {
                              if (fav.value) {
                                favoritController.listeFavorits.removeLast();
                                fav.value = false;
                              } else {
                                favoritController.listeFavorits.add({});
                                fav.value = true;
                              }
                            },
                            icon: Icon(Icons.favorite),
                            color:
                                fav.value ? Colors.red.shade700 : Colors.grey,
                          ),
                        ),
                        PopupMenuButton(
                          icon: Icon(
                            Icons.more_vert_outlined,
                            color: Colors.black,
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Text("First"),
                              value: 1,
                            ),
                            PopupMenuItem(
                              child: Text("Second"),
                              value: 2,
                            )
                          ],
                        )
                      ],
                      flexibleSpace: FlexibleSpaceBar(
                        //title: Text('Demo'),
                        background: Obx(
                          () => Image.network(
                            "${Utils.url}/${lienImage.value}",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: 70,
                        alignment: Alignment.center,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            nombreImages.value,
                            (index) => Card(
                              elevation: 0,
                              child: InkWell(
                                onTap: () {
                                  lienImage.value =
                                      "produit/image/${p['id']}/img$index";
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  child: Image.network(
                                    "${Utils.url}/produit/image/${p['id']}/img$index",
                                    fit: BoxFit.fill,
                                  ),
                                  //color: Colors.yellowAccent,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        //height: 70,
                        alignment: Alignment.center,
                        child: Container(
                          color: Colors.white,
                          child: Text.rich(
                            TextSpan(
                              text: "${p['titreMar']}\n",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                              children: [
                                TextSpan(
                                  text: "${p['deviseMar']} ${p['prixMar']}\n",
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
                                  ], //p['nomBoutique']
                                )),
                                TextSpan(
                                  text: 'boutique: ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                                TextSpan(
                                  text: '${p['nomBoutique']}',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                TextSpan(
                                  text: p['poidsUnitaire'] != null
                                      ? '\nPoids: '
                                      : '',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                                TextSpan(
                                  text: p['poidsUnitaire'] != null
                                      ? "${p['poidsUnitaire'] / 1000} ${p['uniteP']}\n"
                                      : '\n',
                                  style: TextStyle(
                                    color: Colors.green.shade700,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                                TextSpan(
                                  text: "Disponibilité: ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                                TextSpan(
                                  text: p['stockMar'] != 0
                                      ? 'En Stock (${p['stockMar']})'
                                      : 'Plus en stock',
                                  style: TextStyle(
                                    color: Colors.green.shade700,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    /*
                      SliverToBoxAdapter(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 120,
                          //width: 200,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${p['tailleUtilite']['titre']}"
                                      .toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                //scrollDirection: Axis.horizontal,
                                children: [
                                  ChoixTaille(
                                      "${p['tailleUtilite']['details']['t1']['titre']}",
                                      "${p['tailleUtilite']['details']['t1']['poid']}"),
                                  ChoixTaille(
                                      "${p['tailleUtilite']['details']['t2']['titre']}",
                                      "${p['tailleUtilite']['details']['t1']['poid']}"),
                                  ChoixTaille(
                                      "${p['tailleUtilite']['details']['t3']['titre']}",
                                      "${p['tailleUtilite']['details']['t1']['poid']}"),
                                  ChoixTaille(
                                      "${p['tailleUtilite']['details']['t4']['titre']}",
                                      "${p['tailleUtilite']['details']['t1']['poid']}"),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  produitController.pt.isEmpty
                                      ? ""
                                      : " ${produitController.pt} Kg",
                                  style: TextStyle(
                                    color: Colors.green.shade700,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      */
                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 200,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Expanded(
                                  flex: 7,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Sélectionnez la quantité:",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: TextField(
                                    controller: quantite,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 17,
                                    ),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      //
                                      if (panierController
                                          .listeProduit.isEmpty) {
                                        panierController.listeProduit.add({
                                          "id": "${p['id']}",
                                          "idfournisseur":
                                              "${p['idfournisseur']}",
                                          "titre": "${p['titreMar']}",
                                          "image":
                                              "produit/image/${p['id']}/img0",
                                          "devise": "${p['deviseMar']}",
                                          "prix": p['prixMar'],
                                          "paysOrigine": p['paysOrigine'],
                                          "codePays": p['codePays'],
                                          "quantite": int.parse(quantite.text),
                                          "poidsUnitaire": p['poidsUnitaire'],
                                          //"poidsCh": produitController.pt
                                        });
                                        //
                                        Get.to(Pagner());
                                      } else {
                                        Get.to(Pagner());
                                      }
                                      //
                                    },
                                    style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(0),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.yellow)),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "ACHETER MAINTENANT",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      panierController.listeProduit.add({
                                        "id": "${p['id']}",
                                        "idfournisseur":
                                            "${p['idfournisseur']}",
                                        "titre": "${p['titreMar']}",
                                        "image":
                                            "produit/image/${p['id']}/img0",
                                        "devise": "${p['deviseMar']}",
                                        "prix": p['prixMar'],
                                        "paysOrigine": p['paysOrigine'],
                                        "codePays": p['codePays'],
                                        "quantite": int.parse(quantite.text),
                                        "poidsUnitaire": p['poidsUnitaire'],
                                        //"poidsCh": produitController.pt
                                      });
                                      ann.value = 70;
                                    },
                                    style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(0),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.grey.shade200)),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "AJOUTER AU PANIER",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        //height: 150,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ExpandablePanel(
                              header: Text("Description"),
                              collapsed: Text(
                                "${p['descriptionMar']}",
                                softWrap: true,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              expanded: Text(
                                "${p['descriptionMar']}",
                                softWrap: true,
                              ),
                              //tapHeaderToExpand: true,
                              //hasIcon: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    /*
                      SliverToBoxAdapter(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          //height: 70,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 40,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  " Vous aimeriez peut-etre aussi",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 2,
                                //color: Colors.blueAccent,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: List.generate(
                                    5,
                                    (index) => CarteProduite({}, false),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                      */
                  ],
                ),
                floatingActionButton: Obx(
                  () => InkWell(
                    onTap: () {
                      //
                      Get.to(Pagner());
                      //
                      //Get.back();
                      //
                      //accueilController.setEcranIndex(3);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(ann.value / 1.5),
                          side: const BorderSide(
                            color: Colors.transparent,
                          )),
                      elevation: 1,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        onEnd: () {
                          ann.value = 40;
                          print("fin");
                        },
                        height: ann.value,
                        width: ann.value,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(ann.value / 1.5),
                        ),
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
                                  height: ann.value / 2,
                                  width: ann.value / 2,
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
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : produitController.load.value == 2
                ? Scaffold(
                    appBar: AppBar(
                      leading: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                : Scaffold(
                    appBar: AppBar(
                      leading: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    body: Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: Colors.grey.shade200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              height: 100,
                              width: 500,
                              color: Colors.grey.shade100,
                            ),
                          ),
                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 90,
                                  width: 100,
                                  color: Colors.grey.shade100,
                                ),
                                Container(
                                  height: 90,
                                  width: 100,
                                  color: Colors.grey.shade100,
                                ),
                                Container(
                                  height: 90,
                                  width: 100,
                                  color: Colors.grey.shade100,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 90,
                                    width: 100,
                                    color: Colors.grey.shade100,
                                  ),
                                  Container(
                                    height: 90,
                                    width: 100,
                                    color: Colors.grey.shade100,
                                  ),
                                  Container(
                                    height: 90,
                                    width: 100,
                                    color: Colors.grey.shade100,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
        onWillPop: () {
          //
          return Future.value(true);
        },
      ),
    );
  }
}

class ChoixTaille extends StatelessWidget {
  String titre;
  String pt;
  //
  ProduitController produitController = Get.find();
  //
  ChoixTaille(this.titre, this.pt);
  //
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //
        produitController.ch.value = titre;
        produitController.pt.value = pt;
      },
      child: Obx(
        () => Card(
          elevation: 0,
          color: produitController.ch.value == titre
              ? Colors.yellow.shade700
              : Colors.grey.shade200,
          child: Container(
            width: 40,
            height: 40,
            child: Text(
              titre,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            alignment: Alignment.center,
            color: produitController.ch.value == titre
                ? Colors.yellow.shade700
                : Colors.grey.shade200,
          ),
        ),
      ),
    );
  }
}
