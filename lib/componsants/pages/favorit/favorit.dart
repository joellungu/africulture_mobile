import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../panier/commander/commander.dart';
import 'favorit_controller.dart';

class Favorit extends StatelessWidget {
  FavoritController favoritController = Get.find();
  //
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vos favorits"),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Colors.yellow.shade700, Colors.black],
            ),
          ),
        ),
      ),
      body: Obx(
        () => ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                  favoritController.listeFavorits.value.length, (index) {
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
                                  favoritController.listeFavorits.removeLast();
                                },
                                icon: Icon(Icons.remove_circle_outline),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: Colors.grey.shade100,
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
                                    "Sleep Double Split Maxi Dress",
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("\$120.50"),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (favoritController.listeFavorits.value.length == 0) {
                    Get.snackbar("Panier", "Le Panier est vide !");
                  } else {
                    Get.to(Commander());
                  }
                },
                child: Text("Passer la commander"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
