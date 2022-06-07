import 'package:africulture_mobile/componsants/pages/produits/produit_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:get_storage/get_storage.dart';
//import 'package:hive/hive.dart';
import 'componsants/contrôler/accueil_controller.dart';
import 'componsants/contrôler/splash_controller.dart';
import 'componsants/pages/categorie/categorie_controller.dart';
import 'componsants/pages/coming/coming_Controller.dart';
import 'componsants/pages/favorit/favorit_controller.dart';
import 'componsants/pages/historique_ommande/historique_commande_controller.dart';
import 'componsants/pages/login/login_controller.dart';
import 'componsants/pages/panier/commander/commander_controller.dart';
import 'componsants/pages/panier/panier_controller.dart';
import 'componsants/pages/profil/profile_controller.dart';
import 'componsants/pages/recherche/recherche_controller.dart';
import 'componsants/pages/splash.dart';
import 'componsants/pages/vendeur/creation/creation_controller.dart';
import 'componsants/pages/vendeur/formulaire_adhesion/formulaire_adhesion_controller.dart';
import 'componsants/pages/vendeur/vendeur_controller.dart';
import 'utile/langues/traduction.dart';

void main() async {
  await GetStorage.init();
  //
  SplashController splashController = Get.put(SplashController());
  LoginController loginController = Get.put(LoginController());
  CategorieController categorieController = Get.put(CategorieController());
  PanierController panierController = Get.put(PanierController());
  AccueilController accueilController = Get.put(AccueilController());
  ProfileControllers profileController = Get.put(ProfileControllers());
  CommanderController commanderController = Get.put(CommanderController());
  RechercheController rechercheController = Get.put(RechercheController());
  VendeurController vendeurController = Get.put(VendeurController());
  FavoritController favoritController = Get.put(FavoritController());
  HistoriqueCommandeController historiqueCommandeController =
      Get.put(HistoriqueCommandeController());
  FormulaireAdhesionController formulaireAdhesionController =
      Get.put(FormulaireAdhesionController());
  //
  CreationController creationController = Get.put(CreationController());
  ProduitController produitController = Get.put(ProduitController());
  ComingController comingController = Get.put(ComingController());
  //
  categorieController.getCategorie();
  profileController.checkAffiche();
  /*
  var path = Directory.current.path;
  Hive.init(path);
  await Hive.openBox('utilisateur');
  await Hive.openBox("pioche");
  await Hive.openBox("bon");
  */
  //await GetStorage.init();
  //
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.yellow.shade700));
  //
  runApp(Pepite());
}

class Pepite extends StatelessWidget {
  Pepite({Key? key}) : super(key: key);

  MaterialColor white = const MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );

  @override
  Widget build(BuildContext context) {
    //FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return GetMaterialApp(
      title: 'Afri-Culture',
      debugShowCheckedModeBanner: false,
      translations: Traduction(),
      locale: const Locale(
          'fr', 'FR'), // translations will be displayed in that locale
      fallbackLocale: const Locale('en', 'US'), //en_US
      //primarySwatch: white,
      theme: ThemeData.from(
              colorScheme: const ColorScheme.light(), textTheme: TextTheme())
          .copyWith(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.yellow,
            sizeConstraints: BoxConstraints.loose(Size(40, 40))),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: Colors.yellow.shade700,
          linearMinHeight: 1.5,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.blue,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.blue,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: Colors.purple,
            backgroundColor: Colors.green,
          ),
        ),
      ),
      home: Splash(),
    );
  }
}
