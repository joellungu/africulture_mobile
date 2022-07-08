import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MensionLegale extends StatelessWidget {
  bool typeVendeur = true;
  PageController pageController;
  MensionLegale(this.typeVendeur, this.pageController);
  RxBool value1 = false.obs;

  void valider() {
    //int v = pageController.initialPage;
    //print("page int: $v");
    if (!value1.value) {
      Get.snackbar(
        "Erreur",
        "Vous n'avez pas accepté les conditions d'utilisation",
        overlayColor: Colors.yellow.shade700,
      );
    } else {
      pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: typeVendeur
          ? ListView(
              padding: EdgeInsets.all(20),
              children: [
                const Text(
                    "Sint Lorem laborum voluptate enim ipsum dolor ipsum mollit. Non ullamco culpa amet fugiat eu culpa in enim in laborum magna. Ex ea eiusmod ut dolor tempor consequat eu laborum."),
                SizedBox(
                  height: 10,
                ),
                ExpandablePanel(
                  header: Text(
                    "Réglementation 1",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  collapsed: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum",
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum exercitation adipisicing. Esse et voluptate dolore labore officia sit excepteur aliqua cupidatat consectetur esse est anim qui. Dolor pariatur reprehenderit anim laborum mollit velit do veniam mollit. Id aliquip Lorem amet non ipsum et est. Labore pariatur qui ipsum elit ad deserunt dolore labore ex sit non sit nisi Lorem.",
                    softWrap: true,
                  ),
                ),
                ExpandablePanel(
                  header: Text(
                    "Réglementation 1",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  collapsed: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum",
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum exercitation adipisicing. Esse et voluptate dolore labore officia sit excepteur aliqua cupidatat consectetur esse est anim qui. Dolor pariatur reprehenderit anim laborum mollit velit do veniam mollit. Id aliquip Lorem amet non ipsum et est. Labore pariatur qui ipsum elit ad deserunt dolore labore ex sit non sit nisi Lorem.",
                    softWrap: true,
                  ),
                ),
                ExpandablePanel(
                  header: Text(
                    "Réglementation 1",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  collapsed: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum",
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum exercitation adipisicing. Esse et voluptate dolore labore officia sit excepteur aliqua cupidatat consectetur esse est anim qui. Dolor pariatur reprehenderit anim laborum mollit velit do veniam mollit. Id aliquip Lorem amet non ipsum et est. Labore pariatur qui ipsum elit ad deserunt dolore labore ex sit non sit nisi Lorem.",
                    softWrap: true,
                  ),
                ),
                ExpandablePanel(
                  header: Text(
                    "Réglementation 1",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  collapsed: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum",
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum exercitation adipisicing. Esse et voluptate dolore labore officia sit excepteur aliqua cupidatat consectetur esse est anim qui. Dolor pariatur reprehenderit anim laborum mollit velit do veniam mollit. Id aliquip Lorem amet non ipsum et est. Labore pariatur qui ipsum elit ad deserunt dolore labore ex sit non sit nisi Lorem.",
                    softWrap: true,
                  ),
                ),
                ExpandablePanel(
                  header: Text(
                    "Réglementation 1",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  collapsed: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum",
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum exercitation adipisicing. Esse et voluptate dolore labore officia sit excepteur aliqua cupidatat consectetur esse est anim qui. Dolor pariatur reprehenderit anim laborum mollit velit do veniam mollit. Id aliquip Lorem amet non ipsum et est. Labore pariatur qui ipsum elit ad deserunt dolore labore ex sit non sit nisi Lorem.",
                    softWrap: true,
                  ),
                ),
                ExpandablePanel(
                  header: Text(
                    "Réglementation 1",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  collapsed: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum",
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum exercitation adipisicing. Esse et voluptate dolore labore officia sit excepteur aliqua cupidatat consectetur esse est anim qui. Dolor pariatur reprehenderit anim laborum mollit velit do veniam mollit. Id aliquip Lorem amet non ipsum et est. Labore pariatur qui ipsum elit ad deserunt dolore labore ex sit non sit nisi Lorem.",
                    softWrap: true,
                  ),
                ),
                ExpandablePanel(
                  header: Text(
                    "Réglementation 1",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  collapsed: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum",
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum exercitation adipisicing. Esse et voluptate dolore labore officia sit excepteur aliqua cupidatat consectetur esse est anim qui. Dolor pariatur reprehenderit anim laborum mollit velit do veniam mollit. Id aliquip Lorem amet non ipsum et est. Labore pariatur qui ipsum elit ad deserunt dolore labore ex sit non sit nisi Lorem.",
                    softWrap: true,
                  ),
                ),
                Obx(
                  () => CheckboxListTile(
                    value: value1.value,
                    title: const Text(
                      "J'accepte les conditions d'utilisation",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onChanged: (t) {
                      value1.value = t!;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: valider,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    child: Text(
                      "Continuer",
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
            )
          : ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Text(
                    "Sint Lorem laborum voluptate enim ipsum dolor ipsum mollit. Non ullamco culpa amet fugiat eu culpa in enim in laborum magna. Ex ea eiusmod ut dolor tempor consequat eu laborum."),
                const SizedBox(
                  height: 10,
                ),
                ExpandablePanel(
                  header: Text(
                    "Réglementation 1",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  collapsed: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum",
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum exercitation adipisicing. Esse et voluptate dolore labore officia sit excepteur aliqua cupidatat consectetur esse est anim qui. Dolor pariatur reprehenderit anim laborum mollit velit do veniam mollit. Id aliquip Lorem amet non ipsum et est. Labore pariatur qui ipsum elit ad deserunt dolore labore ex sit non sit nisi Lorem.",
                    softWrap: true,
                  ),
                ),
                ExpandablePanel(
                  header: Text(
                    "Réglementation 1",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  collapsed: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum",
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum exercitation adipisicing. Esse et voluptate dolore labore officia sit excepteur aliqua cupidatat consectetur esse est anim qui. Dolor pariatur reprehenderit anim laborum mollit velit do veniam mollit. Id aliquip Lorem amet non ipsum et est. Labore pariatur qui ipsum elit ad deserunt dolore labore ex sit non sit nisi Lorem.",
                    softWrap: true,
                  ),
                ),
                ExpandablePanel(
                  header: Text(
                    "Réglementation 1",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  collapsed: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum",
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum exercitation adipisicing. Esse et voluptate dolore labore officia sit excepteur aliqua cupidatat consectetur esse est anim qui. Dolor pariatur reprehenderit anim laborum mollit velit do veniam mollit. Id aliquip Lorem amet non ipsum et est. Labore pariatur qui ipsum elit ad deserunt dolore labore ex sit non sit nisi Lorem.",
                    softWrap: true,
                  ),
                ),
                ExpandablePanel(
                  header: Text(
                    "Réglementation 1",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  collapsed: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum",
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum exercitation adipisicing. Esse et voluptate dolore labore officia sit excepteur aliqua cupidatat consectetur esse est anim qui. Dolor pariatur reprehenderit anim laborum mollit velit do veniam mollit. Id aliquip Lorem amet non ipsum et est. Labore pariatur qui ipsum elit ad deserunt dolore labore ex sit non sit nisi Lorem.",
                    softWrap: true,
                  ),
                ),
                ExpandablePanel(
                  header: Text(
                    "Réglementation 1",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  collapsed: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum",
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum exercitation adipisicing. Esse et voluptate dolore labore officia sit excepteur aliqua cupidatat consectetur esse est anim qui. Dolor pariatur reprehenderit anim laborum mollit velit do veniam mollit. Id aliquip Lorem amet non ipsum et est. Labore pariatur qui ipsum elit ad deserunt dolore labore ex sit non sit nisi Lorem.",
                    softWrap: true,
                  ),
                ),
                ExpandablePanel(
                  header: Text(
                    "Réglementation 1",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  collapsed: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum",
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Text(
                    "Ullamco occaecat anim nostrud sit dolore esse quis cillum exercitation adipisicing. Esse et voluptate dolore labore officia sit excepteur aliqua cupidatat consectetur esse est anim qui. Dolor pariatur reprehenderit anim laborum mollit velit do veniam mollit. Id aliquip Lorem amet non ipsum et est. Labore pariatur qui ipsum elit ad deserunt dolore labore ex sit non sit nisi Lorem.",
                    softWrap: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => CheckboxListTile(
                    value: value1.value,
                    title: const Text(
                      "J'accepte les conditions d'utilisation",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onChanged: (t) {
                      value1.value = t!;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: valider,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    child: Text(
                      "Continuer",
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
    );
  }
}
