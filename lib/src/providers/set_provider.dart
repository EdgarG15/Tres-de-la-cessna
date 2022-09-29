import 'package:get/get.dart';
import 'package:tres_de_la_cessna/src/models/response_api.dart';
import 'package:tres_de_la_cessna/src/models/set.dart';
import '../environment/environment.dart';

class SetProvider extends GetConnect {
  String url = '${Environment.API_URL}api/set';

  Future<List<Set>> findByDatos() async {
    Response response = await get('$url/findByDatos/', headers: {
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

  Future<ResponseApi> create(Set set) async {
    Response response = await post('$url/create', set.toJson(), headers: {
      'Content-Type': 'application/json',
    });

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }
}
