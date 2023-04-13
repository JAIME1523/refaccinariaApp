import 'package:flutter/material.dart';
import 'package:refaccionaria/data/data.dart';
import 'package:refaccionaria/models/models.dart';

class HomeProvider extends ChangeNotifier {
  List<Refaccionaria> refaccionarias = [];

  HomeProvider() {
    try {
      refaccionarias = List<Refaccionaria>.from(
          dataRefac.map((x) => Refaccionaria.fromMap(x)));
      notifyListeners();
    } catch (e) {
      '';
    }
  }
  addrefac(Refaccionaria refaccionaria) {
    refaccionarias.add(refaccionaria);
    notifyListeners();
  }

  delete(Refaccionaria refaccionaria) {
    refaccionarias.remove(refaccionaria);
    notifyListeners();
  }
}
