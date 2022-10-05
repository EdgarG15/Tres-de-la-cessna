import 'package:get/get.dart';
import 'package:tres_de_la_cessna/src/models/canciones.dart';
import 'package:tres_de_la_cessna/src/models/set.dart';
import 'package:tres_de_la_cessna/src/providers/canciones_provider.dart';

class CancionesController extends GetxController {
  Set set = Set.fromJson(Get.arguments['set']);
  CancionesProvider cancionesProvider = CancionesProvider();
  List<Canciones> cancionesList = [];
  // Canciones canciones = Canciones.fromJson(Get.arguments['canciones']);

  // void goToLetrasPage(Canciones canciones) {
  //   Get.toNamed('/letras', arguments: {'canciones': canciones.toJson()});
  // }

  Future<List<Canciones>> getCanciones() async {
    cancionesList = await cancionesProvider.findBySet(set.id ?? '');
    return cancionesList;
  }

  // void goToLetrasPage() {
  //   Get.toNamed('/letras');
  // }

  void goToHomePage() {
    Get.offAllNamed('/home');
  }

  void goToCancionesCreate(Set set) {
    Get.toNamed('canciones_create', arguments: {'set': set.toJson()});
  }

  // void openBottomSheet(BuildContext context, Set set) async {
  //   showMaterialModalBottomSheet(
  //     context: context,
  //     builder: (context) => CancionesCreatePage(set: set),
  //   );
  // }
}
