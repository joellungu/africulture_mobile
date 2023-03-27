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

  List options = ['nouvelle_adresse'.tr, 'liste_adresse'.tr];
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
  var pays = "CD";
  var codePays = "+243";
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
        elevation: 0,
        centerTitle: true,
        bottom: TabBar(
          isScrollable: true,
          controller: controller,
          indicatorWeight: 1,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
          //indicator: BoxDecoration(),
          indicatorColor: Colors.black,
          labelColor: Colors.grey,
          unselectedLabelColor: Colors.grey.shade800,
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
          tabs: List.generate(options.length, (index) {
            return Tab(
              text: "${options[index]}".tr,
            );
          }),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: [
                  TextFormField(
                    controller: titre,
                    decoration: InputDecoration(
                      hintText: 'titre_adresse'.tr,
                      labelText: 'titre_adresse'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'titre_adresse_message'.tr;
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
                    padding: const EdgeInsets.all(10),
                    //height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("pays".tr),
                        CountryCodePicker(
                          onChanged: (p) {
                            pays = p.code!;
                            codePays = p.dialCode!;
                            print("pays: $pays, codePays: $codePays");
                          },
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'CD',
                          favorite: ['+243', '+33'],
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
                    decoration: InputDecoration(
                      hintText: 'etat_province'.tr,
                      labelText: 'etat_province'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'etat_province_message'.tr;
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
                    decoration: InputDecoration(
                      hintText: 'ville'.tr,
                      labelText: 'ville'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'ville_message'.tr;
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
                    decoration: InputDecoration(
                      hintText: 'commune'.tr,
                      labelText: 'commune'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'commune_message'.tr;
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
                    decoration: InputDecoration(
                        hintText: 'quartier'.tr, labelText: 'quartier'.tr),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'quartier_message'.tr;
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
                    decoration: InputDecoration(
                      hintText: 'avenue'.tr,
                      labelText: 'avenue'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'avenue_message'.tr;
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
                    decoration: InputDecoration(
                      hintText: 'numero'.tr,
                      labelText: 'numero'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'numero_message'.tr;
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
                    decoration: InputDecoration(
                      hintText: 'code_postal'.tr,
                      labelText: 'code_postal'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'code_postal_message'.tr;
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
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        setState(() {
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
                            duration: const Duration(seconds: 4),
                          );
                        });
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      child: Text(
                        "ajouter".tr,
                        style: const TextStyle(
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
                  )
                ],
              ),
            ),
          ),
          listeAdresse.isNotEmpty
              ? ListView(
                  padding: const EdgeInsets.all(10),
                  children: List.generate(listeAdresse.length, (index) {
                    return ListTile(
                      title: Text(listeAdresse[index]["titre"]),
                      subtitle: Text(listeAdresse[index]["pays"]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            listeAdresse.removeAt(index);
                            box.write("listeAdresse", listeAdresse);
                            Get.snackbar(
                              "Suppression",
                              "Suppression éffectué",
                              duration: const Duration(seconds: 4),
                            );
                          });
                        },
                      ),
                    );
                  }),
                )
              : Container(),
        ],
      ),
    );
  }
}
