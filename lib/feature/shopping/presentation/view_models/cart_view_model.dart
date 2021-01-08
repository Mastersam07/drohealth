import 'package:dro_health_pharmacy/feature/shopping/data/models/cart_model.dart';
import 'package:dro_health_pharmacy/feature/shopping/presentation/view_models/core_view_model.dart';

class CartViewModel extends CoreViewModel {
  List<CartItem> _shoppingBag = [];
  List<CartItem> get bag => _shoppingBag;
  int get bagLength => _shoppingBag.length;
  double _total = 0;
  double get total => calculateTotal();
  calculateTotal() {
    _total = 0;
    for (CartItem item in _shoppingBag) {
      double value = item.medicine.price * item.numberOfItem;
      _total += value;
    }
    notifyListeners();
    return _total;
  }

  addToBag(CartItem item) {
    _shoppingBag.add(item);
    setState();
  }

  removeFromBag(CartItem product) {
    int removeIndex = _shoppingBag.indexWhere((item) =>
        item.medicine.id == product.medicine.id &&
        item.numberOfItem == product.numberOfItem);
    _shoppingBag.removeAt(removeIndex);
    setState();
  }
}
