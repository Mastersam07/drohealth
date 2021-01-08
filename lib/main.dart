import 'package:dro_health_pharmacy/feature/shopping/presentation/view_models/cart_view_model.dart';
import 'package:dro_health_pharmacy/feature/shopping/presentation/view_models/stock_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/shopping/presentation/home_view.dart';

void main() {
  runApp(DroHealth());
}

class DroHealth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StockViewModel>(
          create: (context) => StockViewModel(),
        ),
        ChangeNotifierProvider<CartViewModel>(
          create: (context) => CartViewModel(),
        ),
      ],
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}
