import 'dart:async';
import 'dart:convert';
import 'package:africulture_mobile/componsants/pages/profil/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../contrôler/splash_controller.dart';
import 'login_controller.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  bool logBool = true;
  //
  SplashController splashController = Get.find();
  //
  LoginController loginController = Get.find();
  //
  ProfileControllers profileController = Get.find();
  //
  //
  final _formKey = GlobalKey<FormState>();
  ////,,,
  final username = TextEditingController();
  //
  final firstName = TextEditingController();
  //
  final nickname = TextEditingController();
  //
  final lastName = TextEditingController();
  //
  final email = TextEditingController();
  //
  final mobile = TextEditingController();
  //
  final mdp = TextEditingController();
  final mdpC = TextEditingController();
  //
  bool accepte = false;
  bool showCode1 = false;
  bool showCode2 = false;
  //
  final code_ref = TextEditingController();

  RxString cd = "+243".obs;
  String sexe = "F";
  String dateNaissance = "";
  //
  //final countryPicker = const FlCountryCodePicker();

  @override
  void initState() {
    super.initState();

    /*
    _emailController.addListener(() {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Email value ${_emailController.text}"),
      ));
    });
    */
  }

  @override
  void dispose() {
    //_numero.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow.shade700, // Status bar color
      child: SafeArea(
        //
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.yellow.shade700,
                  Color(0xFFFFFFFF),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              //
                              Get.back();
                              //
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
                                    Icons.arrow_back_ios,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "Inscription",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        // ignore: sort_child_properties_last
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  "Informations personnelles",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Votre d'utilisateur",
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
                                  controller: username,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Votre Postnom",
                                    // border: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(10),
                                    // ),
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Veuillez saisir votre Postnom";
                                    }
                                    return null;
                                  },
                                  controller: lastName,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Votre prénom",
                                    // border: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(10),
                                    // ),
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Veuillez saisir votre prénom";
                                    }
                                    return null;
                                  },
                                  controller: firstName,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Votre surnom",
                                    // border: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(10),
                                    // ),
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Veuillez saisir votre surnom";
                                    }
                                    return null;
                                  },
                                  controller: nickname,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    // border: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(10),
                                    // ),
                                    prefixIcon: Icon(Icons.email),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Veuillez saisir votre email";
                                    }
                                    return null;
                                  },
                                  controller: email,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  obscureText: showCode1,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: "Mot de passe",
                                    // border: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(10),
                                    // ),
                                    suffix: InkWell(
                                      onTap: () {
                                        setState(() {
                                          showCode1 = !showCode1;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.remove_red_eye,
                                      ),
                                    ),
                                    prefixIcon: const Icon(Icons.lock),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Veuillez saisir votre mot de passe";
                                    } else if (value != mdpC.text) {
                                      return "Le mot de passe n'est pas identique";
                                    }
                                    return null;
                                  },
                                  controller: mdp,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  obscureText: showCode2,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: "Confirmez mot de passe",
                                    // border: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(10),
                                    // ),
                                    suffix: InkWell(
                                      onTap: () {
                                        setState(() {
                                          showCode2 = !showCode2;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.remove_red_eye,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.lock),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Veuillez saisir votre mot de passe pour confirmer";
                                    } else if (value != mdp.text) {
                                      return "Le mot de passe n'est pas identique";
                                    }
                                    return null;
                                  },
                                  controller: mdpC,
                                ),
                                // const SizedBox(
                                //   height: 20,
                                // ),
                                // TextField(
                                //   keyboardType: TextInputType.number,
                                //   decoration: const InputDecoration(
                                //     labelText: "Code de référence (Facultatif)",
                                //     // border: OutlineInputBorder(
                                //     //   borderRadius: BorderRadius.circular(10),
                                //     // ),
                                //     prefixIcon: Icon(
                                //       Icons.code_outlined,
                                //     ),
                                //   ),
                                //   controller: code_ref,
                                // ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        child: Checkbox(
                                          value: accepte,
                                          onChanged: (c) {
                                            //
                                            setState(() {
                                              print(c);
                                              accepte = c as bool;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: RichText(
                                        text: TextSpan(
                                          text: "J'ai lu et j'accepte la ",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                          ),
                                          children: [
                                            WidgetSpan(
                                              child: InkWell(
                                                onTap: () {
                                                  //Get.to(Politique());
                                                },
                                                child: Text(
                                                  "Politique de confidencialité ",
                                                  style: TextStyle(
                                                    color: Colors.red.shade700,
                                                    fontSize: 17,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const TextSpan(
                                              text: " et les ",
                                            ),
                                            WidgetSpan(
                                              child: InkWell(
                                                onTap: () {
                                                  //
                                                },
                                                child: InkWell(
                                                  onTap: () {
                                                    //Get.to(Termes());
                                                  },
                                                  child: Text(
                                                    "Conditions générales ",
                                                    style: TextStyle(
                                                      color:
                                                          Colors.red.shade700,
                                                      fontSize: 17,
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
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
                                      Colors.yellow.shade700,
                                    ),
                                    overlayColor: MaterialStateProperty.all(
                                      Colors.red.shade100,
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      //
                                      Get.dialog(
                                        const Center(
                                          child: SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                      );
                                      /**
                                       * var headers = {
  'Content-Type': 'application/json'
};
var request = http.Request('POST', Uri.parse('https://africultureshop.com/graphql'));
request.body = '''{"query":"mutation MyMutation {\\r\\n  __typename\\r\\n  registerCustomer(input: {email: \\"pepe@gmail.com\\", firstName: \\"pepe\\", username: \\"Jean\\", lastName: \\"\\", nickname: \\"\\", password: \\"\\"}) {\\r\\n    customer {\\r\\n      firstName\\r\\n      email\\r\\n      id\\r\\n      databaseId\\r\\n    }\\r\\n  }\\r\\n}\\r\\n","variables":{}}''';

request.headers.addAll(headers);
                                       */
                                      var headers = {
                                        'Authorization':
                                            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYWZyaWN1bHR1cmVzaG9wLmNvbSIsImlhdCI6MTY3MzM3NzM2NiwibmJmIjoxNjczMzc3MzY2LCJleHAiOjE2NzMzNzc2NjYsImRhdGEiOnsidXNlciI6eyJpZCI6IjEifX19.2Uf3qcSMmDE0HJof7U7N0ADnrkiXUeFWeFappR6zaak',
                                        'Content-Type': 'application/json'
                                      };
                                      var request = http.Request(
                                          'POST',
                                          Uri.parse(
                                              'https://africultureshop.com/graphql'));
                                      request.body =
                                          '''{"query":"mutation CreateUser {\\r\\n  createUser(input: {username: \\"${username.text}\\", firstName: \\"${firstName.text}\\", nickname: \\"${nickname.text}\\", password: \\"${mdpC.text}\\", roles: \\"Client\\", email: \\"${email.text}\\", lastName: \\"${lastName.text}\\"}) {\\r\\n    user {\\r\\n      email\\r\\n      firstName\\r\\n      id\\r\\n      nickname\\r\\n      username\\r\\n      databaseId\\r\\n      jwtAuthToken\\r\\n      jwtRefreshToken\\r\\n    }\\r\\n  }\\r\\n}","variables":{}}''';

                                      request.headers.addAll(headers);

                                      http.StreamedResponse response =
                                          await request.send();

                                      if (response.statusCode == 200) {
                                        var box = GetStorage();
                                        String m = await response.stream
                                            .bytesToString();
                                        print("La reponse: $m");
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
                                      /**/
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "Envoyer",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
