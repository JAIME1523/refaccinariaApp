
import 'dart:convert';

import 'package:refaccionaria/models/models.dart';

class RefaccionariaModel {
    RefaccionariaModel({
        required this.refaccionaria,
    });

    final Refaccionaria refaccionaria;

    factory RefaccionariaModel.fromJson(String str) => RefaccionariaModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RefaccionariaModel.fromMap(Map<String, dynamic> json) => RefaccionariaModel(
        refaccionaria: Refaccionaria.fromMap(json["refaccionaria"]),
    );

    Map<String, dynamic> toMap() => {
        "refaccionaria": refaccionaria.toMap(),
    };
}

class Refaccionaria {
    Refaccionaria({
        required this.id,
        required this.nombre,
        required this.identificador,
        required this.domicilio,
        required this.listaTalleres,
        required this.listaEmpleado,
        required this.listaProvedores,
        required this.nivelVenatas,
        required this.descuento,
    });

     int id;
     String nombre;
     String identificador;
     String domicilio;
     List<TallerModel>? listaTalleres;
     List<EmpleadoModel>? listaEmpleado;
     List<ProvedoreModel>? listaProvedores;
     String nivelVenatas;
     dynamic descuento;

    factory Refaccionaria.fromJson(String str) => Refaccionaria.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Refaccionaria.fromMap(Map<String, dynamic> json) => Refaccionaria(
        id: json["id"],
        nombre: json["nombre"],
        identificador: json["identificador"],
        domicilio: json["domicilio"],
        listaTalleres: List<TallerModel>.from(json["listaTalleres"].map((x) => TallerModel.fromMap(x))),
        listaEmpleado: List<EmpleadoModel>.from(json["listaEmpleado"].map((x) => EmpleadoModel.fromMap(x))),
        listaProvedores: List<ProvedoreModel>.from(json["listaProvedores"].map((x) => ProvedoreModel.fromMap(x))),
        nivelVenatas: json["nivelVenatas"],
        descuento: json["descuento"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "identificador": identificador,
        "domicilio": domicilio,
        "listaTalleres": List<dynamic>.from(listaTalleres!.map((x) => x.toMap())) ,
        "listaEmpleado": List<dynamic>.from(listaEmpleado!.map((x) => x.toMap())),
        "listaProvedores": List<dynamic>.from(listaProvedores!.map((x) => x.toMap())),
        "nivelVenatas": nivelVenatas,
        "descuento": descuento,
    };
}





