import 'package:africulture_mobile/componsants/pages/panier/panier.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../contrôler/accueil_controller.dart';
import '../../widgets/carte_produit.dart';
import '../favorit/favorit_controller.dart';
import '../panier/panier_controller.dart';
import 'produit_controller.dart';

class Produit extends StatelessWidget {
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
  RxDouble ann = 40.0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
          child: produitController.load.value == 1
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
                            () => Image.asset(
                              "${lienImage.value}",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 70,
                          alignment: Alignment.center,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              5,
                              (index) => Card(
                                elevation: 0,
                                child: InkWell(
                                  onTap: () {
                                    lienImage.value =
                                        "assets/img (${index + 1}).jpg";
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.asset(
                                      "assets/img (${index + 1}).jpg",
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
                                text: "T-SHIRT NEXT Stop (Cool Break)...\n",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                                children: [
                                  TextSpan(
                                    text: "\$60.55\n",
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
                                    text: "\nCode: ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "INS16-1\n",
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
                                    text: "En Stock (64826)",
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
                      SliverToBoxAdapter(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 200,
                          //width: 200,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Taille",
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
                                    taileW("L"),
                                    taileW("M"),
                                    taileW("S"),
                                    taileW("XL"),
                                  ]),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Images",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                //scrollDirection: Axis.horizontal,
                                children: List.generate(
                                    5,
                                    (index) => Card(
                                          elevation: 0,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            color: Colors.yellowAccent,
                                          ),
                                        )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                            padding: EdgeInsets.all(5),
                            height: 200,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Expanded(
                                      flex: 4,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Sélectionnez la quantité:",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                panierController
                                                    .listeProduit.value
                                                    .remove("value");
                                              },
                                              icon: Icon(Icons.arrow_back_ios)),
                                          Container(
                                            alignment: Alignment.center,
                                            child: Obx(() => Text(
                                                "${panierController.listeProduit.length}")),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                              color: Colors.grey,
                                              width: 1,
                                            )),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              panierController
                                                  .listeProduit.value
                                                  .add("value");
                                            },
                                            icon: Icon(Icons.arrow_forward_ios),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(0),
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
                                          panierController.listeProduit
                                              .add("item");
                                          ann.value = 70;
                                        },
                                        style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(0),
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
                            )),
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
                                    "article.body...",
                                    softWrap: true,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  expanded: Text(
                                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum exercitation adipisicing. Esse et voluptate dolore labore officia sit excepteur aliqua cupidatat consectetur esse est anim qui. Dolor pariatur reprehenderit anim laborum mollit velit do veniam mollit. Id aliquip Lorem amet non ipsum et est. Labore pariatur qui ipsum elit ad deserunt dolore labore ex sit non sit nisi Lorem.",
                                    softWrap: true,
                                  ),
                                  //tapHeaderToExpand: true,
                                  //hasIcon: true,
                                ),
                              ],
                            )),
                      ),
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
                                    (index) => CarteProduite(false, index + 3),
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
                            borderRadius:
                                BorderRadius.circular(ann.value / 1.5),
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
                            borderRadius:
                                BorderRadius.circular(ann.value / 1.5),
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
            //
            return Future.value(true);
          }),
    );
  }

  Widget taileW(String taille) {
    return Card(
      elevation: 0,
      child: Container(
        width: 40,
        height: 40,
        child: Text(
          taille,
          style: TextStyle(color: Colors.black),
        ),
        alignment: Alignment.center,
        color: Colors.yellowAccent,
      ),
    );
  }
}
