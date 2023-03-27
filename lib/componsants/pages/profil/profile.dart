import 'dart:convert';

import 'package:africulture_mobile/componsants/pages/login/log.dart';
import 'package:africulture_mobile/componsants/pages/profil/politique.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../contrôler/splash_controller.dart';
import '../../widgets/choix_langue.dart';
import '../../widgets/noter.dart';
import '../favorit/favorit.dart';
import '../historique_ommande/historique_commande.dart';
import '../login/login.dart';
import 'mesadresses/mesadresse.dart';
import 'profil_infos.dart/profil_infos.dart';
import 'profile_controller.dart';
import 'propos.dart';

class Profil extends StatelessWidget {
  ProfileControllers profileController = Get.find();

  SplashController splashController = Get.find();

  //Profil() {
  //profileController.checkAffiche();
  //}

  @override
  Widget build(BuildContext context) {
    //
    var box = GetStorage();
    //String m = "${box.read('name') ?? ''}";
    RxString name = RxString(box.read('names') ?? '');
    //
    return Scaffold(
      appBar: AppBar(
        title: Text("profil".tr),
        elevation: 0,
        centerTitle: true,
      ), //
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => ListTile(
              onTap: () {
                print(profileController.infosPerso);
                // ignore: unrelated_type_equality_checks
                if (name == '') {
                  //splashController.homologin.value = false;
                  Get.to(Log());
                } else {
                  Get.to(ProfilInfos());
                }
              },
              leading: Icon(Icons.person),
              title: name == '' ? Text("connexion".tr) : Text("$name"),
              subtitle: name == '' ? Container() : Text("$name"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "parametres".tr,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () {
              Get.to(Favorit());
            },
            leading: const Icon(Icons.favorite_outline),
            title: Text("favoris".tr),
            trailing: Container(
              width: 100,
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Text("4 "),
              //     Text("Articles"),
              //     Icon(
              //       Icons.arrow_forward_ios,
              //       color: Colors.grey.shade700,
              //     )
              //   ],
              // ),
            ),
          ),
          ListTile(
            onTap: () {
              Get.to(HistoriqueCommande());
            },
            leading: Icon(Icons.shopping_basket_outlined),
            title: Text("commande".tr),
            trailing: Container(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(""),
                  Text("Articles"),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey.shade700,
                  )
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Get.to(Mesadresses());
            },
            leading: Icon(Icons.contact_page_outlined),
            title: Text("adresse".tr),
            trailing: Container(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //Text("4 "),
                  //Text("Articles"),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey.shade700,
                  )
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                      "Langues",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Container(
                      color: Colors.white,
                      height: 200,
                      width: 150,
                      alignment: Alignment.center,
                      child: ChoixLangue(),
                    ),
                  );
                },
              );
            },
            leading: Icon(Icons.language),
            title: Text("langues".tr),
            trailing: Container(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(" 2 "),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey.shade700,
                  )
                ],
              ),
            ),
          ),
          ListTile(
            onTap: (() => Get.to(Politique())),
            leading: Icon(Icons.info_outline),
            title: Text("politique".tr),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
