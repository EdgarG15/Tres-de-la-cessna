import 'package:get/get.dart';
import 'package:tres_de_la_cessna/src/models/set.dart';
import 'package:tres_de_la_cessna/src/providers/set_provider.dart';

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
}
