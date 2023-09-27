import 'package:flutter/material.dart';
import 'package:kickio/data/models/cart_item.module.dart';

class Cart with ChangeNotifier {
  final Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItems {
    return {..._cartItems};
  }

  int itemsCount() {
    return _cartItems.length;
  }

  double get totalPrice {
    var total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addToCart(
    String productId,
    String title,
    double price,
    String image,
  ) {
    if (_cartItems.containsKey(productId)) {
      //quantity add + 1
      _cartItems.update(
        productId,
        (currentProduct) => CartItem(
          id: currentProduct.id,
          title: currentProduct.title,
          quantity: currentProduct.quantity + 1,
          price: currentProduct.price,
          image: currentProduct.image,
        ),
      );
    } else {
      //add new product quantity=1
      _cartItems.putIfAbsent(
        productId,
        () => CartItem(
          id: UniqueKey().toString(),
          title: title,
          quantity: 1,
          price: price,
          image: image,
        ),
      );
    }
    notifyListeners();
  }

  void removeSingleFromCart(String productId) {
    if (!_cartItems.containsKey(productId)) {
      return;
    }
    if (_cartItems[productId]!.quantity > 1) {
      _cartItems.update(
        productId,
        (currentProduct) => CartItem(
            id: currentProduct.id,
            title: currentProduct.title,
            quantity: currentProduct.quantity - 1,
            price: currentProduct.price,
            image: currentProduct.image),
      );
    }
    notifyListeners();
  }

  void remove(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
