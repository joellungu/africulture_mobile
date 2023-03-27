import 'dart:convert';
import 'dart:math';
import 'package:africulture_mobile/componsants/pages/principale.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../utile/utils.dart';
import '../../contrôler/splash_controller.dart';
import '../profil/profile_controller.dart';
import 'login.dart';
import 'verification_otp.dart';

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

  log(String codeP, String numero) async {
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
    Response response = await loginConnexion.check(codeP, numero);

    print(response.statusCode);
    print(response.body);

    //
    Get.back();
    //
    if (response.isOk) {
      //
      //box.write("userauth", response.body); //
      Map rep = response.body;
      //print(response.body);VerificationOtp

      Get.off(VerificationOtp(true, numero, codeP));
      // Get.snackbar(
      //   "Votre code",
      //   "$c",
      //   duration: Duration(seconds: 7),
      // );
    } else if (response.statusCode == 401) {
      Get.off(VerificationOtp(false, numero, codeP));
      // message(
      //   "Erreur",
      //   "Ce numéro à déjà un compte veuillez vous authentifier",
      // );
    } else {
      message(
        "Erreur",
        "Un problème est survenu lors de la requete",
      );
    }
    //
    //splashController.seLoger(true);
  }

  enregistrement(Map nUtilisateur) async {
    Response response = await loginConnexion.enregistrement(nUtilisateur);
    //
    if (response.isOk) {
      //
      //String rep = response.body;
      Map<String, dynamic> mapRep = response.body;
      //Enregistrement reussit
      save_n_utilisateur(mapRep);
      Get.off(() => Principale());
      message(
        "Enregistrement",
        "Compte crée avec succès",
      );
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

  updates(Map nUtilisateur) async {
    Response response = await loginConnexion.updates(nUtilisateur);
    //
    if (response.isOk) {
      //
      //String rep = response.body;
      Map<String, dynamic> mapRep = response.body;
      //Enregistrement reussit
      save_n_utilisateur(mapRep);
      Get.off(() => Principale());
      message(
        "Enregistrement",
        "Compte crée avec succès",
      );
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
    return get("${Utils.url}/utilisateur/check/$codeP/$numero/$c");
  }

  //
  Future<Response> check(String codeP, String numero) async {
    return get("${Utils.url}/utilisateur/check/$codeP/$numero");
  }

  //
  Future<Response> log2(
      String codeP, String numero, String nom, String c, bool dejaLog) async {
    return get("${Utils.url}/utilisateur/loging/$codeP/$numero/$nom/$c");
  }

  //
  Future<Response> enregistrement(Map nUtilisateur) {
    return post("${Utils.url}/utilisateur/save", jsonEncode(nUtilisateur));
  }

  Future<Response> updates(Map nUtilisateur) {
    return put("${Utils.url}/utilisateur/update", jsonEncode(nUtilisateur));
  }
}
