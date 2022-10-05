import 'package:get/get.dart';
import 'package:tres_de_la_cessna/src/models/canciones.dart';
import 'package:tres_de_la_cessna/src/models/set.dart';
import 'package:tres_de_la_cessna/src/providers/canciones_provider.dart';

class CancionesController extends GetxController {
  Set set = Set.fromJson(Get.arguments['set']);
  CancionesProvider cancionesProvider = CancionesProvider();
  List<Canciones> canciones = [];

  Future<List<Canciones>> getCanciones() async {
    canciones = await cancionesProvider.findBySet(set.id ?? '');
    return canciones;
  }

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
