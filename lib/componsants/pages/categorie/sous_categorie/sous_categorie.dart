import 'package:africulture_mobile/componsants/widgets/carte_produit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SousCategorie extends StatelessWidget {
  String sousCat = "";

  SousCategorie(this.sousCat);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        title: Text(
          sousCat,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 0.5,
          children: List.generate(
            5,
            (index) => CarteProduite({}, true),
          ),
        ),
      ),
    );
  }
}
