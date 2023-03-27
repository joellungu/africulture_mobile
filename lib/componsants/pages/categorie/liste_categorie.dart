import 'dart:convert';

import 'package:africulture_mobile/componsants/pages/produits/produit.dart';
import 'package:africulture_mobile/componsants/widgets/carte_produit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utile/utils.dart';
import 'categorie_controller.dart';

class ListageCategorie extends StatefulWidget {
  String? cat;
  int id;
  ListageCategorie(this.cat, this.id);
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

    //
    Response rep = await demandeurConnexion.getProduitCategorie(widget.id);
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
                  //Get.to(() => Produit());
                },
                child: CarteProduite(l[index], true)),
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
