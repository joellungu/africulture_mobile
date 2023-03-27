import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../contrôler/historique_controller.dart';

class HistoriqueBon extends StatelessWidget {
  HistoriqueController historiqueBonController =
      Get.put(HistoriqueController());

  HistoriqueBon() {
    historiqueBonController.getListe();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (historiqueBonController.showDetails.value) {
        return ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              color: Colors.green,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width / 1.1,
              //color: Colors.blueGrey,
              padding: const EdgeInsets.all(30),
              alignment: Alignment.center,
              child: PrettyQr(
                //image: AssetImage('images/twitter.png'),
                typeNumber: 3,
                size: 450,
                data: historiqueBonController.detailsBon.value[
                    "serie"], //quand je pioche je fait une requette et c'est ici la reponse...
                errorCorrectLevel: QrErrorCorrectLevel.M,
                roundEdges: true,
              ),
            ),
            Text(
              historiqueBonController.detailsBon.value["titre"],
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              historiqueBonController.detailsBon.value["provenance"],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              historiqueBonController.detailsBon.value["content"],
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              historiqueBonController.detailsBon.value["datelimite"],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green.shade700,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    historiqueBonController.showDetails.value = false;
                  },
                  child: Text("Retour"),
                )
              ],
            )
          ],
        );
      } else {
        return ListView(
          children: List.generate(
              historiqueBonController.listeHistorique.length, (index) {
            return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: EdgeInsets.all(3),
                child: ListTile(
                  onTap: () {
                    //historiqueBonController.removeElement(index);
                    //
                    historiqueBonController.detailsBon.value =
                        historiqueBonController.listeHistorique[index];
                    //
                    historiqueBonController.showDetails.value = true;
                    //Get.snackbar(
                    //  "Pioché", "Vous avez pioché le bon de Kin Marche");
                  },
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blue,
                    ),
                  ),
                  title: Text(
                    historiqueBonController.listeHistorique[index]
                        ["provenance"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      text: historiqueBonController.listeHistorique[index]
                          ["titre"],
                      children: [
                        TextSpan(
                          text: "\n",
                        ),
                        TextSpan(
                          text: historiqueBonController.listeHistorique[index]
                              ["content"],
                        ),
                        TextSpan(
                          text: "\n",
                        ),
                        TextSpan(
                          text:
                              "Date limite ${historiqueBonController.listeHistorique[index]["datelimite"]}",
                          style: TextStyle(
                            color: Colors.green.shade700,
                          ),
                        ),
                        TextSpan(
                          text: "\n",
                        ),
                        TextSpan(
                          text: "122/300 bons disponibles",
                          style: TextStyle(
                            color: Colors.green.shade700,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      }
    });
  }
}
