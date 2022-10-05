import 'package:get/get.dart';
import 'package:tres_de_la_cessna/src/models/canciones.dart';

class LetrasController extends GetxController {
  Canciones canciones = Canciones.fromJson(Get.arguments['canciones']);
}
