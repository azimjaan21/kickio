import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kickio/data/models/product.module.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  final List<ShoesProduct> _shoesList = [
    ShoesProduct(
      id: 'p1',
      title: 'NIKE Metcon X',
      imgUrl: 'assets/images/shoe_yellow.png',
      description:
          'Sneaker made from premium leather and suede Waterproof inner liner to keep moisture out...',
      price: 120.99,
    ),
    ShoesProduct(
      id: 'p2',
      title: 'NIKE Pink X',
      imgUrl: 'assets/images/shoe_pink.png',
      description:
          'Sneaker made from premium leather and suede Waterproof inner liner to keep moisture out...',
      price: 230.99,
    ),
    ShoesProduct(
      id: 'p3',
      title: 'NIKE Cross 87',
      imgUrl: 'assets/images/shoe_nike.png',
      description:
          'Sneaker made from premium leather and suede Waterproof inner liner to keep moisture out...',
      price: 330.99,
    ),
    ShoesProduct(
      id: 'p4',
      title: 'Adidas Yeezy\nBoost 700',
      imgUrl: 'assets/images/shoe_yeezy.png',
      description:
          'Sneaker made from premium leather and suede Waterproof inner liner to keep moisture out...',
      price: 320.99,
    ),
    ShoesProduct(
      id: 'p5',
      title: 'Adidas Invincible',
      imgUrl: 'assets/images/shoe_red.png',
      description:
          'Sneaker made from premium leather and suede Waterproof inner liner to keep moisture out...',
      price: 128.99,
    ),
    ShoesProduct(
      id: 'p6',
      title: 'Nike Air Presto',
      imgUrl: 'assets/images/shoe_green.png',
      description:
          'Sneaker made from premium leather and suede Waterproof inner liner to keep moisture out...',
      price: 132.99,
    ),
  ];

  List<ShoesProduct> get shoesList {
    return [..._shoesList];
  }

  List<ShoesProduct> get favorites {
    return _shoesList.where((product) => product.isLike).toList();
  }

// to Add New Products
  void addProducts(ShoesProduct product) {
    final url = Uri.parse(
        "https://kickio-aa3b9-default-rtdb.firebaseio.com/products.json");

    http
        .post(
          url,
          body: jsonEncode(
            {
              'title': product.title,
              'description': product.description,
              'price': product.price,
              'imgUrl': product.imgUrl,
              'isFavorite': product.isLike,
            },
          ),
        )
        .then(
          (response) => print(response),
        );

    final newShoesProduct = ShoesProduct(
      id: product.id,
      title: product.title,
      imgUrl: product.imgUrl,
      description: product.description,
      price: product.price,
    );

    _shoesList.add(newShoesProduct);
    notifyListeners();
  }

  ShoesProduct findByNewestId(String shoesId) {
    return shoesList.firstWhere(
      (shoes) => shoes.id == shoesId,
    );
  }
}
