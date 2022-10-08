import 'package:get/get.dart';
import '../environment/environment.dart';
import '../models/canciones.dart';
import '../models/response_api.dart';

class CancionesProvider extends GetConnect {
  String url = '${Environment.API_URL}api/canciones';

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

  Future<ResponseApi> deleteCanciones(Canciones canciones) async {
    Response response = await delete('$url/deleteCanciones/${canciones.id}',
        query: canciones.toJson(),
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo eliminar la informacion');
      return ResponseApi();
    }

    if (response.statusCode == 401) {
      Get.snackbar('Error', 'No estas autorizado para realizar esta peticion');
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }

  Future<ResponseApi> updateCanciones(Canciones canciones) async {
    Response response =
        await put('$url/updateCanciones', canciones.toJson(), headers: {
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

  Future<ResponseApi> create(Canciones canciones) async {
    Response response = await post('$url/create', canciones.toJson(), headers: {
      'Content-Type': 'application/json',
    }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }
}
