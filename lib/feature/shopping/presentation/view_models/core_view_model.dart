import 'package:dro_health_pharmacy/feature/shopping/data/data_source/data_source.dart';
import 'package:flutter/material.dart';

class CoreViewModel extends ChangeNotifier {
  MedicineBank bank = MedicineBank();
  AppState appState = AppState.idle;

  setState({AppState state}) {
    appState = state;
    notifyListeners();
  }
}

enum AppState { busy, idle }
