import 'package:MusicaCessna/src/models/canciones.dart';
import 'package:MusicaCessna/src/models/set.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../../../models/response_api.dart';
import '../../../providers/canciones_provider.dart';

class CancionesUpdateController extends GetxController {
  Canciones canciones = Canciones.fromJson(Get.arguments['canciones']);
  //Set set = Set.fromJson(Get.arguments['set']);
  TextEditingController nameController = TextEditingController();
  TextEditingController letterController = TextEditingController();

  CancionesProvider cancionesProvider = CancionesProvider();

  CancionesUpdateController() {
    nameController.text = canciones.name ?? '';
    letterController.text = canciones.letter ?? '';
  }

  void cancionesUpdate(BuildContext context) async {
    String name = nameController.text;
    String letter = letterController.text;
    if (isValidForm(name, letter)) {
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(max: 100, msg: 'Actualizando datos...');
      Canciones myCancion = Canciones(
        id: canciones.id,
        name: name,
        letter: letter,
        //idSet: set.id,
      );
      ResponseApi responseApi =
          await cancionesProvider.updateCanciones(myCancion);
      if (responseApi.success == true) {
        canciones.id = responseApi.data;
        GetStorage().write('canciones', canciones.toJson());
        progressDialog.close();
        goToHome();
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

  void goToHome() {
    Get.offAllNamed('/home');
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
