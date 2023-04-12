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

     int id;
     String nombre;
     int edad;
     String sexo;
     String nivel;
     String nss;
     dynamic sueldo;
     dynamic diaVacaciones;

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
