import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'formulaire_adhesion_controller.dart';

class FormulaireAdhesion extends StatelessWidget {
  bool typeVendeur = true;
  PageController pageController;
  FormulaireAdhesionController formulaireAdhesionController = Get.find();
  FormulaireAdhesion(this.typeVendeur, this.pageController);
  final _formKey = GlobalKey<FormState>();
  /*
  final _nom = TextEditingController();
  final _numero = TextEditingController();
  final _mdp = TextEditingController();
  final _mdp2 = TextEditingController();
  */
  final nom = TextEditingController();
  final adresse = TextEditingController();
  final centreAppel = TextEditingController();
  final email = TextEditingController();
  //final codeLegal = TextEditingController();
  //final mdp = TextEditingController();
  //final statut = TextEditingController();
  //final type = TextEditingController();//SARL;SARLU etc...
  //int taille = TextEditingController();
  final rccm = TextEditingController();
  //Boolean suspendre = TextEditingController();
  List types = ["SARL", "SARLU", ""];
  var type = "SARL";

  bool logBool = true;

  void valider() {
    //int v = pageController.initialPage;
    //print("page int: $v");

    pageController.nextPage(
      duration: const Duration(seconds: 1),
      curve: Curves.bounceIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(),
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Formulaire d'adhesion ${typeVendeur ? 'Entreprise' : 'Individu'}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Nom', labelText: 'Nom'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Veuillez saisir votre Nom';
                        }

                        return null;
                      },
                      controller: nom,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'adresse',
                        labelText: 'adresse',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Entrez votre adresse';
                        }

                        return null;
                      },
                      controller: adresse,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: centreAppel,
                      decoration: const InputDecoration(
                        hintText: "centre d'appel",
                        labelText: "centre d'appel",
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Entrez votre centre d'appel";
                        }

                        return null;
                      },
                      onChanged: (value) {
                        //print("Password value $value");
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'email', labelText: 'email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Veuillez saisir votre email';
                        }

                        return null;
                      },
                      controller: email,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'rccm',
                        labelText: 'rccm',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Entrez votre rccm';
                        }

                        return null;
                      },
                      controller: rccm,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Type    "),
                        Expanded(
                          flex: 1,
                          child: StatefulBuilder(builder: (context, setState) {
                            return DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: type,
                                items: List.generate(types.length, (index) {
                                  return DropdownMenuItem(
                                    value: "${types[index]}",
                                    child: Text("${types[index]}"),
                                  );
                                }),
                                onChanged: (e) {
                                  setState(() {
                                    type = e!;
                                  });
                                },
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          /*
                        Timer(Duration(seconds: 4), () {
                          Get.snackbar("Correct", "Un simple message!");
                        });
                        */
                          //
                          //Get.off(Accueil());
                          //
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

                          Map<String, dynamic> e = {
                            "nom": nom.text,
                            "adresse": adresse.text,
                            "centreAppel": centreAppel.text,
                            "email": email.text,
                            "codeLegal": "123abc@",
                            "mdp": "123abc@",
                            "statut": "starter",
                            "type": type,
                            "taille": "0",
                            "rccm": rccm.text,
                            "suspendre": true,
                          };

                          formulaireAdhesionController.enregistreVendeur(e);
                          //
                        }
                      },
                      child: const Text("Envoyer"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
