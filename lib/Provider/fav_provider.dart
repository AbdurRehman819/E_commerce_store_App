import 'package:e_commerece_app/Models/product_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavProvider extends ChangeNotifier {
  final List<Product> _favourite = [];
  List<Product> get favourite => _favourite;
  void toggleProduct(Product product) {
    if (_favourite.contains(product)) {
      _favourite.remove(product);
    } else {
      _favourite.add(product);
    }
    notifyListeners();
  }

  bool isExist(Product product) {
    final isExist = _favourite.contains(product);
    return isExist;
  }

  static FavProvider of(
   // BuildContext,
    context, {
    bool listen = true,
  }) {
    return Provider.of<FavProvider>(context, listen: listen);
  }
}
