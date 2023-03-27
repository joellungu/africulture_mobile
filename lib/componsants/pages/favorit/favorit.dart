import 'package:africulture_mobile/componsants/widgets/carte_produit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../panier/commander/commander.dart';
import 'favorit_controller.dart';

class Favorit extends GetView<FavoritController> {
  FavoritController favoritController = Get.find();
  //
  Favorit() {
    controller.getAllFavorit();
  }
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("favoris".tr),
        //backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 10,
            ),
            controller.obx(
              (state) => Expanded(
                flex: 1,
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  childAspectRatio: 0.5,
                  children: List.generate(
                    state!.length,
                    (index) => CarteProduite(state[index], true),
                  ),
                ),
              ),
              onLoading: Expanded(
                flex: 1,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
              onEmpty: Container(),
              onError: (erreur) => const Center(
                child: Icon(
                  Icons.cloud_download_outlined,
                  size: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
