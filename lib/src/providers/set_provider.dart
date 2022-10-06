import 'package:MusicaCessna/src/models/set.dart';
import 'package:get/get.dart';
import '../environment/environment.dart';
import '../models/response_api.dart';

class SetProvider extends GetConnect {
  String url = '${Environment.API_URL}api/set';

  Future<List<Set>> findBySet() async {
    Response response = await get('$url/findBySet', headers: {
      'Content-Type': 'application/json',
    }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if (response.statusCode == 401) {
      Get.snackbar('Peticion denegada',
          'Tu usuario no tiene permitido leer esta informacion');
      return [];
    }

    List<Set> set = Set.fromJsonList(response.body);

    return set;
  }

  Future<ResponseApi> updateSet(Set set) async {
    Response response = await put('$url/updateSet', set.toJson(), headers: {
      'Content-Type': 'application/json',
    });

    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo actualizar la informacion');
      return ResponseApi();
    }

    if (response.statusCode == 401) {
      Get.snackbar('Error', 'No estas autorizado para realizar esta peticion');
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }

  Future<ResponseApi> create(Set set) async {
    Response response = await post('$url/create', set.toJson(), headers: {
      'Content-Type': 'application/json',
    });

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }
}
