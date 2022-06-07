import 'dart:convert';

import 'package:africulture_mobile/componsants/pages/produits/produit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utile/utils.dart';
import 'categorie_controller.dart';

class ListageCategorie extends StatefulWidget {
  String? cat;
  ListageCategorie(this.cat);
  @override
  State<StatefulWidget> createState() {
    return _ListageCategorie();
  }
}

class _ListageCategorie extends State<ListageCategorie> {
  Future<Widget> getProduitCategorie(String categorie) async {
    DemandeurConnexion demandeurConnexion = DemandeurConnexion();
    //
    print('___________$categorie _______________');
    //
    CategorieController categorieController = Get.find();
    //
    Response rep = await demandeurConnexion.getProduitCategorie(categorie);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      List l = jsonDecode(rep.bodyString!);
      print(l);
      return GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 0.5,
        children: List.generate(
          l.length,
          (index) => Card(
            elevation: 0,
            child: InkWell(
              onTap: () {
                Get.to(() => Produit());
              },
              child: Container(
                //color: Colors.green.shade200,
                height: 2.2,
                width: MediaQuery.of(context).size.width / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(flex: 6, child: LoadImage("${l[index]['id']}")),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.white,
                        child: Text.rich(
                          TextSpan(
                            text: "${l[index]['titreMar']}\n",
                            children: [
                              TextSpan(
                                text:
                                    "${l[index]['deviseMar']} ${l[index]['prixMar']}\n",
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: "En Stock",
                                style: TextStyle(
                                  color: Colors.green.shade700,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 11,
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
                              ))
                            ],
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
    } else {
      return Container(
        alignment: Alignment.center,
        child: const Icon(Icons.hourglass_empty),
      );
    }
    //
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getProduitCategorie(widget.cat!),
      builder: (context, t) {
        if (t.hasData) {
          return t.data as Widget;
        } else if (t.hasError) {
          return Icon(Icons.error_outline);
        }
        return Container(
          //color: Colors.green.shade200,
          height: 2.2,
          width: MediaQuery.of(context).size.width / 3,
          child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey.shade200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 200,
                  color: Colors.grey.shade100,
                ),
                Row(
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
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 100,
                        width: 500,
                        color: Colors.grey.shade100,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class LoadImage extends StatefulWidget {
  String? id;
  LoadImage(this.id);
  @override
  State<StatefulWidget> createState() {
    return _LoadImage();
  }
}

class _LoadImage extends State<LoadImage> {
  Future<Widget> getProduitImage() async {
    DemandeurConnexion demandeurConnexion = DemandeurConnexion();
    //
    //print('___________$categorie _______________');
    //
    CategorieController categorieController = Get.find();
    //
    //DemandeurConnexion sc = DemandeurConnexion();
    //
    Response rep =
        await await demandeurConnexion.getListeImages("${widget.id}");
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      categorieController.images.value = jsonDecode(rep.bodyString!);
      return Container(
        child: categorieController.images.value.isNotEmpty
            ? Image.network(
                "${Utils.url}/produit/image/${categorieController.images[0]}",
                fit: BoxFit.cover,
              )
            : const Icon(Icons.food_bank),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getProduitImage(),
        builder: (context, t) {
          if (t.hasData) {
            return t.data as Widget;
          } else if (t.hasError) {
            return Icon(Icons.error_outline);
          }
          return Container(
            //color: Colors.green.shade200,
            height: 2.2,
            width: MediaQuery.of(context).size.width / 3,
            child: Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.grey.shade200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: 200,
                    color: Colors.grey.shade100,
                  ),
                  Row(
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
                      Expanded(
                        flex: 4,
                        child: Container(
                          height: 100,
                          width: 500,
                          color: Colors.grey.shade100,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
