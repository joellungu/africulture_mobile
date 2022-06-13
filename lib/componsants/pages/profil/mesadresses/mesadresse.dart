import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Mesadresses extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Mesadresses();
  }
}

class _Mesadresses extends State<Mesadresses> with TickerProviderStateMixin {
  late TabController controller;

  List options = ['Nouvelle adresse', 'Liste des adresses'];
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
  //
  final box = GetStorage();
  //
  List listeAdresse = [];

  @override
  void initState() {
    //
    listeAdresse = box.read("listeAdresse") ?? [];
    //
    controller = TabController(length: options.length, vsync: this);
    //
    super.initState();
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mes adresses",
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
        bottom: TabBar(
          isScrollable: true,
          controller: controller,
          indicatorWeight: 1,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
          //indicator: BoxDecoration(),
          indicatorColor: Colors.white,
          labelColor: Colors.grey.shade300,
          unselectedLabelColor: Colors.grey.shade800,
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
          tabs: List.generate(options.length, (index) {
            return Tab(
              text: options[index],
            );
          }),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                TextFormField(
                  controller: titre,
                  decoration: const InputDecoration(
                    hintText: 'Titre',
                    labelText: 'Titre',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Entrez le Titre';
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
                  padding: EdgeInsets.all(10),
                  //height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Pays  "),
                      CountryCodePicker(
                        onChanged: (p) {
                          pays = p.name;
                          codePays = p.code;
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
                ElevatedButton(
                  onPressed: () {
                    listeAdresse.add({
                      "titre": titre.text,
                      "pays": pays,
                      "codePays": codePays,
                      "etatProvince": etatProvince.text,
                      "ville": ville.text,
                      "commArrond": commArrond.text,
                      "quartier": quartier.text,
                      "avenue": avenue.text,
                      "numero": numero.text,
                      "codePostal": codePostal.text,
                    });
                    //
                    box.write("listeAdresse", listeAdresse);
                    Get.snackbar(
                      "Enregistrer",
                      "Enregistrement éffectué",
                      duration: const Duration(seconds: 5),
                    );
                  },
                  child: const Text("Ajouter"),
                )
              ],
            ),
          ),
          listeAdresse.isNotEmpty
              ? ListView(
                  padding: const EdgeInsets.all(10),
                  children: List.generate(listeAdresse.length, (index) {
                    return ListTile(
                      title: Text(listeAdresse[index]["titre"]),
                      subtitle: Text(listeAdresse[index]["pays"]),
                    );
                  }),
                )
              : Container(),
        ],
      ),
    );
  }
}
