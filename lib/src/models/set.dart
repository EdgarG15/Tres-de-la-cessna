// To parse this JSON data, do
//
//     final set = setFromJson(jsonString);

import 'dart:convert';

Set setFromJson(String str) => Set.fromJson(json.decode(str));

String setToJson(Set data) => json.encode(data.toJson());

class Set {
  String? id;
  String? name;

  Set({
    this.id,
    this.name,
  });

  factory Set.fromJson(Map<String, dynamic> json) => Set(
        id: json["id"],
        name: json["name"],
      );

  static List<Set> fromJsonList(List<dynamic> jsonList) {
    List<Set> toList = [];
    for (var item in jsonList) {
      Set set = Set.fromJson(item);
      toList.add(set);
    }
    return toList;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
