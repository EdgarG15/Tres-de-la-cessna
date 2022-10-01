import 'package:get/get.dart';
import 'package:tres_de_la_cessna/src/models/set.dart';

class CancionesController extends GetxController {
  Set set = Set.fromJson(Get.arguments['set']);

  void goToCancionesCreate() {
    Get.toNamed('canciones_create');
  }
}
