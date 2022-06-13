import 'package:africulture_mobile/componsants/pages/profil/profile_controller.dart';
import 'package:africulture_mobile/componsants/pages/vendeur/mesproduits/mesproduits.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../profil/propos.dart';
import '../creation/creation_produit.dart';
import '../vendeur_controller.dart';

class ProfilVendeur extends StatelessWidget {
  ProfileControllers profileController = Get.find();
  //
  VendeurController vendeurController = Get.find();
  //
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        SizedBox(
          height: 10,
        ),
        ListTile(
            onTap: () {
              //splashController.homologin.value = false;
              Get.to(DetailsProfil());
            },
            leading: Icon(Icons.person),
            title: Text("Profil"),
            subtitle: Text(
              "Business",
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.shade700,
            )),
        SizedBox(
          height: 10,
        ),
        Text(
          "Compte_vendeur",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        vendeurController.suspendu.value
            ? Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Africulture \n",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                            text:
                                "Si vous voyez ce message ce que votre démande à bien été effectué. Nous procédons à la vérification de votre formulaire. Un email vous sera envoyé à l'adresse indiqué lors de l'inscription pour vous notifier sous peu.",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        child: Text(
                          "En savoir plus",
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
                    SizedBox(
                      height: 50,
                    ),
                    Obx(
                      () => vendeurController.check.value
                          ? Container(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator())
                          : Text(
                              "Examen du dossier en cours...",
                            ),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(MesProduits());
                    },
                    leading: Icon(Icons.shopping_cart),
                    title: Text("vos_produits"),
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
                    leading: Icon(Icons.shopping_basket_outlined),
                    title: Text("vos_commandes"),
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
                      Get.to(CreationProduit());
                    },
                    leading: Icon(Icons.add_box_outlined),
                    title: Text("ajouter_un_produit"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.email_outlined),
                    title: Text("Mes notifications"),
                    trailing: Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("14"),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey.shade700,
                          )
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                      onTap: (() => Get.to(Propos())),
                      leading: Icon(Icons.call),
                      title: Text("Contactez nous"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey.shade700,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
      ],
    );
  }
}

class DetailsProfil extends StatelessWidget {
  ProfileControllers profileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infos. Profil"),
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
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(text: "Nom ", children: [
                  TextSpan(
                    text: "${profileController.infosEnt['nom']}",
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
                  Icons.edit,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(text: "Postnom ", children: [
                  TextSpan(
                    text: "${profileController.infosEnt['postnom']}",
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
                  Icons.edit,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(text: "Prenom ", children: [
                  TextSpan(
                    text: "${profileController.infosEnt['prenom']}",
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
                  Icons.edit,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(text: "Numero ", children: [
                  TextSpan(
                    text: "${profileController.infosEnt['numero']}",
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
                    text: "${profileController.infosEnt['email']}",
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
                  Icons.edit,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(text: "Date de naissance ", children: [
                  TextSpan(
                    text: "${profileController.infosEnt['dateNaissance']}",
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
                  Icons.edit,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text.rich(
                TextSpan(
                  text: "MDP ",
                  children: [
                    TextSpan(
                      ///${profileController.infosPerso['nom']}
                      text: "************",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
