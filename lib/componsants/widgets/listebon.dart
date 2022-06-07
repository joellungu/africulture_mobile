import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contrôler/listebon_controller.dart';

class ListeBon extends StatelessWidget {
  ListBonController listBonController = Get.put(ListBonController());
  //
  ListeBon() {
    Timer(Duration(seconds: 2), () {
      listBonController.getListe();
    });
  }
  //
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView(
        children: List.generate(listBonController.listeDeBons.length, (index) {
          return InkWell(
            onTap: () {
              //
            },
            child: Container(
              //color: Colors.blue,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(
                  //top: 10,
                  //bottom: 10,
                  ),
              height: MediaQuery.of(context).size.height / 4,
            ),
          );
        }),
      );
    });
  }
}

/*
Padding(
              padding: EdgeInsets.all(3),
              child: ListTile(
                onTap: () {
                  listBonController.removeElement(index);
                  Get.snackbar(
                      "Pioché", "Vous avez pioché le bon de Kin Marche");
                },
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.blue,
                  ),
                ),
                title: Text(
                  listBonController.listeDeBons[index]["provenance"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text.rich(
                  TextSpan(
                    text: listBonController.listeDeBons[index]["titre"],
                    children: [
                      TextSpan(
                        text: "\n",
                      ),
                      TextSpan(
                        text: listBonController.listeDeBons[index]["content"],
                      ),
                      TextSpan(
                        text: "\n",
                      ),
                      TextSpan(
                        text:
                            "Date limite ${listBonController.listeDeBons[index]["datelimite"]}",
                        style: TextStyle(
                          color: Colors.green.shade700,
                        ),
                      ),
                      TextSpan(
                        text: "\n",
                      ),
                      TextSpan(
                        text: "122/300 bons disponibles",
                        style: TextStyle(
                          color: Colors.green.shade700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
*/