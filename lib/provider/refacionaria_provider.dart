import 'package:flutter/material.dart';
import 'package:refaccionaria/models/models.dart';

class RefacionariaProvider extends ChangeNotifier {
  Refaccionaria? spareparts;
  RefacionariaProvider(Refaccionaria refac) {
    spareparts = refac;
  }
  ViewsStatus _viewStatus = ViewsStatus.talleres;

  ViewsStatus get viewStatus => _viewStatus;

  set viewStatus(ViewsStatus value) {
    _viewStatus = value;
    notifyListeners();
  }

  deleteTaller(TallerModel taller) {
    spareparts!.listaTalleres!.remove(taller);
    notifyListeners();
  }

  agregarTaller(TallerModel taller) {
    spareparts!.listaTalleres!.add(taller);
    notifyListeners();
  }

  agregarEmpleado(EmpleadoModel empleado) {
    if (spareparts!.listaEmpleado!.isEmpty) {
      empleado.id = 1;
    } else {
      empleado.id = spareparts!.listaEmpleado!.last.id + 1;
    }
    spareparts!.listaEmpleado!.add(empleado);
    notifyListeners();
  }

  deleteEmpleado(EmpleadoModel empleado) {
    spareparts!.listaEmpleado!.remove(empleado);
    notifyListeners();
  }

  agregarProvedor(ProvedoreModel provedort) {
    if (spareparts!.listaProvedores!.isEmpty) {
      provedort.id = 1;
    } else {
      provedort.id = spareparts!.listaProvedores!.last.id + 1;
    }
    spareparts!.listaProvedores!.add(provedort);
    notifyListeners();
  }

  deleteProvedor(ProvedoreModel provedor) {
    spareparts!.listaProvedores!.remove(provedor);
    notifyListeners();
  }
}

enum ViewsStatus { talleres, empleados, provedor }
