import 'dart:async';
import 'package:africulture_mobile/componsants/pages/testQuery.dart';
import 'package:africulture_mobile/utile/utils.dart';
import 'package:card_swiper/card_swiper.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../widgets/carte_produit.dart';
import 'coming_Controller.dart';

class Coming extends GetView<ComingController> {
  //
  //ComingController comingController = Get.find();
  //
  Coming() {
    Timer(Duration(seconds: 1), () {
      controller.requete();
    });
  }
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //titre//Afri Culture
        title: Text(
          "titre".tr,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () async {
        //         //
        //         Get.to(TestQuery());
        //       },
        //       icon: Icon(Icons.check))
        // ],
        backgroundColor: Colors.yellow.shade700,
        elevation: 0,
        centerTitle: true,
        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.centerLeft,
        //       end: Alignment.centerRight,
        //       colors: <Color>[Colors.yellow.shade700, Colors.black],
        //     ),
        //   ),
        // ),
      ),
      body: controller.obx(
        (state) {
          print("__::${state!['promotion'].runtimeType}");
          return ListView(
            padding: const EdgeInsets.all(0),
            children: [
              state['produitP'] == null || state['produitP'].isEmpty
                  ? Container()
                  : Card(
                      elevation: 0,
                      child: Container(
                          height: MediaQuery.of(context).size.height / 5.5,
                          //color: Colors.blueAccent,
                          child: Swiper(
                            duration: 2,
                            autoplay: true,
                            itemBuilder: (BuildContext context, int i) {
                              return Container(
                                child: Image.network(
                                  "${Utils.url}/produit/image/${state['produitP'][i]['id']}/img0",
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                            itemCount: state['produitP'].length,
                            loop: true,
                            layout: SwiperLayout.DEFAULT,
                            pagination: SwiperPagination(),
                            control: SwiperControl(),
                          )),
                    ),
              state['nouveauP'] == null || state['nouveauP'].isEmpty
                  ? Container()
                  : Card(
                      elevation: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 40,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "nos_produit".tr,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height,
                            //color: Colors.blueAccent,
                            child: GridView.count(
                              mainAxisSpacing: 1,
                              crossAxisSpacing: 1,
                              childAspectRatio: 0.7,
                              //scrollDirection: Axis.horizontal,
                              crossAxisCount: 3,
                              children: List.generate(
                                state['nouveauP'].length,
                                (index) => CarteProduite(
                                  state['nouveauP'][index],
                                  false,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
              state['meilleurV'] == null || state['meilleurV'].isEmpty
                  ? Container()
                  : Card(
                      elevation: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 40,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              " Meillieur vente".tr,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 2.5,
                            //color: Colors.blueAccent,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: List.generate(
                                state['meilleurV'].length,
                                (index) => CarteProduite(
                                    state['meilleurV'][index], false),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
              state['promotion'] == null || state['promotion'].isEmpty
                  ? Container()
                  : Card(
                      elevation: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 40,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              " En promotion".tr,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 2.5,
                            //color: Colors.blueAccent,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: List.generate(
                                state['promotion'].length,
                                (index) => CarteProduite(
                                    state['promotion'][index], true),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
            ],
          );
        },
        onLoading: Center(
          child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey.shade200,
            child: Column(
              children: [
                Container(
                  height: 100,
                  color: Colors.green,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Card(
                      elevation: 1,
                      child: Container(
                        height: 100,
                        width: 100,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            color: Colors.amber,
                            child: Card(
                              elevation: 1,
                              child: Container(
                                height: 20,
                                width: 250,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            color: Colors.amber,
                            child: Card(
                              elevation: 1,
                              child: Container(
                                height: 20,
                                width: 250,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            color: Colors.amber,
                            child: Card(
                              elevation: 1,
                              child: Container(
                                height: 20,
                                width: 250,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.green,
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.green,
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 200,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 20,
                                  width: 200,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Card(
                      elevation: 1,
                      child: Container(
                        height: 100,
                        width: 100,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              color: Colors.amber,
                              child: Card(
                                elevation: 1,
                                child: Container(
                                  height: 20,
                                  width: 250,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              color: Colors.amber,
                              child: Card(
                                elevation: 1,
                                child: Container(
                                  height: 20,
                                  width: 250,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              color: Colors.amber,
                              child: Card(
                                elevation: 1,
                                child: Container(
                                  height: 20,
                                  width: 250,
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
        onEmpty: const Center(
          child: Icon(
            Icons.cloud_download_outlined,
            size: 150,
          ),
        ),
        onError: (erreur) => const Center(
          child: Icon(
            Icons.cloud_download_outlined,
            size: 150,
          ),
        ),
      ),
    );
  }
}
