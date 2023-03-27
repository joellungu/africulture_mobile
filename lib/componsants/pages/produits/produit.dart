import 'package:africulture_mobile/componsants/pages/panier/panier.dart';
import 'package:africulture_mobile/componsants/pages/panier/panier_controller.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import '../../contrôler/accueil_controller.dart';
import 'produit_controller.dart';

class Produit extends GetView<ProduitController> {
  Map<String, dynamic> p = {};
  //
  TextEditingController quantite = TextEditingController(text: "1");
  PanierController panierController = Get.find();
  //
  RxBool fav = true.obs;
  RxDouble ann = RxDouble(40);
  Produit(this.p) {
    print("produit: ${p['node']}");
  }
  //
  AccueilController accueilController = Get.find();
  //
  ProduitController produitController = Get.find();
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
            expandedHeight: 250.0,
            actions: [
              Obx(
                () => IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                  color: fav.value ? Colors.red.shade700 : Colors.grey,
                ),
              ),
              // PopupMenuButton(
              //   icon: Icon(
              //     Icons.more_vert_outlined,
              //     color: Colors.black,
              //   ),
              //   itemBuilder: (context) => [
              //     PopupMenuItem(
              //       child: Text("First"),
              //       value: 1,
              //     ),
              //     PopupMenuItem(
              //       child: Text("Second"),
              //       value: 2,
              //     )
              //   ],
              // )
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Demo'),
              background: Image.network(
                "${p['node']['image']['sourceUrl']}",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(5),
              height: 70,
              alignment: Alignment.center,
              // child: ListView(
              //   scrollDirection: Axis.horizontal,
              //   children: List.generate(
              //     nombreImages.value,
              //     (index) => Card(
              //       elevation: 0,
              //       child: InkWell(
              //         onTap: () {
              //           lienImage.value = "produit/image/${p['id']}/img$index";
              //         },
              //         child: Container(
              //           width: 50,
              //           height: 50,
              //           child: Image.network(
              //             "${Utils.url}/produit/image/${p['id']}/img$index",
              //             fit: BoxFit.fill,
              //           ),
              //           //color: Colors.yellowAccent,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
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
                    text: "${p['node']['name']}\n",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    children: [
                      TextSpan(
                        text: "Prix: ${p['node']['price']} \$\n",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: p['tva'] != null ? 'TVA: ' : '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: p['tva'] != null ? '${p['tva']}\n' : '',
                        style: const TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
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
                        ),
                      ),
                      // const TextSpan(
                      //   text: 'boutique',
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontWeight: FontWeight.normal,
                      //     fontSize: 15,
                      //   ),
                      // ),
                      // TextSpan(
                      //   text:
                      //       ': ${p['nomBoutique'] == 'AfricCulture' ? 'SURE' : p['nomBoutique']}' +
                      //           '\n',
                      //   style: const TextStyle(
                      //     color: Colors.blueGrey,
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 20,
                      //   ),
                      // ),
                      // TextSpan(
                      //   text: p['poidsUnitaire'] != null ? 'poid:'.tr : '',
                      //   style: TextStyle(
                      //     color: Colors.grey,
                      //     fontWeight: FontWeight.normal,
                      //     fontSize: 15,
                      //   ),
                      // ),
                      // TextSpan(
                      //   text: p['poidsUnitaire'] != null
                      //       ? " ${p['poidsUnitaire']} ${p['uniteP']}\n"
                      //       : ' \n',
                      //   style: TextStyle(
                      //     color: Colors.green.shade700,
                      //     fontWeight: FontWeight.normal,
                      //     fontSize: 15,
                      //   ),
                      // ),
                      TextSpan(
                        text: "disponible:".tr,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: p['stock'] != 0
                            ? ': en_stock'.tr + ' (${p['stock']})'
                            : ': plus_en_stock'.tr,
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
                      Expanded(
                        flex: 7,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "selection_quantite".tr,
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
                            p["quantite"] = int.parse(quantite.text);
                            panierController.listeProduit.value.add(p);
                            //
                            ann.value = 70;
                            //
                            Get.to(Panier());
                          },
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.yellow)),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "acheter_maintenant".tr,
                              style: const TextStyle(
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
                            //
                            p["quantite"] = int.parse(quantite.text);
                            panierController.listeProduit.value.add(p);
                            print(p);
                            //
                            ann.value = 70;
                          },
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.grey.shade200)),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "ajouter_panier".tr,
                              style: const TextStyle(
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
                    header: Text("description".tr),
                    collapsed: Text(
                      "${p['node']['description']}",
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Html(
                      data: """${p['node']['description']}""",
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
                                height: MediaQuery.of(context).size.height / 2.5,
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
            Get.to(Panier());
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
              ),
            ),
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
    );
  }

  get_set_fav(Map p) async {
    String requete = """mutation MyMutation2 {
  __typename
  addToWishlist(input: {clientMutationId: "dXNlcjox", productId: 332}) {
    added
    clientMutationId
    productId
    error
    wishlistProductIds
  }
}""";
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
