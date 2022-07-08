import 'dart:async';
import 'package:africulture_mobile/componsants/pages/principale.dart';
import 'package:africulture_mobile/componsants/pages/profil/profile_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../contrôler/splash_controller.dart';
import 'login_controller.dart';

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Connexion",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.yellow.shade700,
                Colors.black,
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SeLoger(),
      ),
    );
  }
}

class SeLoger extends StatelessWidget {
  //
  final _formKey = GlobalKey<FormState>();
  final phone = TextEditingController();
  final nom = TextEditingController();
  RxBool dejaLog = false.obs;
  late CountryCode countryCode = CountryCode(
      code: "CD", dialCode: "+243", name: "République démocratique du Congo");
  //
  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Obx(
            () => CheckboxListTile(
              value: dejaLog.value,
              title: const Text("J'ai déjà un compte"),
              subtitle: const Text("J'ai déjà un compte"),
              dense: true,
              onChanged: (e) {
                dejaLog.value = e!;
              },
            ),
          ),
          Obx(
            () => dejaLog.value
                ? Container()
                : TextFormField(
                    controller: nom,
                    decoration: const InputDecoration(
                      hintText: 'Nom complet',
                      labelText: 'Nom complet',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Entrez votre mot de passe';
                      }

                      return null;
                    },
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: CountryCodePicker(
                  onChanged: (p) {
                    countryCode = p;
                    print(p.code);
                    print(p.dialCode);
                    print(p.name);
                    print(p.flagUri);
                  },
                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                  initialSelection: 'CD',
                  favorite: ['+243', 'FR'],
                  // optional. Shows only country name and flag
                  showCountryOnly: false,
                  // optional. Shows only country name and flag when popup is closed.
                  showOnlyCountryWhenClosed: false,
                  // optional. aligns the flag and the Text left
                  alignLeft: false,
                ),
              ),
              Expanded(
                flex: 9,
                child: TextFormField(
                  controller: phone,
                  decoration: const InputDecoration(
                    hintText: 'Phone',
                    labelText: 'Phone',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Entrez votre mot de passe';
                    }

                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                /*
                        Timer(const Duration(seconds: 4), () {
                          Get.snackbar("Correct", "Un simple message!");
                        });
                        */
                //Get.off(Accueil());
                loginController.code.value = false;
                //
                Get.dialog(
                  const Center(
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  name: "Attente...",
                );

                //
                if (dejaLog.value) {
                  loginController.log(
                      "${countryCode.code}", phone.text, '', dejaLog.value);
                } else {
                  loginController.log("${countryCode.code}", phone.text,
                      nom.text, dejaLog.value);
                }
                //
                //splashController.seLoger(true);
              }
            },
            child: const Text("S'authentifier"),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
  //
}

class Certifier extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  //
  LoginController loginController = Get.find();
  ProfileControllers profileControllers = Get.find();
  //
  final box = GetStorage();

  final code = TextEditingController();
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Confirmer",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.yellow.shade700,
                Colors.black,
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(30),
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    controller: code,
                    decoration: const InputDecoration(
                      hintText: 'Code',
                      labelText: 'Code',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Entrez votre mot de passe';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        final box = GetStorage();
                        //
                        //Map<String, dynamic> pr = box.read("userauth");

                        if (_formKey.currentState!.validate()) {
                          if (loginController.password.value == code.text) {
                            Map<String, dynamic> p = box.read("userauth");
                            box.write("utilisateur", p);
                            profileControllers.checkAffiche(); //
                            Get.offAll(Principale());
                          }
                          //loginController
                          //
                        }
                      },
                      child: const Text("Valider"))
                ],
              ),
            )),
      ),
    );
  }
}
//
