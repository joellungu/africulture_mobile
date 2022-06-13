import 'package:africulture_mobile/componsants/pages/profil/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'formulaire_adhesion/formulaire_adhesion.dart';
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
    vendeurController.verificationCompte();
    //
  }
  //
  double conte = 0;
  //
  @override
  Widget build(BuildContext context) {
    conte = MediaQuery.of(context).size.width / 5;

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
        () => !vendeurController.suspendu.value
            ? ProfilVendeur()
            : Column(
                children: [
                  /*
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => AnimatedContainer(
                  duration: Duration(seconds: 2),
                  height: 5,
                  color: Colors.red.shade700,
                  width: vendeurController.avancement.value,
                ),
              ),
            ],
          ),
          */
                  Expanded(
                    flex: 1,
                    child: PageView(
                      controller: pageController,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: "Africulture ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          "vous permet de mettre en vente vos produits sur notre platforme pour vendre dans le monde entier. ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "Si célà vous interesse nous vous invitons à lire et à accepter les regles et conditions, à remplire les formulaires d'hadesion et de soumettre votre démande à nos services. commancer dans la page suivantre.",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  int v = pageController.initialPage;
                                  print("page int: $v");
                                  pageController.nextPage(
                                    duration: Duration(seconds: 1),
                                    curve: Curves.bounceIn,
                                  );
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
                              InkWell(
                                onTap: () {
                                  //
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Loader(),
                                      );
                                      /*Material(
                                        color: Colors.transparent,
                                        child: Center(
                                          child: Loader(),
                                        ),
                                      );
                                      */
                                    },
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  child: Text(
                                    "Déjà un compte ?",
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
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: "Africulture ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          "Offres des services differents selon que vous etes une entreprise ou un individu. Faite un choix et cliquez sur continuer.",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  int v = pageController.initialPage;
                                  print("page int: $v");
                                  pageController.nextPage(
                                    duration: Duration(seconds: 1),
                                    curve: Curves.bounceIn,
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  child: Text(
                                    "Continuer",
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
                              )
                            ],
                          ),
                        ),
                        MensionLegale(typeVendeur, pageController),
                        FormulaireAdhesion(typeVendeur, pageController),
                        Container(
                          color: Colors.yellowAccent,
                        )
                      ],
                    ),
                  ),
                ],
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
    return Card(
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(0),
        height: 200,
        width: 200,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  //
                  Map<String, dynamic> e = {"": "", "": ""};
                  //
                  vendeurController.enregistreVendeur(e);
                  //
                },
                child: Text("Valider"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
