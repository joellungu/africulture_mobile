import 'package:africulture_mobile/componsants/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../profile_controller.dart';

class ProfilInfos extends StatelessWidget {
  ProfileControllers profileController = Get.find();
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infos. Profil"),
        elevation: 0,
        centerTitle: true,
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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return ChangeInfos(true);
                    },
                  );
                },
                icon: Icon(
                  Icons.edit,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(text: "Email ", children: [
                  TextSpan(
                    text: "${profileController.infosPerso['email']}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ]),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return ChangeInfos(false);
                    },
                  );
                },
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
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.do_not_touch,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          // InkWell(
          //   onTap: () {
          //     showDialog(
          //       context: context,
          //       builder: (c) {
          //         return PrimaryBayer();
          //       },
          //     );
          //   },
          //   child: Container(
          //     alignment: Alignment.center,
          //     height: 40,
          //     child: Text(
          //       "Devenez acheteur premium",
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontWeight: FontWeight.normal,
          //         fontSize: 15,
          //       ),
          //     ),
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.centerLeft,
          //         end: Alignment.centerRight,
          //         colors: <Color>[Colors.yellow.shade700, Colors.black],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class ChangeInfos extends StatelessWidget {
  bool changeN;
  //
  final formKey = GlobalKey<FormState>();
  final ele = TextEditingController();
  Map u = {};
  //
  LoginController loginController = Get.find();
  //
  ChangeInfos(this.changeN) {
    //
    final box = GetStorage();
    //
    u = box.read('utilisateur');
    //
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(changeN ? "Modifier le nom" : "Modifier l'email"),
      content: Container(
          height: 120,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: ele,
                  decoration: const InputDecoration(
                    hintText: 'Text',
                    labelText: 'Text',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Text';
                    } else if (!value.isEmail && !changeN) {
                      return "Email erreur";
                    }

                    return null;
                  },
                  onChanged: (value) {
                    //print("Password value $value");
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      u['nom'] = changeN ? ele.text : u['nom'];
                      u['email'] = !changeN ? ele.text : u['email'];

                      // Map u = {
                      //   "nom": nom.text,
                      //   "email": email.text,
                      //   "numero": telephone.text,
                      //   "codePostal": pays,
                      //   "nomEntreprise": "",
                      //   "adresseEntreprise": "",
                      //   "gradeDansEntreprise": "",
                      //   "autreInfos": "",
                      //   "prime": "",
                      // };
                      loginController.updates(u);
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
          )),
    );
  }
}
