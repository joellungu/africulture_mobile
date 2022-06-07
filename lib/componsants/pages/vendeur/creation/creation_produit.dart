import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'creation_controller.dart';

//
List<PlatformFile> listeImage = [];

class CreationProduit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreationProduit();
  }
}

class _CreationProduit extends State<CreationProduit>
    with TickerProviderStateMixin {
  List angles = ["Etape 1", "Etape 2"];
  late TabController controller;
  //
  final _formKey = GlobalKey<FormState>();
  //final _nom = TextEditingController();
  //final _postnom = TextEditingController();
  //final _prenom = TextEditingController();
  //final _numero = TextEditingController();
  //final _email = TextEditingController();
  //final _dateNaissance = TextEditingController();
  //final _mdp1 = TextEditingController();
  //final _mdp2 = TextEditingController();
  //
  //Long idfournisseur;
  final titre = TextEditingController();
  //final devise = TextEditingController();
  final prix = TextEditingController();
  final stock = TextEditingController();
  final pu = TextEditingController();
  //final like = 0;
  final description = TextEditingController();
  final infosSupplementaire = TextEditingController();
  //
  CreationController creationController = Get.find();
  //
  //
  List categories = [
    "Art",
    "Vetements",
    "Gastronomie",
    "Nourriture",
    "Cosmetique",
    "Mobilier",
    "Décoration",
    "Autre"
  ];
  //
  var categorie = "Art";
  //final posterpar;
  //final datePoster;
  //final filtre = TextEditingController();
  //final statut;
  //

  @override
  void initState() {
    //
    controller = TabController(length: angles.length, vsync: this);
    //
    super.initState();
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter produit"),
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
      body: Column(
        children: [
          Container(
            height: 40,
            //color: Colors.blue,
            alignment: Alignment.center,
            child: TabBar(
              isScrollable: true,
              controller: controller,
              indicatorWeight: 1,
              //indicator: BoxDecoration(),
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
              tabs: List.generate(angles.length, (index) {
                return Tab(
                  text: angles[index],
                );
              }),
            ),
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              controller: controller,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  //width: 400,
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(
                                hintText: 'Titre', labelText: 'Titre'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Veuillez saisir le titre';
                              }

                              return null;
                            },
                            controller: titre,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Prix',
                              labelText: 'Prix',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Entrez le prix';
                              }

                              return null;
                            },
                            controller: prix,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: stock,
                            decoration: const InputDecoration(
                              hintText: 'Stock',
                              labelText: 'Stock',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Entrez votre Stock initial';
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
                                hintText: 'Poid unitaire',
                                labelText: 'Poid unitaire'),
                            validator: (value) {
                              return null;
                            },
                            controller: pu,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            maxLines: 5,
                            decoration: const InputDecoration(
                                hintText: 'Description',
                                labelText: 'Description'),
                            validator: (value) {
                              return null;
                            },
                            controller: description,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Infos supplementaire',
                              labelText: 'Infos supplementaire',
                            ),
                            controller: infosSupplementaire,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: categorie,
                              items: List.generate(categories.length, (index) {
                                return DropdownMenuItem(
                                  value: "${categories[index]}",
                                  child: Text("${categories[index]}"),
                                );
                              }),
                              onChanged: (e) {
                                setState(() {
                                  categorie = e!;
                                });
                              },
                            ),
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

                                //
                                //Timer(Duration(seconds: 2), () {
                                //loginController.enregistrement(
                                //  _nom.text, _numero.text, _mdp.text);
                                //
                                Map<String, dynamic> u = {
                                  "idfournisseur": "0",
                                  "titreMar": titre.text,
                                  "deviseMar": "\$",
                                  "prixMar": prix.text,
                                  "stockMar": stock.text,
                                  "likeMar": 0,
                                  "descriptionMar": description.text,
                                  "infosSupplementaireMar":
                                      infosSupplementaire.text,
                                  "categorieMar": categorie,
                                  "poidUnitaureMar": pu.text,
                                  "posterparMar": 0,
                                  "datePosterMar": "${DateTime.now()}",
                                  "filtreMar": categorie,
                                  "statutMar": false
                                };
                                creationController.enregistrerProduit(u);
                                //Get.back();
                                //splashController.seLoger(true);
                                //});
                              }
                            },
                            child: const Text("S'enregistrer"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text("")
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      width: 300,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ListView(
                              children: [
                                Column(
                                  children:
                                      List.generate(listeImage.length, (index) {
                                    return ChampImage(
                                        listeImage[index].path, index, this);
                                  }),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    //

                                    FilePickerResult? result =
                                        await FilePicker.platform.pickFiles(
                                      type: FileType.custom,
                                      allowedExtensions: ['jpg', 'png'],
                                    );
                                    setState(() {
                                      listeImage.add(result!.files.single);
                                    });
                                    //*/
                                  },
                                  child: const Text("Ajouter"),
                                )
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              CreationController creationController =
                                  Get.find();
                              //
                              final box = GetStorage();
                              Map<String, dynamic> imap = box.read('produit');
                              print("La valeur: $imap");
                              setState(() {
                                //
                                listeImage.forEach((element) async {
                                  //
                                  //print(File(element.path!).readAsBytesSync());
                                  //
                                  bool v = await creationController
                                      .enregistrerImageProduit({
                                    'idproduit': imap['id'],
                                    'image':
                                        File(element.path!).readAsBytesSync()
                                  });
                                  v
                                      ? listeImage.remove(element)
                                      : print("erreur lors de l'envois");
                                });
                              });
                            },
                            child: Text("Envoyer"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChampImage extends StatefulWidget {
  String? image;
  int? index;
  State state;
  ChampImage(this.image, this.index, this.state);
  @override
  State<StatefulWidget> createState() {
    return _ChampImage();
  }
}

class _ChampImage extends State<ChampImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              //color: Colors.blue,
              child: Image.file(
                File("${widget.image}"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              //color: Colors.grey.shade200,
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  widget.state.setState(() {
                    listeImage.removeAt(widget.index!);
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
