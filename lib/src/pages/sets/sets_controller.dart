import 'package:get/get.dart';
import 'package:tres_de_la_cessna/src/models/response_api.dart';
import 'package:tres_de_la_cessna/src/models/set.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:tres_de_la_cessna/src/providers/set_provider.dart';

class SetsController extends GetxController {
  TextEditingController nameController = TextEditingController();

  SetProvider setProvider = SetProvider();

  void setForm() async {
    String name = nameController.text;

    if (name.isNotEmpty) {
      Set set = Set(
        name: name,
      );
      ResponseApi responseApi = await setProvider.create(set);
      GetStorage().write('set', responseApi.data);
      Get.snackbar("Proceso terminado", responseApi.message ?? '');
      goToPage();
    } else {
      Get.snackbar("Formulario no valido", "Rellene los datos");
    }
  }

  void goToPage() {
    Get.offNamedUntil('/home', (route) => false);
  }
}
