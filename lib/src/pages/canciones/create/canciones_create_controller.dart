import 'package:MusicaCessna/src/models/set.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../models/canciones.dart';
import '../../../models/response_api.dart';
import '../../../providers/canciones_provider.dart';

class CancionesCreateController extends GetxController {
  Set set = Set.fromJson(Get.arguments['set']);

  TextEditingController nameController = TextEditingController();
  TextEditingController letterController = TextEditingController();

  CancionesProvider cancionesProvider = CancionesProvider();

  void cancionesForm() async {
    String name = nameController.text;
    String letter = letterController.text;
    if (isValidForm(name, letter)) {
      Canciones canciones = Canciones(
        name: name,
        letter: letter,
        idSet: set.id,
      );
      ResponseApi responseApi = await cancionesProvider.create(canciones);
      if (responseApi.success == true) {
        canciones.id = responseApi.data;
        GetStorage().write('canciones', canciones.toJson());
        goToCancionesPage(set);
      }
    }
  }

  bool isValidForm(String name, String letter) {
    if (name.isEmpty) {
      Get.snackbar('Formulario no valido', 'Ingresa el nombre de la cancion');
      return false;
    }
    if (letter.isEmpty) {
      Get.snackbar('Formulario no valido', 'Ingresa la letra de la cancion');
      return false;
    }
    return true;
  }

  void goToCancionesPage(Set set) {
    Get.offAllNamed('/canciones', arguments: {'set': set.toJson()});
  }

  void goToCancionesCreate(Set set) {
    Get.toNamed('canciones_create', arguments: {'set': set.toJson()});
  }

  void goToLetrasPage(Canciones canciones) {
    Get.toNamed('/letras', arguments: {'canciones': canciones.toJson()});
  }
}
