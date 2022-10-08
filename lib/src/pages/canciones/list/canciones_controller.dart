import 'package:MusicaCessna/src/models/set.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../models/canciones.dart';
import '../../../models/response_api.dart';
import '../../../providers/canciones_provider.dart';

class CancionesController extends GetxController {
  Set set = Set.fromJson(Get.arguments['set']);
  //Canciones canciones = Canciones.fromJson(Get.arguments['canciones']);
  CancionesProvider cancionesProvider = CancionesProvider();
  List<Canciones> cancionesList = [];

  Future<List<Canciones>> getCanciones() async {
    cancionesList = await cancionesProvider.findBySet(set.id ?? '');
    return cancionesList;
  }

  void deleteCanciones(Canciones canciones) async {
    // ProgressDialog progressDialog = ProgressDialog(context: context);
    // progressDialog.show(max: 100, msg: 'Eliminando datos...');
    Canciones myCancion = Canciones(
      id: canciones.id,
      name: canciones.name,
      letter: canciones.letter,
    );
    ResponseApi responseApi =
        await cancionesProvider.deleteCanciones(myCancion);
    if (responseApi.success == true) {
      Get.snackbar("Proceso terminado", responseApi.message ?? '');
      GetStorage().write('canciones', responseApi.data);
      // goToCancionesPage(set);
      //update();
      //progressDialog.close();
    } else {
      Get.snackbar("Proceso fallido", "La cancion no se pudo eliminar");
    }
    // progressDialog.close();
  }

  void updatee() {
    update();
  }

  void goToHomePage() {
    Get.offAllNamed('/home');
  }

  void goToCancionesPage(Set set) {
    Get.toNamed('/canciones', arguments: {'set': set.toJson()});
  }

  void goToCancionesCreate(Set set) {
    Get.toNamed('canciones_create', arguments: {'set': set.toJson()});
  }

  void goToCancionesUpdate(Canciones canciones) {
    Get.toNamed('/canciones/update',
        arguments: {'canciones': canciones.toJson()});
  }
}
