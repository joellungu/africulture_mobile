import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../pages/produits/produit.dart';

class CarteProduite extends StatefulWidget {
  bool taille = true;
  int t = 0;
  CarteProduite(this.taille, this.t) {}

  @override
  State<StatefulWidget> createState() {
    return _CarteProduite();
  }
}

class _CarteProduite extends State<CarteProduite> {
  bool annimation = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //
    Timer(Duration(seconds: 2), () {
      setState(() {
        annimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return annimation
        ? Card(
            elevation: 0,
            child: Container(
                //color: Colors.green.shade200,
                height: 2.2,
                width: widget.taille
                    ? MediaQuery.of(context).size.width / 2
                    : MediaQuery.of(context).size.width / 3,
                child: Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.grey.shade200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 100,
                        width: 500,
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
                )),
          )
        : Card(
            elevation: 0,
            child: InkWell(
              onTap: () {
                Get.to(() => Produit());
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
                        child: Image.asset(
                          "assets/prod (${widget.t + 1}).jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.white,
                        child: Text.rich(
                          TextSpan(
                            text: "T-SHIRT NEXT Stop (Cool Break)...\n",
                            children: [
                              TextSpan(
                                text: "\$60.55\n",
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
          );
  }
}
