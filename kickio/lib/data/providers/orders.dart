import 'package:flutter/material.dart';
import 'package:kickio/data/models/cart_item.module.dart';
import 'package:kickio/data/models/order.module.dart';

class Orders with ChangeNotifier {
  final List<Order> _orderItems = [];

  List<Order> get orderItems {
    return [..._orderItems];
  }

  void addToOrders(List<CartItem> products, double totalPrice) {
    _orderItems.insert(
      0,
      Order(
        id: UniqueKey().toString(),
        date: DateTime.now(),
        totalPrice: totalPrice,
        products: products,
      ),
    );
  }
}
