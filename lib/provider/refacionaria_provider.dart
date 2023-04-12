import 'package:flutter/material.dart';

class RefacionariaProvider extends ChangeNotifier {
  ViewsStatus _viewStatus = ViewsStatus.talleres;

  ViewsStatus get viewStatus => _viewStatus;

  set viewStatus(ViewsStatus value) {
    _viewStatus = value;
    notifyListeners();
  }
}

enum ViewsStatus { talleres, empleados, provedor }
