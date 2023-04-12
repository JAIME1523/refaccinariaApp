import 'dart:convert';

class ProvedoreModel {
    ProvedoreModel({
        required this.id,
        required this.nombre,
        required this.tipoProvedor,
    });

    final int id;
    final String nombre;
    final String tipoProvedor;

    factory ProvedoreModel.fromJson(String str) => ProvedoreModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProvedoreModel.fromMap(Map<String, dynamic> json) => ProvedoreModel(
        id: json["id"],
        nombre: json["nombre"],
        tipoProvedor: json["tipoProvedor"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "tipoProvedor": tipoProvedor,
    };
}