import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../utile/utils.dart';
import '../../contrôler/splash_controller.dart';
import '../profil/profile_controller.dart';
import 'login.dart';

class LoginController extends GetxController {
  SplashController splashController = Get.find();
  ProfileControllers profileController = Get.put(ProfileControllers());
  //
  LoginConnexion loginConnexion = LoginConnexion();
  //
  final box = GetStorage();
  //
  RxBool logBool = false.obs;
  RxBool code = false.obs;
  RxString password = "".obs;
  RxMap rep = {}.obs;

  LoginController() {
    profileController = Get.find();
  }

  log(String codeP, String numero, String nom, bool dejaLog) async {
    //print("utilisateur/auth/$email/$mdp");
    var rng = Random();
    int c1 = rng.nextInt(9);
    int c2 = rng.nextInt(9);
    int c3 = rng.nextInt(9);
    int c4 = rng.nextInt(9);
    int c5 = rng.nextInt(9);
    int c6 = rng.nextInt(9);
    String c = "$c1$c2$c3$c4$c5$c6";
    password.value = c;
    print(c);
    //
    Response response;
    if (dejaLog) {
      //

      response = await loginConnexion.log1(codeP, numero, dejaLog, c);
    } else {
      //
      response = await loginConnexion.log2(codeP, numero, nom, c, dejaLog);
    }

    print(response.statusCode);
    print(response.body);

    //
    if (response.isOk) {
      //
      box.write("userauth", response.body); //
      //print(response.body);

      Get.off(Certifier());
      Get.snackbar(
        "Votre code",
        "$c",
        duration: Duration(seconds: 7),
      );
    } else if (response.statusCode == 400) {
      message(
        "Erreur",
        "Ce numéro à déjà un compte veuillez vous authentifier",
      );
    } else if (response.statusCode == 401) {
      message(
        "Erreur",
        "Ce numéro n'existe pas enregistrez-vous !",
      );
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
    Response response = await loginConnexion.enregistrement(nUtilisateur);
    //
    if (response.isOk) {
      //
      //String rep = response.body;
      Map<String, dynamic> mapRep = response.body;
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

class LoginConnexion extends GetConnect {
  //
  Future<Response> log1(
      String codeP, String numero, bool dejaLog, String c) async {
    return get("${Utils.url}/utilisateur/auth/$codeP/$numero/$c");
  }

  //
  Future<Response> log2(
      String codeP, String numero, String nom, String c, bool dejaLog) async {
    return get("${Utils.url}/utilisateur/loging/$codeP/$numero/$nom/$c");
  }

  //
  Future<Response> enregistrement(Map<String, dynamic> nUtilisateur) {
    return post("${Utils.url}/utilisateur/save", jsonEncode(nUtilisateur));
  }
}
