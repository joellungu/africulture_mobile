import 'dart:async';
import 'dart:convert';
import 'package:africulture_mobile/componsants/pages/categorie/categorie_controller.dart';
import 'package:africulture_mobile/utile/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../pages/produits/produit.dart';

class CarteProduite extends StatefulWidget {
  //bool taille = true;
  bool taille = true;
  Map<String, dynamic> p = {};
  CarteProduite(this.p, this.taille);

  @override
  State<StatefulWidget> createState() {
    return _CarteProduite();
  }
}

class _CarteProduite extends State<CarteProduite> {
  //bool annimation = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //
    //Timer(const Duration(seconds: 2), () {
    //setState(() {
    //  annimation = false;
    //});
    //});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: InkWell(
        onTap: () {
          Get.to(() => Produit(widget.p));
          //print("cool");
        },
        child: Container(
          //color: Colors.green.shade200,
          height: 2.2,
          width: widget.taille
              ? MediaQuery.of(context).size.width / 2
              : MediaQuery.of(context).size.width / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  child: Image.network(
                    "${Utils.url}/produit/image/${widget.p['id']}/img0",
                    fit: BoxFit.cover,
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
                          "${widget.p['titreMar']}",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.p['deviseMar']} ${widget.p['prixMar']}",
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
                            widget.p['stockMar'] != 0
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
