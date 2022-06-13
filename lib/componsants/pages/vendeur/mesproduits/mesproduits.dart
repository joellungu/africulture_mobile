import 'package:africulture_mobile/componsants/pages/categorie/categorie_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MesProduits extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MesProduits();
  }
}

class _MesProduits extends State<MesProduits> with TickerProviderStateMixin {
  CategorieController categorieController = Get.find();

  //
  @override
  Widget build(BuildContext context) {
    //categorieController.getCategorie();

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

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Categorie",
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {},
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
            return Container(
                //categorieController.listecat.value[index]["titre"]
                );
          },
        ),
      ),
    );
  }
}
