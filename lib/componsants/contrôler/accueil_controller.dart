import 'package:get/get.dart';

class AccueilController extends GetxController {
  RxInt ecranIndex = 0.obs;

  int getEcranIndex() {
    return ecranIndex.value;
  }

  setEcranIndex(int index) {
    ecranIndex.value = index;
  }
  //
}
