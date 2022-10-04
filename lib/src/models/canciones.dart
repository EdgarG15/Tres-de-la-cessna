// To parse this JSON data, do
//
//     final canciones = cancionesFromJson(jsonString);

import 'dart:convert';

Canciones cancionesFromJson(String str) => Canciones.fromJson(json.decode(str));

String cancionesToJson(Canciones data) => json.encode(data.toJson());

class Canciones {
  String? id;
  String? name;
  String? letter;
  String? idSet;

  Canciones({
    this.id,
    this.name,
    this.letter,
    this.idSet,
  });

  factory Canciones.fromJson(Map<String, dynamic> json) => Canciones(
        id: json["id"],
        name: json["name"],
        letter: json["letter"],
        idSet: json["id_set"],
      );

  static List<Canciones> fromJsonList(List<dynamic> jsonList) {
    List<Canciones> toList = [];
    for (var item in jsonList) {
      Canciones canciones = Canciones.fromJson(item);
      toList.add(canciones);
    }
    return toList;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "letter": letter,
        "id_set": idSet,
      };
}
