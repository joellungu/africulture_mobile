import 'dart:convert';
import 'package:africulture_mobile/componsants/pages/categorie/categorie_controller.dart';
import 'package:africulture_mobile/componsants/pages/vendeur/mesproduits/mesproduits_controller.dart';
import 'package:africulture_mobile/componsants/widgets/carte_mes_produit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shimmer/shimmer.dart';

class MesProduits extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MesProduits();
  }
}

class _MesProduits extends State<MesProduits> with TickerProviderStateMixin {
  CategorieController categorieController = Get.find();
  //
  final box = GetStorage();
  var vendeurInfos;
  //
  late TabController controller = TabController(
      length: categorieController.listecat.value.length, vsync: this);

  @override
  void initState() {
    //
    vendeurInfos = box.read("profil_vendeur");
    //
    controller = TabController(
        length: categorieController.listecat.value.length, vsync: this);
    //
    super.initState();
    //
  }

  @override
  Widget build(BuildContext context) {
    //categorieController.getCategorie();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mes articles",
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
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
            return ListageMesProduit(
              categorieController.listecat.value[index]["titre"],
              "${vendeurInfos['id']}",
            );
          },
        ),
      ),
    );
  }
}

class ListageMesProduit extends StatefulWidget {
  String? cat;
  String id;
  ListageMesProduit(this.cat, this.id);
  @override
  State<StatefulWidget> createState() {
    return _ListageMesProduit();
  }
}

class _ListageMesProduit extends State<ListageMesProduit> {
  Future<Widget> getProduitCategorie() async {
    MesProduitsController mesProduitsController = MesProduitsController();
    //
    print('___________${widget.cat} __ ${widget.id}_______________');
    //
    CategorieController categorieController = Get.find();
    //
    Response rep =
        await mesProduitsController.getMesProduits(widget.id, widget.cat!);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      List l = jsonDecode(rep.bodyString!);
      print(l);
      return GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 0.4,
        children: List.generate(
          l.length,
          (index) => Card(
            elevation: 0,
            child: InkWell(
                onTap: () {
                  //Get.to(() => Produit());
                },
                child: CarteMesProduite(l[index], false)),
          ),
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        child: const Icon(Icons.hourglass_empty),
      );
    }
    //
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getProduitCategorie(),
      builder: (context, t) {
        if (t.hasData) {
          return t.data as Widget;
        } else if (t.hasError) {
          return Icon(Icons.error_outline);
        }
        return Container(
          //color: Colors.green.shade200,
          height: 2.2,
          width: MediaQuery.of(context).size.width / 3,
          child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey.shade200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 200,
                  color: Colors.grey.shade100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 100,
                        width: 500,
                        color: Colors.grey.shade100,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 100,
                        width: 500,
                        color: Colors.grey.shade100,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
