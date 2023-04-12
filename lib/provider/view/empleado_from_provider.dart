import 'package:flutter/material.dart';
import 'package:refaccionaria/models/models.dart';

class EmpleadoFormProvider extends ChangeNotifier {
  var listNivel = [
    'Experto de partes',
    'repartidor',
    'gerente de talleres',
    'gerentes de piso',
    'subgerentes'
  ];
  EmpleadoModel? newEmpleado = EmpleadoModel(
      id: 0,
      nombre: '',
      edad: 0,
      sexo: '',
      nivel: '',
      nss: '',
      sueldo: 0,
      diaVacaciones: 5);
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  validateFrom() {
    if (fromKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
