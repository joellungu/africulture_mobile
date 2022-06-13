import 'dart:convert';
import 'package:get/get.dart';

import '../../../../utile/utils.dart';

class CreationConnexion extends GetConnect {
  Future<Response> enregistreProduit(Map<String, dynamic> p) async =>
      await post("${Utils.url}/produit/save", jsonEncode(p));

  Future<Response> enregistrerImageProduit(
          List<Map<String, dynamic>> p) async =>
      await post("${Utils.url}/produit/saveimage", jsonEncode(p));
}
