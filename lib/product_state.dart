import 'package:flutter/material.dart';

class ProductState with ChangeNotifier {
  int _quantity = 0;
  int get quantity => _quantity;
  set quantity(int newQuantity) {
    _quantity = newQuantity;
    notifyListeners();
  }
}
