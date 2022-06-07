import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/categorie/sous_categorie/sous_categorie.dart';

class CarteCategorie extends StatelessWidget {
  Map<String, dynamic> contenue = {};

  CarteCategorie(this.contenue);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: InkWell(
        onTap: () {
          Get.to(SousCategorie(contenue["titre"]));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              contenue["icon"],
              color: Colors.yellow.shade700,
              size: 50,
            ),
            Text(
              contenue["titre"],
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
