import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/carte_produit.dart';
import 'recherche_controller.dart';

class Recherche extends StatelessWidget {
  List filtres = [
    "Art",
    "Vetements",
    "Gastronomie",
    "Nourriture",
    "Cosmetique",
    "Mobilier",
    "Décoration",
    "Autre"
  ];

  RechercheController rechercheController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recherche",
        ),
        backgroundColor: Colors.white,
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
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 10,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: PopupMenuButton(
                      child: Row(
                        children: const [
                          Icon(
                            Icons.add,
                            size: 20,
                          ),
                          Text("Filtre"),
                        ],
                      ),
                      onSelected: (s) {
                        print(filtres[s as int]);
                        print(rechercheController.filterHistorique.value);
                        rechercheController.filterHistorique
                            .add(filtres[s as int]);
                      },
                      itemBuilder: (context) => List.generate(
                        filtres.length,
                        (index) {
                          return PopupMenuItem(
                            value: index,
                            child: Text("${filtres[index]}"),
                          );
                        },
                      ),
                    ),
                  ),
                  Obx(
                    (() => Expanded(
                          flex: 1,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                                rechercheController.filterHistorique.length,
                                (index) {
                              return TextButton.icon(
                                onPressed: () {
                                  rechercheController.filterHistorique
                                      .removeAt(index);
                                },
                                icon: Icon(
                                  Icons.close,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                label: Text(
                                    "${rechercheController.filterHistorique.value[index]}"),
                              );
                            }),
                          ),
                        )),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 0.5,
                children: List.generate(
                  5,
                  (index) => CarteProduite(true, index + 9),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
