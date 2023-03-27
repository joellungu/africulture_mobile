import 'package:africulture_mobile/componsants/pages/panier/adresse/adresse_controller.dart';
import 'package:africulture_mobile/componsants/pages/panier/paiement/validation_controller.dart';
import 'package:africulture_mobile/componsants/pages/produits/produit_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'componsants/contrôler/accueil_controller.dart';
import 'componsants/contrôler/splash_controller.dart';
import 'componsants/pages/categorie/categorie_controller.dart';
import 'componsants/pages/coming/coming_Controller.dart';
import 'componsants/pages/favorit/favorit_controller.dart';
import 'componsants/pages/historique_ommande/historique_commande_controller.dart';
import 'componsants/pages/login/login_controller.dart';
import 'componsants/pages/panier/commander/commander_controller.dart';
import 'componsants/pages/panier/expedition/expedition_controller.dart';
import 'componsants/pages/panier/panier_controller.dart';
import 'componsants/pages/profil/profile_controller.dart';
import 'componsants/pages/recherche/recherche_controller.dart';
import 'componsants/pages/splash.dart';
//import 'componsants/pages/vendeur/creation/creation_controller.dart';
//import 'componsants/pages/vendeur/formulaire_adhesion/formulaire_adhesion_controller.dart';
//import 'componsants/pages/vendeur/profil_vendeur/commande_vendeur/commande_vendeur_controller.dart';
//import 'componsants/pages/vendeur/vendeur_controller.dart';
import 'utile/langues/traduction.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

void main() async {
  await GetStorage.init();
  //
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  //
  Get.put(SplashController());
  Get.put(LoginController());
  CategorieController categorieController = Get.put(CategorieController());
  Get.put(PanierController());
  Get.put(AccueilController());
  ProfileControllers profileController = Get.put(ProfileControllers());
  //Get.put(CommandeVendeurController());
  //Get.put(VendeurController());
  Get.put(CommanderController());
  Get.put(RechercheController());
  Get.put(FavoritController());
  Get.put(HistoriqueCommandeController());
  //Get.put(FormulaireAdhesionController());
  Get.put(AdresseController());
  Get.put(ValidationController());
  //
  //Get.put(CreationController());
  Get.put(ProduitController());
  Get.put(ComingController());
  //
  Get.put(ExpeditionController());
  //
  categorieController.getCategorie();
  profileController.checkAffiche();
  //
  await initHiveForFlutter();
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
  final HttpLink httpLink = HttpLink(
    'https://africultureshop.com/graphql',
  );

  final AuthLink authLink = AuthLink(getToken: () async => ""
      //'''Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYWZyaWN1bHR1cmVzaG9wLmNvbSIsImlhdCI6MTY2OTM4NDE3OCwibmJmIjoxNjY5Mzg0MTc4LCJleHAiOjE2NjkzODQ0NzgsImRhdGEiOnsidXNlciI6eyJpZCI6IjEifX19.iYUf69D5Do6EYJTj3nF5rAeP_irbogCWS9XaQiRxctg''',
      // OR
      // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
      );

  final Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  //
  var app = GraphQLProvider(
    client: client,
    child: Pepite(),
  );
  runApp(app);
}

class Pepite extends StatelessWidget {
  Pepite({Key? key}) : super(key: key) {
    var box = GetStorage();
    String langue = box.read("langue") ?? "fr";
    locale = langue == "fr" ? Locale('fr', 'FR') : Locale('en', 'US');
    //
  }
  var locale;

  //load() async {}

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
      locale: locale, // translations will be displayed in that locale
      fallbackLocale: const Locale('en', 'US'), //en_US
      //primarySwatch: white,
      theme: ThemeData.from(
              colorScheme: const ColorScheme.light(), textTheme: TextTheme())
          .copyWith(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.yellow,
            sizeConstraints: BoxConstraints.loose(Size(40, 40))),
        appBarTheme: AppBarTheme(
          color: Colors.yellow.shade700,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
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
