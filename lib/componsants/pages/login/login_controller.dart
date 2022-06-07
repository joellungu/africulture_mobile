import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:get_storage/get_storage.dart';
//import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../../utile/utils.dart';
import '../../contrôler/splash_controller.dart';
import '../profil/profile_controller.dart';

class LoginController extends GetxController {
  SplashController splashController = Get.find();
  // ignore: non_constant_identifier_names
  ProfileControllers profileController = Get.put(ProfileControllers());

  LoginController() {
    profileController = Get.find();
  }

  log(String email, String mdp) async {
    print("utilisateur/auth/$email/$mdp");
    http.Response response =
        await http.get(Utils.lienUrl("utilisateur/auth/$email/$mdp"));
    //
    if (response.statusCode == 201 || response.statusCode == 200) {
      //
      String rep = response.body;
      Map<String, dynamic> mapRep = jsonDecode(rep);

      save_n_utilisateur(mapRep);
      print(response.body);
    } else {
      //
      //Get.back();
      message(
        "Erreur serveur",
        "Un problème lors de la connexion au serveur code: ${response.statusCode}",
      );
      //
      print(response.body);
    }
    //
    //splashController.seLoger(true);
  }

  enregistrement(Map<String, dynamic> nUtilisateur) async {
    http.Response response = await http.post(
      Utils.lienUrl("utilisateur/enregistrer"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: jsonEncode(nUtilisateur),
    );
    //
    if (response.statusCode == 201 || response.statusCode == 200) {
      //
      String rep = response.body;
      Map<String, dynamic> mapRep = jsonDecode(rep);
      //Enregistrement reussit
      save_n_utilisateur(mapRep);
      print(response.body);
    } else if (response.statusCode == 300) {
      message(
        "Problème d'enregistrement",
        "Cet adresse mail a déjà un compte ${response.statusCode}",
      );
    } else {
      //
      //Get.back();
      message(
        "Problème d'enregistrement",
        "Code d'erreur: ${response.statusCode}",
      );
      //
      print(response.body);
    }
    //
    //splashController.seLoger(true);
  }

  message(String titre, String message) {
    Get.back();
    //
    Get.showSnackbar(
      GetSnackBar(
        title: titre,
        message: message,
        duration: Duration(
          seconds: 5,
        ),
      ),
    );
    //
  }

  save_n_utilisateur(Map<String, dynamic> nU) async {
    final box = GetStorage();
    //
    box.write('utilisateur', nU);
    //
    Get.back();
    Get.back();
    //
    //splashController.seLoger(true);
    //
    profileController.checkAffiche();
  }
}
