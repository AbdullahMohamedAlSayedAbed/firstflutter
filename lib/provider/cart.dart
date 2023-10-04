import 'package:firstflutter/model/item.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  final List<Item> _items = [];
  double _price = 0.0;
  void add(Item item) {
    _items.add(item);
    _price += item.price;
    notifyListeners();
  }
  void remove(Item item) {
    _items.remove(item);
    _price -= item.price;
    notifyListeners();
  }

  int get count => _items.length;
  double get totalPrice => _price;
  List<Item> get basketitem => _items;
}
