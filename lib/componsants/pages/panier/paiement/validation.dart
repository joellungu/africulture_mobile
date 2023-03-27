import 'dart:convert';

import 'package:africulture_mobile/componsants/pages/panier/adresse/adresse_controller.dart';
import 'package:africulture_mobile/componsants/pages/panier/expedition/expedition_controller.dart';
import 'package:africulture_mobile/componsants/pages/panier/panier_controller.dart';
import 'package:africulture_mobile/componsants/pages/profil/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:math' as math;
import 'validation_controller.dart';

class Validation extends StatelessWidget {
  //
  ValidationController validationController = Get.find();
  AdresseController adresseController = Get.find();
  PanierController panierController = Get.find();
  ExpeditionController expeditionController = Get.find();
  //
  var formKey = GlobalKey<FormState>();
  final code = TextEditingController();
  //
  int t0 = math.Random().nextInt(10);
  int t1 = math.Random().nextInt(10);
  int t2 = math.Random().nextInt(10);
  int t3 = math.Random().nextInt(10);
  int t4 = math.Random().nextInt(10);
  int t5 = math.Random().nextInt(10);
  int t6 = math.Random().nextInt(10);
  int t7 = math.Random().nextInt(10);
  int t8 = math.Random().nextInt(10);
  int t9 = math.Random().nextInt(10);
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Validation",
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: 200,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            hintText: 'Code ou telephone',
                            labelText: 'Code ou telephone'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez saisir votre Nom';
                          }

                          return null;
                        },
                        controller: code,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove_red_eye_outlined),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    Get.dialog(
                      const Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      name: "Attente...",
                    );
                    //
                    final box = GetStorage();
                    ProfileControllers profileController = Get.find();
                    //adresseController.codePays.value
                    Map<String, dynamic> c = {
                      "numero": "${profileController.infosPerso['numero']}",
                      "nom": "${profileController.infosPerso['nom']}",
                      "date": "${DateTime.now()}",
                      "pays": "${adresseController.pays.value}",
                      "code":
                          "${adresseController.pays.value}-${profileController.infosPerso['numero']}/$t1$t2$t2-$t3$t4$t5-$t6$t7$t8$t9",
                      "confirmation": false,
                      "expresse": expeditionController.express.value,
                      "expedier": false,
                      "panier": {"liste": panierController.listeProduit},
                      "adresse": {
                        "m_adresse": adresseController.m_adresse.value,
                        "titre": adresseController.titre.value,
                        "pays": adresseController.pays.value,
                        "codePays": adresseController.codePays.value,
                        "etatProvince": adresseController.etatProvince.value,
                        "ville": adresseController.ville.value,
                        "commArrond": adresseController.commArrond.value,
                        "quartier": adresseController.quartier.value,
                        "avenue": adresseController.avenue.value,
                        "numero": adresseController.numero.value,
                        "codePostal": adresseController.codePostal.value
                      },
                    };

                    print(jsonEncode(c));

                    panierController.listeProduit.forEach((element) {
                      //print(element);
                    });
                    //
                    validationController.loadProduit(code.text, c);
                    //Get.back();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  child: const Text(
                    "Paier",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[Colors.yellow.shade700, Colors.black],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String codes() {
    int t0 = math.Random().nextInt(10);
    int t1 = math.Random().nextInt(10);
    int t2 = math.Random().nextInt(10);
    int t3 = math.Random().nextInt(10);
    int t4 = math.Random().nextInt(10);
    int t5 = math.Random().nextInt(10);
    int t6 = math.Random().nextInt(10);
    int t7 = math.Random().nextInt(10);
    int t8 = math.Random().nextInt(10);
    int t9 = math.Random().nextInt(10);
    return "$t1$t2$t2-$t3$t4$t5-$t6$t7$t8$t9";
  }
}
