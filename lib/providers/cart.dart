import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_provider_state/models/cart_item.dart';

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get jumlah => _items == null || _items == {} ? 0 : _items.length;

  double get totalHarga {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.qty * cartItem.price;
    });
    return total;
  }

  void addCart(String prodId, String title, double price) {
    if (_items.containsKey(prodId)) {
      // Ketika sudah tersedia key product id
      _items.update(
        prodId,
        (value) => CartItem(
          id: value.id,
          price: value.price,
          qty: value.qty + 1,
          title: value.title,
        ),
      );
    } else {
      // Namabah product id baru
      _items.putIfAbsent(
        prodId,
        () => CartItem(
          id: DateTime.now().toString(),
          price: price,
          qty: 1,
          title: title,
        ),
      );
    }
    notifyListeners();
  }
}
