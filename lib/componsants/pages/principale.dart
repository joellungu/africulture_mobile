import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import '../contrôler/splash_controller.dart';
import 'accueil.dart';
//import 'login/login.dart';

class Principale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //SplashController splashController = Get.find();
    return Scaffold(
      body: Accueil(),
    );
  }
}
//: Login()