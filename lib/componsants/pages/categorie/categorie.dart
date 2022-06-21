import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/carte_categorie.dart';
import 'categorie_controller.dart';
import 'liste_categorie.dart';
//import 'package:get/get.dart';

class Categories extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Categories();
  }
}

class _Categories extends State<Categories> with TickerProviderStateMixin {
  CategorieController categorieController = Get.find();

  late TabController controller = TabController(
      length: categorieController.listecat.value.length, vsync: this);

  @override
  void initState() {
    //
    controller = TabController(
        length: categorieController.listecat.value.length, vsync: this);
    //
    super.initState();
    //
  }

  //
  @override
  Widget build(BuildContext context) {
    //categorieController.getCategorie();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Categorie",
        ),
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
        bottom: TabBar(
          isScrollable: true,
          controller: controller,
          indicatorWeight: 1,
          labelStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
          //indicator: BoxDecoration(),
          indicatorColor: Colors.white,
          labelColor: Colors.grey.shade300,
          unselectedLabelColor: Colors.grey.shade800,
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
          tabs:
              List.generate(categorieController.listecat.value.length, (index) {
            return Tab(
              text: categorieController.listecat.value[index]["titre"],
            );
          }),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: List.generate(
          categorieController.listecat.value.length,
          (index) {
            return ListageCategorie(
                categorieController.listecat.value[index]["titre"]);
          },
        ),
      ),
    );
  }
}

/*
SousCategorie
 */

/*
Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
            ),
            // Expanded(
            //   flex: 1,
            //   child: GridView.count(
            //     crossAxisCount: 2,
            //     mainAxisSpacing: 2,
            //     crossAxisSpacing: 2,
            //     childAspectRatio: 0.6,
            //     children: List.generate(
            //       categorieController.listecat.value.length,
            //       (index) =>
            //           CarteCategorie(categorieController.listecat[index]),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
List.generate(
                categorieController.listecat.length, (index) => Container()
                //CarteCategorie(categorieController.listecat[index]),
                ),
*/
