import 'dart:async';
import 'package:africulture_mobile/componsants/pages/login/creer_compte.dart';
import 'package:africulture_mobile/componsants/pages/panier/commander/commander.dart';
import 'package:africulture_mobile/componsants/pages/panier/expedition/expedition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'principale.dart';

class Splash extends StatelessWidget {
  //
  final box = GetStorage();
  //
  checkLogin() async {
    Timer(const Duration(seconds: 3), () {
      //Je ne me rappel plus pourquoi...
      if (box.read("unique") == null) {
        box.write("unique", "");
      }
      //
      Get.off(() => Principale());
      //Get.off(() => CreerCompte());
      // Principale());//Commander
    });
    //
    //return splashController.getLoger();
  }

  Splash() {
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: Get.size.height / 3,
          width: Get.size.width / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: ExactAssetImage("assets/africulture_sarlu_logo.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
