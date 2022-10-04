import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tres_de_la_cessna/src/models/canciones.dart';
import 'package:tres_de_la_cessna/src/models/response_api.dart';
import 'package:tres_de_la_cessna/src/models/set.dart';
import 'package:tres_de_la_cessna/src/providers/canciones_provider.dart';

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
        Get.back();
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

  void goToCancionesCreate(Set set) {
    Get.toNamed('canciones_create', arguments: {'set': set.toJson()});
  }
}
