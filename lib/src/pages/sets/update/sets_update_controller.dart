import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tres_de_la_cessna/src/models/response_api.dart';
import 'package:tres_de_la_cessna/src/models/set.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:tres_de_la_cessna/src/providers/set_provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class SetsUpdateController extends GetxController {
  Set set = Set.fromJson(Get.arguments['set']);

  TextEditingController nameController = TextEditingController();

  SetProvider setProvider = SetProvider();

  SetsUpdateController() {
    nameController.text = set.name ?? '';
  }

  void updateSets(BuildContext context) async {
    String name = nameController.text;

    if (name.isNotEmpty) {
      if (kDebugMode) {
        print(set.id);
      }
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(max: 100, msg: 'Actualizando datos...');
      Set mySet = Set(
        id: set.id,
        name: name,
      );
      ResponseApi responseApi = await setProvider.updateSet(mySet);
      GetStorage().write('set', responseApi.data);
      Get.snackbar("Proceso terminado", responseApi.message ?? '');
      progressDialog.close();
      goToPage();
    } else {
      Get.snackbar("Formulario no valido", "Rellene los datos");
    }
  }

  void goToPage() {
    Get.offNamedUntil('/home', (route) => false);
  }
}
