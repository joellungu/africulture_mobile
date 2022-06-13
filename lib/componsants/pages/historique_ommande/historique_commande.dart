import 'package:africulture_mobile/componsants/pages/panier/adresse/adresse_controller.dart';
import 'package:africulture_mobile/componsants/pages/profil/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/carte_panier.dart';
import 'historique_commande_controller.dart';

class HistoriqueCommande extends StatelessWidget {
  HistoriqueCommandeController historiqueCommandeController = Get.find();
  ProfileControllers profileController = Get.find();
  AdresseController adresseController = Get.find();

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historique de commandes"),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
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
      body: Obx(
        () => ListView(
          children: List.generate(
              historiqueCommandeController.listeCommande.value.length, (index) {
            var c = historiqueCommandeController.listeCommande.value[index];
            return ListTile(
              onTap: () {
                print(c);
                Get.to(DetailsCommande(c));
              },
              leading: Icon(Icons.date_range),
              title: Text("${c['nom']}"),
              subtitle: Text("${c['date']}"),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.calendar_month),
        onPressed: () {
          String numero = "${profileController.infosPerso['numero']}";
          String code = "${profileController.infosPerso['codePostal']}";
          String date = "${DateTime.now()}";

          //String code, String numero, String date
          print("${profileController.infosPerso}");
          showDatePicker(
            context: context,
            initialDatePickerMode: DatePickerMode.day,
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(3000),
          ).then((value) =>
              historiqueCommandeController.commandeDuMois(code, numero, date));
        },
      ),
    );
  }
}

class DetailsCommande extends StatefulWidget {
  var c;
  DetailsCommande(this.c);
  @override
  State<StatefulWidget> createState() {
    return _DetailsCommande();
  }
}

class _DetailsCommande extends State<DetailsCommande>
    with TickerProviderStateMixin {
  List angles = ["Commande", "Adresse"];
  late TabController controller;
  List lis = [];

  @override
  void initState() {
    //
    controller = TabController(length: angles.length, vsync: this);
    //
    super.initState();
    //
    lis = widget.c['panier']['liste'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Détails de la commandes"),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
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
      body: Column(
        children: [
          Container(
            height: 40,
            //color: Colors.blue,
            alignment: Alignment.center,
            child: TabBar(
              isScrollable: true,
              controller: controller,
              indicatorWeight: 1,
              //indicator: BoxDecoration(),
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
              tabs: List.generate(angles.length, (index) {
                return Tab(
                  text: angles[index],
                );
              }),
            ),
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              controller: controller,
              children: [
                ListView(
                  children: List.generate(lis.length, (index) {
                    var cc = lis[index];
                    return RichText(
                      text: TextSpan(text: "", children: []),
                    );
                  }),
                ),
                Container(
                  child: RichText(
                    text: TextSpan(
                      text: "",
                      children: [],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
