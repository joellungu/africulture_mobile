import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../contrôler/splash_controller.dart';
import 'login_controller.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _nom = TextEditingController();
  final _postnom = TextEditingController();
  final _prenom = TextEditingController();
  final _numero = TextEditingController();
  final _email = TextEditingController();
  final _dateNaissance = TextEditingController();
  final _mdp1 = TextEditingController();
  final _mdp2 = TextEditingController();
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
    _nom.dispose();
    _postnom.dispose();
    _prenom.dispose();
    _numero.dispose();
    _email.dispose();
    _dateNaissance.dispose();
    _mdp1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: logBool
            ? Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'example@gmail.com',
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Entrez votre Email';
                        } else if (!value.isEmail) {
                          return "Votre email n'est pas valide";
                        }

                        return null;
                      },
                      controller: _email,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _mdp1,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Entrez votre mot de passe';
                        }

                        return null;
                      },
                      onChanged: (value) {
                        //print("Password value $value");
                      },
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
                          Timer(Duration(seconds: 2), () {
                            loginController.log(_email.text, _mdp1.text);
                          });
                          //
                          //splashController.seLoger(true);
                        }
                      },
                      child: const Text("S'authentifier"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            logBool = false;
                          });
                        },
                        child: const Text("Pas de compte ? Cliqué ici"))
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Nom', labelText: 'Nom'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez saisir votre Nom';
                          }

                          return null;
                        },
                        controller: _nom,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: '+Postnom',
                          labelText: 'Postnom',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Entrez votre Postnom';
                          }

                          return null;
                        },
                        controller: _postnom,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _prenom,
                        decoration: const InputDecoration(
                          hintText: 'Prenom',
                          labelText: 'Prenom',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Entrez votre Prenom';
                          }

                          return null;
                        },
                        onChanged: (value) {
                          //print("Password value $value");
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Numéro', labelText: 'Numéro'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez saisir votre Numéro';
                          }

                          return null;
                        },
                        controller: _numero,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Entrez votre Email';
                          } else if (!value.isEmail) {
                            return "Votre email n'est pas valide";
                          }

                          return null;
                        },
                        controller: _email,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _dateNaissance,
                        decoration: const InputDecoration(
                          hintText: 'Date de naissance',
                          labelText: 'Date de naissance',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Entrez votre Date de naissance';
                          }

                          return null;
                        },
                        onChanged: (value) {
                          //print("Password value $value");
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _mdp1,
                        decoration: const InputDecoration(
                            hintText: 'password', labelText: 'Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Entrez votre mot de passe';
                          } else if (value != _mdp2.text) {
                            return 'Les deux mot de passe ne sont pas pareil';
                          }

                          return null;
                        },
                        onChanged: (value) {
                          //print("Password value $value");
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _mdp2,
                        decoration: const InputDecoration(
                            hintText: 'Confirme password',
                            labelText: 'Confirme Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Entrez votre mot de passe';
                          } else if (value != _mdp1.text) {
                            return 'Les deux mot de passe ne sont pas pareil';
                          }

                          return null;
                        },
                        onChanged: (value) {
                          //print("Password value $value");
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            /*
                        Timer(Duration(seconds: 4), () {
                          Get.snackbar("Correct", "Un simple message!");
                        });
                        */
                            //
                            //Get.off(Accueil());
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
                            Timer(Duration(seconds: 2), () {
                              //loginController.enregistrement(
                              //  _nom.text, _numero.text, _mdp.text);
                              //
                              Map<String, dynamic> u = {
                                "id": 1,
                                "nom": _nom.text,
                                "postnom": _postnom.text,
                                "prenom": _prenom.text,
                                "numero": _numero.text,
                                "email": _email.text,
                                "dateNaissance": _dateNaissance.text,
                                "mdp": _mdp1.text,
                              };
                              loginController.enregistrement(u);
                              //Get.back();
                              //splashController.seLoger(true);
                            });
                          }
                        },
                        child: const Text("S'enregistrer"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              logBool = true;
                            });
                          },
                          child:
                              const Text("Déjà un compte ? Authentifiez-vous"))
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
