import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  //for listing item in cart
  final List<Map<String, dynamic>> cart = [];
//for adding product in cart
  void addProduct(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();
  }

//for remove product form cart
  void removeProduct(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }

  bool isInCart(int itemId) {
    return cart.any((product) => product['id'] == itemId);
  }
}
