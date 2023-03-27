import 'package:africulture_mobile/utile/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/panier/panier_controller.dart';

class CartePanier extends StatefulWidget {
  RxInt v = 1.obs;
  int index;
  bool l = true;
  RxDouble prix = RxDouble(0); //
  RxDouble resultat = RxDouble(0);
  int quant;

  CartePanier(this.index, this.l, this.quant);

  @override
  State<StatefulWidget> createState() {
    return _CartePanier();
  }
}

class _CartePanier extends State<CartePanier> {
  PanierController panierController = Get.find();
  //
  TextEditingController quantite = TextEditingController(text: "1");
  @override
  void initState() {
    widget.prix = RxDouble(double.parse(
        panierController.listeProduit[widget.index]['node']['price']));
    widget.resultat = RxDouble(double.parse(
        panierController.listeProduit[widget.index]['node']['price']));
    widget.v.value = widget.quant;
    widget.resultat.value = widget.prix.value * widget.v.value;
    //
    quantite = TextEditingController(text: "${widget.quant}");
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                //color: Colors.transparent,
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      //
                      panierController.listeProduit.removeLast();
                    },
                    icon: Icon(Icons.remove_circle_outline),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Image.network(
                    "${panierController.listeProduit[widget.index]['node']['image']['sourceUrl']}"),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                //color: Colors.greenAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${panierController.listeProduit[widget.index]['node']['name']}",
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(() {
                        print("valeur: ${widget.resultat.value}");
                        return Text("\$ ${widget.resultat.value}");
                      }),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    widget.l
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: 40,
                              width: 100,
                              alignment: Alignment.centerLeft,
                              child: TextField(
                                controller: quantite,
                                textAlignVertical: TextAlignVertical.center,
                                onChanged: (t) {
                                  try {
                                    //
                                    print(
                                        "le 1 resultat de p: ${widget.prix.value} * quantite: ${widget.v.value} = ${widget.resultat.value}");
                                    //
                                    panierController.listeProduit[widget.index]
                                        ['quantite'] = int.parse(t);
                                    //
                                    panierController.listeProduit[widget.index]
                                            ['prix'] =
                                        widget.prix.value * int.parse(t);
                                    //
                                    widget.resultat.value =
                                        widget.prix.value * int.parse(t);
                                    //
                                  } catch (e) {
                                    //
                                    panierController.listeProduit[widget.index]
                                        ['quantite'] = 1;
                                    //
                                    panierController.listeProduit[widget.index]
                                        ['prix'] = widget.prix.value * 1;
                                    print("erreur: $e");
                                  }
                                },
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
                              /*
                              DropdownButtonHideUnderline(
                                  child: Obx(
                                () => DropdownButton(
                                  value: widget.v.value,
                                  items: List.generate(
                                    11,
                                    (index) => DropdownMenuItem(
                                      child: Text("${index + 1}"),
                                      value: index + 1,
                                    ),
                                  ),
                                  onChanged: (Object? value) {
                                    widget.v.value = value as int;
                                    widget.resultat.value =
                                        widget.prix.value * widget.v.value;
                                    print(
                                        "le 1 resultat de p: ${widget.prix.value} * quantite: ${widget.v.value} = ${widget.resultat.value}");
                                    panierController.listeProduit[widget.index]
                                        ['quantite'] = widget.v.value;
                                    panierController.listeProduit[widget.index]
                                        ['prix'] = widget.resultat.value;
                                    print(
                                        "prix: ${panierController.listeProduit[widget.index]['prix']}, quantite: ${panierController.listeProduit[widget.index]['quantite']}");
                                  },
                                ),
                              ),),
                              
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),),*/
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
