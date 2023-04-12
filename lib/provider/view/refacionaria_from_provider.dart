import 'package:flutter/material.dart';
import 'package:refaccionaria/models/models.dart';

class RefaccionariaFormProvider extends ChangeNotifier {
  var listNivel = [
    'Experto de partes',
    'repartidor',
    'gerente de talleres',
    'gerentes de piso',
    'subgerentes'
  ];
  Refaccionaria newRefac = Refaccionaria(
      id: 0,
      nombre: 'Refaccionaria California',
      identificador: '',
      domicilio: '',
      listaTalleres: [],
      listaEmpleado: [],
      listaProvedores: [],
      nivelVenatas: '',
      descuento: 0);
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  validateFrom() {
    if (fromKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
