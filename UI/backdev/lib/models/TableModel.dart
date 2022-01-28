import 'dart:convert';

List<ModTable> modTableFromJson(String str) =>
    List<ModTable>.from(json.decode(str).map((x) => ModTable.fromJson(x)));

String modTableToJson(List<ModTable> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModTable {
  ModTable({
    required this.name,
  });

  String name;

  factory ModTable.fromJson(Map<String, dynamic> json) => ModTable(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
