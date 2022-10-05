import 'package:get/get.dart';
import 'package:tres_de_la_cessna/src/models/canciones.dart';
import 'package:tres_de_la_cessna/src/models/response_api.dart';
import 'package:tres_de_la_cessna/src/models/set.dart';
import '../environment/environment.dart';

class CancionesProvider extends GetConnect {
  String url = Environment.API_URL + 'api/canciones';

  Future<List<Canciones>> findBySet(String idSet) async {
    Response response = await get('$url/findBySet/$idSet', headers: {
      'Content-Type': 'application/json',
    }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if (response.statusCode == 401) {
      Get.snackbar('Peticion denegada',
          'Tu usuario no tiene permitido leer esta informacion');
      return [];
    }

    List<Canciones> canciones = Canciones.fromJsonList(response.body);

    return canciones;
  }

  Future<ResponseApi> create(Canciones canciones) async {
    Response response = await post('$url/create', canciones.toJson(), headers: {
      'Content-Type': 'application/json',
    }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }
}
