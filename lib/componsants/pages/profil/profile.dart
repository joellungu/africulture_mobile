import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
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
                if (profileController.infosPerso['nom'] == null) {
                  //splashController.homologin.value = false;
                  Get.to(Login());
                } else {
                  Get.to(ProfilInfos());
                }
              },
              leading: Icon(Icons.person),
              title: profileController.infosPerso['nom'] == null
                  ? Text("connexion")
                  : Text("${profileController.infosPerso['nom']}"),
              subtitle: profileController.infosPerso['nom'] == null
                  ? Container()
                  : Text("${profileController.infosPerso['numero']}"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Réglage générale",
            style: TextStyle(
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
            leading: Icon(Icons.favorite_outline),
            title: Text("liste_de_favorit"),
            trailing: Container(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("4 "),
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
              Get.to(HistoriqueCommande());
            },
            leading: Icon(Icons.shopping_basket_outlined),
            title: Text("commandes"),
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
            leading: Icon(Icons.notifications_active_outlined),
            title: Text("notifications"),
            trailing: Container(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(
                    () => Switch(
                      activeColor: Colors.yellow.shade700,
                      value: profileController.notification.value,
                      onChanged: (c) {
                        profileController.notification.value = c;
                        String mess = c
                            ? "Notifications activés"
                            : "Notifications desactivés";
                        Get.snackbar("Notification", mess);
                      },
                    ),
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
            title: Text("Mes adresses"),
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
          Obx(
            () => profileController.notification.value
                ? ListTile(
                    leading: Icon(Icons.menu),
                    title: Text("Mes notifications"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade700,
                    ),
                  )
                : Container(),
          ),
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        "Langues",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: Container(
                        color: Colors.white,
                        height: 150,
                        width: 150,
                        alignment: Alignment.center,
                        child: ChoixLangue(),
                      ),
                    );
                  });
            },
            leading: Icon(Icons.language),
            title: Text("langues"),
            trailing: Container(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("3 "),
                  Text("Langues"),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey.shade700,
                  )
                ],
              ),
            ),
          ),
          ListTile(
              leading: Icon(Icons.star_border),
              title: Text("Commenter"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey.shade700,
              )),
          ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Notes nous"),
                      content: NoterNous(),
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.check,
                          ),
                        )
                      ],
                    );
                  },
                );
              },
              leading: Icon(Icons.speaker_notes),
              title: Text("Devenez partenaire"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey.shade700,
              )),
          ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Notes nous"),
                      content: NoterNous(),
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.check,
                          ),
                        )
                      ],
                    );
                  },
                );
              },
              leading: Icon(Icons.edit_note),
              title: Text("Noter l'application"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey.shade700,
              )),
          ListTile(
              onTap: (() => Get.to(Propos())),
              leading: Icon(Icons.info_outline),
              title: Text("propos"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey.shade700,
              )),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
