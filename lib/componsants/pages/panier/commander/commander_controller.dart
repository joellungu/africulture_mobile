import 'package:get/get.dart';

class CommanderController extends GetxController {
  RxDouble avancement = RxDouble(Get.width / 4);
  RxString titre = "Adresse".obs;
}
