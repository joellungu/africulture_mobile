import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../profil/profile_controller.dart';
import '../commander/commander_controller.dart';
import '../panier_controller.dart';
import 'adresse_controller.dart';

class Adresse extends StatefulWidget {
  PageController pageController = PageController();
  //
  //
  List<String> titres = [];

  Adresse(this.pageController, this.titres);
  @override
  State<StatefulWidget> createState() {
    return _Adresse();
  }
}

class _Adresse extends State<Adresse> {
  final _nom = TextEditingController();
  final _postnom = TextEditingController();
  final _prenom = TextEditingController();
  final _numero = TextEditingController();
  final _email = TextEditingController();
  var _pays;

  ProfileControllers profileControllers = Get.find();
  CommanderController commanderController = Get.find();
  AdresseController adresseController = Get.find();
  //PanierController panierController = Get.find();
  //
  //PageController pageController = PageController();
  //
  double conte = 0;
  int i = 0;
  //
  //List<String> titres = [];
  List m_adresses = [];
  String m_adresse = "";

  _Adresse() {
    //
    final box = GetStorage();
    //
    Map<dynamic, dynamic> m = profileControllers.infosPerso;
    //
    m_adresses = box.read("listeAdresse") ?? [];
    //
    _nom.text = m['nom'] ?? "";
    _postnom.text = m['postnom'] ?? "";
    _prenom.text = m['prenom'] ?? "";
    _numero.text = m['numero'] ?? "";
    _email.text = m['email'] ?? "";
  }
  //
  final formKey = GlobalKey<FormState>();
  final titre = TextEditingController();
  final etatProvince = TextEditingController();
  final ville = TextEditingController();
  final commArrond = TextEditingController();
  final quartier = TextEditingController();
  final avenue = TextEditingController();
  final numero = TextEditingController();
  final codePostal = TextEditingController();
  var pays;
  var codePays;

  @override
  void initState() {
    //
    conte = Get.width / 4;
    //commanderController.avancement.value = conte;
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Nom', labelText: 'Nom'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir votre Nom';
                  }

                  return null;
                },
                controller: _nom,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Numéro', labelText: 'Numéro'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir votre Numéro';
                  }

                  return null;
                },
                controller: _numero,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 20,
                color: Colors.grey.shade200,
                child: const Text(
                  "Adresse de destination",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              /*
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                //height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pays d'origine  "),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text.rich(
                        TextSpan(
                          text: "",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                          children: [
                            TextSpan(
                              text: "${p['prixMar']}\n",
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                            ),
                            TextSpan(
                              text:
                                  p['poidsUnitaire'] != null ? '\nPoids: ' : '',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              */
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                //height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pays de destination  "),
                    CountryCodePicker(
                      onChanged: (p) {
                        pays = p.code!;
                        codePays = p.dialCode!;
                        print("pays: $pays, codePays: $codePays");
                      },
                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      initialSelection: 'CD',
                      favorite: ['+243', 'FR'],
                      // optional. Shows only country name and flag
                      showCountryOnly: false,
                      // optional. Shows only country name and flag when popup is closed.
                      showOnlyCountryWhenClosed: false,
                      // optional. aligns the flag and the Text left
                      alignLeft: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                //height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Vos adresse   "),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "$m_adresse",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    PopupMenuButton(
                      icon: const Icon(
                        Icons.more_vert_outlined,
                        color: Colors.black,
                      ),
                      onSelected: (x) {
                        //print(e);
                        int e = x as int;
                        setState(() {
                          m_adresse = m_adresses[e]['titre'];
                          titre.text = m_adresses[e]['titre'];
                          pays = m_adresses[e]['pays'];
                          codePays = m_adresses[e]['codePays'];
                          etatProvince.text = m_adresses[e]['etatProvince'];
                          ville.text = m_adresses[e]['ville'];
                          commArrond.text = m_adresses[e]['commArrond'];
                          quartier.text = m_adresses[e]['quartier'];
                          avenue.text = m_adresses[e]['avenue'];
                          numero.text = m_adresses[e]['numero'];
                          codePostal.text = m_adresses[e]['codePostal'];
                          //adresseController
                          adresseController.m_adresse.value =
                              m_adresses[e]['titre'];
                          adresseController.titre.value =
                              m_adresses[e]['titre'];
                          adresseController.pays.value = m_adresses[e]['pays'];
                          adresseController.codePays.value =
                              m_adresses[e]['codePays'];
                          adresseController.etatProvince.value =
                              m_adresses[e]['etatProvince'];
                          adresseController.ville.value =
                              m_adresses[e]['ville'];
                          adresseController.commArrond.value =
                              m_adresses[e]['commArrond'];
                          adresseController.quartier.value =
                              m_adresses[e]['quartier'];
                          adresseController.avenue.value =
                              m_adresses[e]['avenue'];
                          adresseController.numero.value =
                              m_adresses[e]['numero'];
                          adresseController.codePostal.value =
                              m_adresses[e]['codePostal'];
                          //adresseController
                        });
                      },
                      itemBuilder: (context) => List.generate(
                        m_adresses.length,
                        (index) => PopupMenuItem(
                          child: Text("${m_adresses[index]['titre']}"),
                          value: index,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: etatProvince,
                decoration: const InputDecoration(
                  hintText: 'Etat / Province',
                  labelText: 'Etat / Province',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Entrez votre province ou adresse';
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
                controller: ville,
                decoration: const InputDecoration(
                    hintText: 'Ville', labelText: 'Ville'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Entrez votre ville';
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
                controller: commArrond,
                decoration: const InputDecoration(
                  hintText: 'Commune / Arrondissement',
                  labelText: 'Commune / Arrondissement',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Entrez votre commArrond';
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
                controller: quartier,
                decoration: const InputDecoration(
                    hintText: 'Quartier', labelText: 'Quartier'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Entrez votre quartier';
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
                controller: avenue,
                decoration: const InputDecoration(
                  hintText: 'Avenue ou Rue',
                  labelText: 'Avenue ou Rue',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Entrez votre avenue';
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
                controller: numero,
                decoration: const InputDecoration(
                  hintText: 'Numéro',
                  labelText: 'Numéro',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Entrez votre numéro';
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
                controller: codePostal,
                decoration: const InputDecoration(
                  hintText: 'Code postal',
                  labelText: 'Code postal',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Entrez votre Code postal';
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
              Container(
                height: 40,
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (i <= 2) {
                            print("Avant: $i");
                            i++;
                            print("Après: $i");
                            /////////////////////////
                            ///
                            adresseController.m_adresse.value = m_adresse;
                            adresseController.titre.value = titre.text;
                            adresseController.pays.value = pays;
                            adresseController.codePays.value = codePays;
                            adresseController.etatProvince.value =
                                etatProvince.text;
                            adresseController.ville.value = ville.text;
                            adresseController.commArrond.value =
                                commArrond.text;
                            adresseController.quartier.value = quartier.text;
                            adresseController.avenue.value = avenue.text;
                            adresseController.numero.value = numero.text;
                            adresseController.codePostal.value =
                                codePostal.text;

                            ///
                            commanderController.avancement.value =
                                commanderController.avancement.value + conte;
                            commanderController.titre.value = "Expédition";
                            widget.pageController.nextPage(
                              duration: Duration(seconds: 1),
                              curve: Curves.ease,
                            );
                          }
                        }
                        //
                      },
                      child: const Text("Suivant"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
