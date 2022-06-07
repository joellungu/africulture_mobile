import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../profil/profile_controller.dart';

class Adresse extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nom = TextEditingController();
  final _postnom = TextEditingController();
  final _prenom = TextEditingController();
  final _numero = TextEditingController();
  final _email = TextEditingController();
  var _pays;

  ProfileControllers profileControllers = Get.find();

  Adresse() {
    Map<dynamic, dynamic> m = profileControllers.infosPerso;
    //
    _nom.text = m['nom'] ?? "";
    _postnom.text = m['postnom'] ?? "";
    _prenom.text = m['prenom'] ?? "";
    _numero.text = m['numero'] ?? "";
    _email.text = m['email'] ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Nom', labelText: 'Nom'),
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
                  hintText: 'Postnom',
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
                  }

                  return null;
                },
                controller: _email,
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 20,
                color: Colors.grey.shade200,
                child: Text(
                  "Adresse",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                //height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pays  "),
                    CountryCodePicker(
                      onChanged: print,
                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      initialSelection: 'IT',
                      favorite: ['+39', 'FR'],
                      // optional. Shows only country name and flag
                      showCountryOnly: false,
                      // optional. Shows only country name and flag when popup is closed.
                      showOnlyCountryWhenClosed: false,
                      // optional. aligns the flag and the Text left
                      alignLeft: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _nom,
                decoration: const InputDecoration(
                  hintText: 'Etat / Province',
                  labelText: 'Etat / Province',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Entrez votre mot de passe';
                  } else if (value != _nom.text) {
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
                controller: _nom,
                decoration: const InputDecoration(
                    hintText: 'Ville', labelText: 'Ville'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Entrez votre mot de passe';
                  } else if (value != _nom.text) {
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
                controller: _nom,
                decoration: const InputDecoration(
                  hintText: 'Commune / Arrondissement',
                  labelText: 'Commune / Arrondissement',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Entrez votre mot de passe';
                  } else if (value != _nom.text) {
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
                controller: _nom,
                decoration: const InputDecoration(
                    hintText: 'Quartier', labelText: 'Quartier'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Entrez votre mot de passe';
                  } else if (value != _nom.text) {
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
                controller: _nom,
                decoration: const InputDecoration(
                  hintText: 'Avenue ou Rue',
                  labelText: 'Avenue ou Rue',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Entrez votre mot de passe';
                  } else if (value != _nom.text) {
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
                controller: _nom,
                decoration: const InputDecoration(
                  hintText: 'Numéro / code postal',
                  labelText: 'Numéro / code postal',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Entrez votre mot de passe';
                  } else if (value != _nom.text) {
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
            ],
          ),
        ),
      ),
    );
  }
}
