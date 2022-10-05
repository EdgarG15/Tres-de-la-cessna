import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tres_de_la_cessna/src/models/canciones.dart';

class LetrasController extends GetxController {
  Canciones canciones = Canciones.fromJson(Get.arguments['canciones']);
  var fontSize = 32.0.obs;

  void disminuirLetra() {
    if (fontSize > 12) {
      fontSize.value--;
    }
    if (kDebugMode) {
      print('El tamaño de la letra es: $fontSize');
    }
  }

  void aumentarLetra() {
    if (fontSize < 72) {
      fontSize.value++;
    }
    if (kDebugMode) {
      print('El tamaño de la letra es: $fontSize');
    }
  }
}
