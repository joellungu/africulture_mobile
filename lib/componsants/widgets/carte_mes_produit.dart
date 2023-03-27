//import 'package:africulture_mobile/componsants/pages/vendeur/mesproduits/mesproduitdetails.dart';
import 'package:africulture_mobile/utile/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/produits/produit.dart';

class CarteMesProduite extends StatefulWidget {
  //bool taille = true;
  bool taille = true;
  Map<String, dynamic> p = {};
  CarteMesProduite(this.p, this.taille);

  @override
  State<StatefulWidget> createState() {
    return _CarteMesProduite();
  }
}

class _CarteMesProduite extends State<CarteMesProduite> {
  //bool annimation = true;

  @override
  void initState() {
    //
    super.initState();
    //
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: InkWell(
        onTap: () {
          //Get.to(() => MesProduitDetails(widget.p));
        },
        child: Container(
          //color: Colors.green.shade200,
          height: 2.2,
          width: MediaQuery.of(context).size.width / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  child: Image.network(
                    "${Utils.url}/produit/image/${widget.p['id']}/img0",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${widget.p['titre']}",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.p['devise']} ${widget.p['prix']}",
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.p['stock'] != 0
                                ? 'En Stock'
                                : 'Plus en stock',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.normal,
                              fontSize: 11,
                            ),
                          )
                        ],
                      ),
                      Row(
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
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
