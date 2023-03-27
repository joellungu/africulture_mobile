import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum BestTutorSite { en, fr }

class ChoixLangue extends StatefulWidget {
  //MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<ChoixLangue> {
  BestTutorSite _site = BestTutorSite.fr;
  var box = GetStorage();

  @override
  void initState() {
    _site = box.read("langue") == "en" ? BestTutorSite.en : BestTutorSite.fr;
    //
    super.initState();
  }

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
                box.write("langue", "en");
                var locale = const Locale('en', 'US');
                Get.updateLocale(locale);
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
                box.write("langue", "fr");
                var locale = const Locale('fr', 'FR');
                Get.updateLocale(locale);
              });
            },
          ),
        ),
      ],
    );
  }
}
