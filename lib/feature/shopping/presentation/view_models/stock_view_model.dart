import 'package:dro_health_pharmacy/feature/shopping/data/models/medicine_model.dart';
import 'package:dro_health_pharmacy/feature/shopping/presentation/view_models/core_view_model.dart';

class StockViewModel extends CoreViewModel {
  List<Medicine> allMeds = [];
  List<Medicine> filteredMeds = [];

  bool filtered = false;
  initializeApp() async {
    setState(state: AppState.busy);
    await Future.delayed(Duration(seconds: 1));
    allMeds = bank.stock;
    setState(state: AppState.idle);
  }

  search(String query) {
    if (query.trim() == "" && query == null) {
      filtered = false;
      setState();
    } else {
      filtered = true;
      filteredMeds = allMeds
          .where((Medicine medicine) =>
              medicine.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      setState();
    }
  }
}
