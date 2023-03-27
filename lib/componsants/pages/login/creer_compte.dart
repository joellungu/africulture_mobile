import 'package:africulture_mobile/componsants/pages/login/login_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CreerCompte extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final nom = TextEditingController();
  final telephone = TextEditingController();
  final commArrond = TextEditingController();
  final quartier = TextEditingController();
  final avenue = TextEditingController();
  final numero = TextEditingController();
  final codePostal = TextEditingController();
  var pays = "CD";
  var codePays = "+243";
  //
  LoginController loginController = Get.find();
  //
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouveau compte"),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: nom,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  hintText: 'nom'.tr,
                  labelText: 'nom'.tr,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'nom_message'.tr;
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
                controller: email,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  hintText: 'email'.tr,
                  labelText: 'email'.tr,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'email_message'.tr;
                  } else if (!value.isEmail) {
                    return "Email erreur";
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
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: telephone,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone_android),
                          hintText: 'telephone'.tr,
                          labelText: 'telephone'.tr,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'telephone_message'.tr;
                          } else if (value.length < 8) {
                            return "Téléphone incorrecte";
                          }

                          return null;
                        },
                        onChanged: (value) {
                          //print("Password value $value");
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    Map u = {
                      "nom": nom.text,
                      "email": email.text,
                      "numero": telephone.text,
                      "codePostal": pays,
                      "nomEntreprise": "",
                      "adresseEntreprise": "",
                      "gradeDansEntreprise": "",
                      "autreInfos": "",
                      "prime": "",
                    };
                    loginController.enregistrement(u);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  child: Text(
                    "valider".tr,
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
    );
  }
}
