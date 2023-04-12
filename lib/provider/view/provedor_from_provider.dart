import 'package:flutter/material.dart';
import 'package:refaccionaria/models/models.dart';

class ProvedorFormProvider extends ChangeNotifier {
  var listTipo = [
    'Accesorios',
    'Refacciones',
    'Partes eléctricas',
  ];
  ProvedoreModel newPovedor = ProvedoreModel(
    id: 0,
    nombre: '',
    tipoProvedor: '',
  );
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  validateFrom() {
    if (fromKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
