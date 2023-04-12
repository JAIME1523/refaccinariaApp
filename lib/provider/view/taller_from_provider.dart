import 'package:flutter/material.dart';
import 'package:refaccionaria/models/models.dart';

class TallerFormProvider extends ChangeNotifier {
  var listTipos = ['integral', 'mecánica', 'hojalatería'];
  TallerModel? newTaller = TallerModel(
      id: 0,
      nombre: '',
      razonSocial: '',
      domicilio: '',
      tipo: '',
      montoVnetas: 0,
      listaRefacciones: []);
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  validateFrom() {
    print(newTaller!.nombre);
    if (fromKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
