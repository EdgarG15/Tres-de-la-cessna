import 'package:get/get.dart';
import 'package:tres_de_la_cessna/src/models/canciones.dart';
import 'package:tres_de_la_cessna/src/models/set.dart';
import 'package:tres_de_la_cessna/src/providers/canciones_provider.dart';

class CancionesController extends GetxController {
  Set set = Set.fromJson(Get.arguments['set']);
  //Canciones canciones = Canciones.fromJson(Get.arguments['canciones']);
  CancionesProvider cancionesProvider = CancionesProvider();
  List<Canciones> cancionesList = [];

  Future<List<Canciones>> getCanciones() async {
    cancionesList = await cancionesProvider.findBySet(set.id ?? '');
    return cancionesList;
  }

  void goToHomePage() {
    Get.offAllNamed('/home');
  }

  void goToCancionesCreate(Set set) {
    Get.toNamed('canciones_create', arguments: {'set': set.toJson()});
  }

  void goToCancionesUpdate(
    Canciones canciones,
  ) {
    Get.toNamed('/canciones/update',
        arguments: {'canciones': canciones.toJson()});
  }
}
