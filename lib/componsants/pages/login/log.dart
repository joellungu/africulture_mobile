import 'dart:convert';
import 'package:africulture_mobile/componsants/pages/login/login.dart';
import 'package:africulture_mobile/componsants/pages/profil/profile_controller.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class Log extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Log();
  }
}

class _Log extends State<Log> {
  //
  final _formKey = GlobalKey<FormState>();

  final numeroC = TextEditingController();
  //
  final pwC = TextEditingController();
  //
  final phone = TextEditingController();
  //
  var box = GetStorage();
  bool showPw = true;
  //
  RxString cd = "+243".obs;
  //
  final countryPicker = const FlCountryCodePicker();
  ProfileControllers profileController = Get.find();
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.yellow.shade700,
          //appBar: AppBar(),
          body: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      //width: 100,
                      height: 40,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: Colors.white,
                          ),
                          Text(
                            "", //S'identifier ou S'inscrire"
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(40),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 150,
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              image: const DecorationImage(
                                image: ExactAssetImage(
                                  "assets/africulture_sarlu_logo.png",
                                ),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          "AFRICULTURE SHOP",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  height: Get.size.height / 1.35,
                  width: Get.size.width,
                  // ignore: sort_child_properties_last
                  child: ListView(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Bienvenue",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Nom d'utilisateur",
                                // border: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(10),
                                // ),
                                prefixIcon: Icon(Icons.person),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Veuillez saisir votre nom d'utilisateur";
                                }
                                return null;
                              },
                              controller: numeroC,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              obscureText: showPw,
                              decoration: InputDecoration(
                                labelText: "Mot de passe",
                                // border: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(10),
                                // ),
                                prefixIcon: Icon(Icons.lock),
                                suffix: InkWell(
                                  onTap: () {
                                    setState(() {
                                      showPw ? showPw = false : showPw = true;
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Veuillez saisir le mot de passe";
                                }
                                return null;
                              },
                              controller: pwC,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.yellow.shade800,
                                  ),
                                  overlayColor: MaterialStateProperty.all(
                                    Colors.red.shade100,
                                  ),
                                ),
                                onPressed: () async {
                                  //Get.find();
                                  if (_formKey.currentState!.validate()) {
                                    Get.dialog(
                                      const Center(
                                        child: SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                    );
                                    var headers = {
                                      'Content-Type': 'application/json'
                                    };
                                    var request = http.Request(
                                        'POST',
                                        Uri.parse(
                                            'https://africultureshop.com/graphql'));
                                    request.body =
                                        '''{"query":"mutation LoginUser {\\r\\n  login( input: {\\r\\n    clientMutationId: \\"uniqueId\\",\\r\\n    password: \\"${pwC.text}\\",\\r\\n    username: \\"${numeroC.text}\\"\\r\\n  } ) {\\r\\n    authToken\\r\\n    user {\\r\\n      id\\r\\n      databaseId\\r\\n      name\\r\\n    }\\r\\n  }\\r\\n}","variables":{}}''';

                                    request.headers.addAll(headers);

                                    http.StreamedResponse response =
                                        await request.send();

                                    if (response.statusCode == 200) {
                                      var box = GetStorage();
                                      String m =
                                          await response.stream.bytesToString();
                                      Map e = json.decode(m);
                                      box.write("authToken",
                                          "${e['data']['login']['authToken']}");
                                      //
                                      profileController.infosPerso.value =
                                          e['data']['login']['user'];
                                      box.write("name",
                                          e['data']['login']['user']['name']);
                                      //
                                      Get.back();
                                      print(m);
                                      Get.snackbar("Succès",
                                          "Bienvenu ${e['data']['login']['user']['name']}");
                                    } else {
                                      print(response.reasonPhrase);
                                      Get.back();
                                      Get.snackbar("Erreur",
                                          "Bienvenu ${response.reasonPhrase}");
                                    }
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Se connecter",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      /*
                      TextButton(
                        onPressed: () {
                          //
                        },
                        child: const Text(
                          "Mot de passe oublié ?",
                          style: TextStyle(
                            textBaseline: TextBaseline.alphabetic,
                            decoration: TextDecoration.underline,
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      */
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.grey.shade200,
                          ),
                          overlayColor: MaterialStateProperty.all(
                            Colors.red.shade100,
                          ),
                        ),
                        onPressed: () {
                          //
                          Get.to(Login());
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: const Text(
                            "Inscrivez-vous",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle styleDeMenu() {
    return TextStyle(
      color: Colors.grey,
      fontSize: 13,
      fontWeight: FontWeight.normal,
    );
  }
}
