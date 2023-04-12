import 'dart:convert';

class RefaccionesModel {
    RefaccionesModel({
        required this.id,
        required this.nombre,
    });

    final int id;
    final String nombre;

    factory RefaccionesModel.fromJson(String str) => RefaccionesModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RefaccionesModel.fromMap(Map<String, dynamic> json) => RefaccionesModel(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
    };
}
