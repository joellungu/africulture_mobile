import 'package:flutter/material.dart';


enum BestTutorSite { en, fr, es }

class ChoixLangue extends StatefulWidget {
  //MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<ChoixLangue> {

  BestTutorSite _site = BestTutorSite.en;

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ListTile(
          title: const Text('Anglais'),
          leading: Radio(
            value: BestTutorSite.en,
            groupValue: _site,
            onChanged: (BestTutorSite? value) {
              setState(() {
                _site = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Français'),
          leading: Radio(
            value: BestTutorSite.fr,
            groupValue: _site,
            onChanged: (BestTutorSite? value) {
              setState(() {
                _site = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Espagnol'),
          leading: Radio(
            value: BestTutorSite.es,
            groupValue: _site,
            onChanged: (BestTutorSite? value) {
              setState(() {
                _site = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}