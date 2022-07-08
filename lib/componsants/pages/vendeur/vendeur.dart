import 'dart:async';

import 'package:africulture_mobile/componsants/pages/vendeur/creation/partie1.dart';
import 'package:africulture_mobile/componsants/pages/vendeur/formulaire_adhesion/formulaire_adhesion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'creation/partie2.dart';
import 'creation/partie3.dart';
import 'mension_legal.dart';
import 'profil_vendeur/profile_vendeur.dart';
import 'vendeur_controller.dart';

enum ChoixCompteVendeur { ent, ind }

bool typeVendeur = true;
RxBool suspendre = false.obs;

class Vendeur extends StatelessWidget {
  PageController pageController = PageController();
  VendeurController vendeurController = Get.find();
  //
  Vendeur() {
    //
    Timer(
      const Duration(seconds: 1),
      (() => vendeurController.verificationCompte()),
    );
    //
  }
  //
  double conte = 0;
  //
  @override
  Widget build(BuildContext context) {
    //print("je suis ou pas suspendu: ${vendeurController.suspendu.value}");
    conte = MediaQuery.of(context).size.width / 4;

    //
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            "${vendeurController.titreProfile}".tr,
          ),
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
      body: Obx(
        () => vendeurController.infosEnt.value['statut'] == 'starter'
            ? Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text.rich(
                      TextSpan(
                        text: "Africulture \n",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                            text:
                                "Votre démande a été éffectuté et nous analysons. Une reponse vous sera communiqué sous peu merci.",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        child: Text(
                          "En savoir plus",
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
                            colors: <Color>[
                              Colors.yellow.shade700,
                              Colors.black
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Obx(
                      () => vendeurController.check.value
                          ? Container(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(),
                            )
                          : const Text(
                              "Examen du dossier en cours...",
                            ),
                    ),
                  ],
                ),
              )
            : vendeurController.infosEnt.value['statut'] == 'accepté'
                ? ProfilVendeur()
                : vendeurController.infosEnt.value['statut'] == 'bloqué'
                    ? Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text.rich(
                              TextSpan(
                                text: "Africulture \n",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        "Si vous voyez ce message ce que votre boutique a été momentanement bloqué, veuillez contacter le service de AfricCulture pour plus d'information.",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                child: Text(
                                  "En savoir plus",
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
                                    colors: <Color>[
                                      Colors.yellow.shade700,
                                      Colors.black
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Obx(
                              () => vendeurController.check.value
                                  ? Container(
                                      height: 40,
                                      width: 40,
                                      child: CircularProgressIndicator(),
                                    )
                                  : const Text(
                                      "Examen du dossier en cours...",
                                    ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.all(20),
                        child: PageView(
                          controller: pageController,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text.rich(
                                  TextSpan(
                                    text: "Africulture \n",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            "vous permet de vendre vos produit dans notre platforme, ainsi donc vous devez crée un compte business dans notre platforme pour beneficier de ce service, commencez dès maintenant.",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    pageController.nextPage(
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.ease);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    child: Text(
                                      "Commencer",
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
                                        colors: <Color>[
                                          Colors.yellow.shade700,
                                          Colors.black
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(Loader());
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    child: Text(
                                      "Vous avez déjà un compte?",
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
                                        colors: <Color>[
                                          Colors.yellow.shade700,
                                          Colors.black
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                            MensionLegale(true, pageController),
                            FormulaireAdhesion(true, pageController),
                          ],
                        ),
                      ),
      ),
    );
  }
}

class Loader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Loader();
  }
}

class _Loader extends State<Loader> {
  //
  VendeurController vendeurController = Get.find();
  //
  final _formKey = GlobalKey<FormState>();

  final codeLegale = TextEditingController();
  final mdp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "S'authentifier",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.yellow.shade700,
                Colors.black,
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        alignment: Alignment.center,
        //height: 300,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Code légal', labelText: 'Code légal'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Code légal';
                  }

                  return null;
                },
                controller: codeLegale,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Mot de passe', labelText: 'Mot de passe'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir votre Mot de passe';
                  }

                  return null;
                },
                controller: mdp,
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  //Get.to(FormulaireAdhesion());
                  //
                  final box = GetStorage();
                  //
                  //Map<String, dynamic> pr = box.read("userauth");

                  if (_formKey.currentState!.validate()) {
                    //
                    Map<String, dynamic> e = {"": "", "": ""};
                    //
                    vendeurController.enregistreVendeur(e);
                    //
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  child: Text(
                    "S'authentifier",
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
}
