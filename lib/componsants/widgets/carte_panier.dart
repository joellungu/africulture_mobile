import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/panier/panier_controller.dart';

class CartePanier extends StatelessWidget {
  RxInt v = 1.obs;

  PanierController panierController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                //color: Colors.transparent,
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      //
                      panierController.listeProduit.removeLast();
                    },
                    icon: Icon(Icons.remove_circle_outline),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.grey.shade100,
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                //color: Colors.greenAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sleep Double Split Maxi Dress",
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("\$120.50"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 30,
                          width: 50,
                          alignment: Alignment.centerLeft,
                          child: DropdownButtonHideUnderline(
                              child: Obx(
                            () => DropdownButton(
                              value: v.value,
                              items: List.generate(
                                11,
                                (index) => DropdownMenuItem(
                                  child: Text("${index + 1}"),
                                  value: index + 1,
                                ),
                              ),
                              onChanged: (Object? value) {
                                v.value = value as int;
                              },
                            ),
                          )),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300)),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
