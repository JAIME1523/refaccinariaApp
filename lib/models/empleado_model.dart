import 'dart:convert';

class EmpleadoModel {
    EmpleadoModel({
        required this.id,
        required this.nombre,
        required this.edad,
        required this.sexo,
        required this.nivel,
        required this.nss,
        required this.sueldo,
        required this.diaVacaciones,
    });

    final int id;
    final String nombre;
    final int edad;
    final String sexo;
    final String nivel;
    final String nss;
    final int sueldo;
    final int diaVacaciones;

    factory EmpleadoModel.fromJson(String str) => EmpleadoModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EmpleadoModel.fromMap(Map<String, dynamic> json) => EmpleadoModel(
        id: json["id"],
        nombre: json["nombre"],
        edad: json["edad"],
        sexo: json["sexo"],
        nivel: json["nivel"],
        nss: json["NSS"],
        sueldo: json["sueldo"],
        diaVacaciones: json["diaVacaciones"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "edad": edad,
        "sexo": sexo,
        "nivel": nivel,
        "NSS": nss,
        "sueldo": sueldo,
        "diaVacaciones": diaVacaciones,
    };
}
