import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../widgets/carte_produit.dart';
import 'coming_Controller.dart';

class Coming extends StatelessWidget {
  //
  ComingController comingController = Get.find();
  //
  Coming() {
    comingController.nouvelleP();
  }
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Afri Culture",
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
      ),
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Card(
            elevation: 0,
            child: Container(
                height: MediaQuery.of(context).size.height / 5.5,
                //color: Colors.blueAccent,
                child: Swiper(
                  duration: 2,
                  autoplay: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      "assets/omg (${index + 1}).jpg",
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount: 4,
                  loop: true,
                  layout: SwiperLayout.DEFAULT,
                  pagination: SwiperPagination(),
                  control: SwiperControl(),
                )),
          ),
          comingController.loadN.value == 1
              ? Card(
                  elevation: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 40,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          " Nouvelle articles".tr,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        //color: Colors.blueAccent,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            comingController.loadNListe.value.length,
                            (index) => CarteProduite(false, index),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : comingController.loadN.value == 0
                  ? Container(
                      child: Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Colors.grey.shade200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(children: [
                              Container(
                                height: 100,
                                width: 150,
                                color: Colors.grey.shade100,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                color: Colors.grey.shade100,
                              ),
                              Container(
                                height: 100,
                                width: 50,
                                color: Colors.grey.shade100,
                              ),
                            ]),
                            Row(children: [
                              Container(
                                height: 100,
                                width: 150,
                                color: Colors.grey.shade100,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                color: Colors.grey.shade100,
                              ),
                              Container(
                                height: 100,
                                width: 50,
                                color: Colors.grey.shade100,
                              ),
                            ]),
                            Row(children: [
                              Container(
                                height: 100,
                                width: 150,
                                color: Colors.grey.shade100,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                color: Colors.grey.shade100,
                              ),
                              Container(
                                height: 100,
                                width: 50,
                                color: Colors.grey.shade100,
                              ),
                            ]),
                          ],
                        ),
                      ),
                    )
                  : Container(),
          Card(
            elevation: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " Meillieur vente".tr,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  //color: Colors.blueAccent,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      5,
                      (index) => CarteProduite(false, index + 6),
                    ),
                  ),
                )
              ],
            ),
          ),
          Card(
            elevation: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " En promotion".tr,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  //color: Colors.blueAccent,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      5,
                      (index) => CarteProduite(true, index + 12),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
