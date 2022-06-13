import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../profile_controller.dart';

class ProfilInfos extends StatelessWidget {
  ProfileControllers profileController = Get.find();
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infos. Profil"),
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
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(text: "Nom ", children: [
                  TextSpan(
                    text: "${profileController.infosPerso['nom']}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ]),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(text: "Numero ", children: [
                  TextSpan(
                    text: "${profileController.infosPerso['numero']}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
