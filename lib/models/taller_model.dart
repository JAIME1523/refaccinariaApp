import 'dart:convert';

import 'package:refaccionaria/models/models.dart';

class TallerModel {
    TallerModel({
        required this.id,
        required this.nombre,
        required this.razonSocial,
        required this.domicilio,
        required this.tipo,
        required this.montoVnetas,
         this.encargado,
        required this.listaRefacciones,
    });

     int id;
     String nombre;
     String razonSocial;
     String domicilio;
     String tipo;
     dynamic montoVnetas;
     dynamic encargado;
     List<RefaccionesModel> listaRefacciones;

    factory TallerModel.fromJson(String str) => TallerModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TallerModel.fromMap(Map<String, dynamic> json) => TallerModel(
        id: json["id"],
        nombre: json["nombre"],
        razonSocial: json["razon social"],
        domicilio: json["domicilio"],
        tipo: json["tipo"],
        montoVnetas: json["montoVnetas"],
        encargado:json["encargado"],
        listaRefacciones: List<RefaccionesModel>.from(json["listaRefacciones"].map((x) => RefaccionesModel.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "razon social": razonSocial,
        "domicilio": domicilio,
        "tipo": tipo,
        "montoVnetas": montoVnetas,
        "encargado": encargado,
        "listaRefacciones": List<dynamic>.from(listaRefacciones.map((x) => x.toMap())),
    };
}
