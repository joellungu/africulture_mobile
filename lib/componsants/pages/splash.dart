import 'dart:async';
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
      //
      if (box.read("unique") == null) {
        box.write("unique", "");
      }
      //
      Get.off(() => Principale());
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
    return const Scaffold(
      body: Center(child: Text("AfriCulture")),
    );
  }
}
