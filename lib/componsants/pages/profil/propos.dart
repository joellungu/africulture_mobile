import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Propos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("À propos"),
        leading: IconButton(
          onPressed: () {
            //
            Get.back();
          },
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Text(
              """Magna ad nostrud enim anim exercitation enim incididunt. Ipsum velit veniam nostrud est ut labore do eiusmod duis pariatur ex voluptate. Aliqua est enim qui deserunt proident eiusmod mollit fugiat.

Amet enim consectetur nisi consectetur proident ipsum ex. Ullamco in do qui excepteur sunt cupidatat. Irure fugiat ullamco minim consectetur nisi laboris incididunt esse nisi irure aute sunt. Quis dolore pariatur culpa laboris voluptate. Tempor ullamco deserunt sunt magna proident ipsum labore ullamco aute veniam aliqua. Voluptate quis irure consectetur ullamco officia occaecat dolore aute minim sunt aute velit non.

Sint reprehenderit ex eiusmod amet quis mollit. Veniam nostrud eiusmod enim excepteur proident consequat culpa non nisi sint fugiat laborum labore. Non incididunt culpa ea quis id excepteur duis ex laboris duis. Pariatur culpa Lorem consectetur irure occaecat laborum.

Nostrud Lorem laboris excepteur enim nulla eu. Eu excepteur tempor eiusmod id qui. Excepteur minim cillum eiusmod occaecat excepteur. Lorem velit culpa nostrud minim labore pariatur veniam sit. Esse laboris officia consequat aute voluptate amet sint aliquip sunt est. Adipisicing enim cupidatat dolore aliqua aute adipisicing occaecat occaecat. Laboris est Lorem amet tempor aliquip magna.

In id velit cupidatat velit anim. Ipsum incididunt nulla et et consequat excepteur amet ea excepteur id ad eu reprehenderit elit. Cupidatat voluptate proident occaecat veniam Lorem incididunt reprehenderit officia eiusmod minim. Ex aliquip sunt dolore est culpa minim pariatur duis pariatur.

Duis eiusmod pariatur adipisicing nulla incididunt veniam anim occaecat ad deserunt. Cillum aliquip irure cillum nostrud exercitation deserunt mollit. Dolor velit nostrud id mollit nulla sunt esse elit sunt labore commodo sunt ipsum id. Elit exercitation deserunt et et culpa Lorem anim consectetur labore proident esse aute ullamco anim. Occaecat consectetur esse nostrud in non fugiat enim id amet. Est fugiat labore cillum occaecat est esse in.

Officia nulla consequat non irure qui aliquip laboris proident do ea veniam nisi dolor in. Reprehenderit commodo ipsum veniam officia aliquip. Consectetur culpa voluptate laborum in aute nisi officia commodo commodo. Deserunt velit ex et officia anim excepteur. Sit labore culpa sit adipisicing exercitation mollit ad do."""),
        ],
      ),
    );
  }
}
