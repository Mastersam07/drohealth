import 'package:dro_health_pharmacy/feature/shopping/data/models/medicine_model.dart';

class CartItem {
  Medicine medicine;
  int numberOfItem;

  CartItem({this.medicine, this.numberOfItem = 1});
}
