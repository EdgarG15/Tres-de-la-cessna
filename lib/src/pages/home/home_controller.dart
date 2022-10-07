import 'package:MusicaCessna/src/models/set.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../../models/response_api.dart';
import '../../providers/set_provider.dart';

class HomeController extends GetxController {
  SetProvider setProvider = SetProvider();
  //Set set = Set.fromJson(Get.arguments['set']);
  List<Set> sets = [];

  Future<List<Set>> getSets() async {
    sets = await setProvider.findBySet();
    return sets;
  }

  void deleteSet(Set set, BuildContext context) async {
    ProgressDialog progressDialog = ProgressDialog(context: context);
    progressDialog.show(max: 100, msg: 'Eliminando datos...');
    Set mySet = Set(
      id: set.id,
      name: set.name,
    );
    ResponseApi responseApi = await setProvider.deleteSet(set);
    if (responseApi.success == true) {
      Get.snackbar("Proceso terminado", responseApi.message ?? '');
      GetStorage().write('set', responseApi.data);
      progressDialog.close();
      goToHome(set);
    } else {
      Get.snackbar("Proceso fallido", "El set no se pudo eliminar");
    }
    progressDialog.close();
  }

  void goToHome(Set set) {
    Get.toNamed('/home', arguments: {'set': set.toJson()});
  }

  void goToSets() {
    Get.toNamed('/sets');
  }

  void goToCancionesPage(Set set) {
    Get.toNamed('/canciones', arguments: {'set': set.toJson()});
  }

  void goToUpdateSetPage(Set set) {
    Get.toNamed('/sets/update', arguments: {'set': set.toJson()});
  }
}
