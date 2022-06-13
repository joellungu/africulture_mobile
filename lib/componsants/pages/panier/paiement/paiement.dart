import 'package:africulture_mobile/componsants/pages/panier/panier_controller.dart';
import 'package:africulture_mobile/componsants/widgets/carte_panier.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../commander/commander_controller.dart';
import 'validation.dart';

enum BestTutorSite { VISA, MASTERCARD, MPESA, ORANGEMONEY, AIRTELMONEY }

class Paiement extends StatefulWidget {
  PageController pageController = PageController();
  //
  List<String> titres = [];
  //
  Paiement(this.pageController, this.titres);

  @override
  State<StatefulWidget> createState() {
    return _Paiement();
  }
}

class _Paiement extends State<Paiement> {
  //
  BestTutorSite _site = BestTutorSite.VISA;
  //

  PanierController panierController = Get.find();
  CommanderController commanderController = Get.find();
  //
  double conte = Get.width / 4;
  int i = 1;
  //
  @override
  void initState() {
    //
    print("Je suis dans le paiement déjà!");
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  title: const Text(
                    'VISA',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    'VISA',
                    style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        ),
                  ),
                  trailing: Icon(Icons.credit_card_outlined),
                  leading: Radio(
                    value: BestTutorSite.VISA,
                    groupValue: _site,
                    onChanged: (BestTutorSite? value) {
                      setState(() {
                        _site = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text(
                    'MASTERCARD',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    'MASTERCARD',
                    style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        ),
                  ),
                  trailing: Icon(Icons.credit_card_outlined),
                  leading: Radio(
                    value: BestTutorSite.MASTERCARD,
                    groupValue: _site,
                    onChanged: (BestTutorSite? value) {
                      setState(() {
                        _site = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text(
                    'MPESA',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    'MPESA',
                    style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        ),
                  ),
                  trailing: Icon(Icons.phone_android),
                  leading: Radio(
                    value: BestTutorSite.MPESA,
                    groupValue: _site,
                    onChanged: (BestTutorSite? value) {
                      setState(() {
                        _site = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text(
                    'ORANGEMONEY',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    'ORANGEMONEY',
                    style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        ),
                  ),
                  trailing: Icon(Icons.phone_android),
                  leading: Radio(
                    value: BestTutorSite.ORANGEMONEY,
                    groupValue: _site,
                    onChanged: (BestTutorSite? value) {
                      setState(() {
                        _site = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text(
                    'AIRTELMONEY',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    'AIRTELMONEY',
                    style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        ),
                  ),
                  trailing: Icon(Icons.phone_android),
                  leading: Radio(
                    value: BestTutorSite.AIRTELMONEY,
                    groupValue: _site,
                    onChanged: (BestTutorSite? value) {
                      setState(() {
                        _site = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    Get.to(Validation());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    child: Text(
                      "Commancer",
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
                        colors: <Color>[Colors.yellow.shade700, Colors.black],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 40,
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  if (i > 0) {
                    print("Avant: $i");
                    i--;
                    print("Après: $i");
                    commanderController.avancement.value =
                        commanderController.avancement.value - conte;
                    commanderController.titre.value = "Commandes";
                    widget.pageController.previousPage(
                      duration: Duration(seconds: 1),
                      curve: Curves.ease,
                    );
                  }
                },
                child: const Text("Retour"),
              ),
              Container(),
            ],
          ),
        )
      ],
    );
  }
}
