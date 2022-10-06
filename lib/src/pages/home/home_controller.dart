import 'package:MusicaCessna/src/models/set.dart';
import 'package:get/get.dart';

import '../../providers/set_provider.dart';

class HomeController extends GetxController {
  SetProvider setProvider = SetProvider();
  List<Set> set = [];

  Future<List<Set>> getSets() async {
    set = await setProvider.findBySet();
    return set;
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
