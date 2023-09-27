import 'package:flutter/cupertino.dart';

class ShoesProduct with ChangeNotifier {
  final String id;
  final String title;
  final String imgUrl;
  final String description;
  final double price;
  bool isLike;

  ShoesProduct({
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.description,
    required this.price,
    this.isLike = false,
  });

  void toggleLike() {
    isLike = !isLike;
    notifyListeners();
  }
}
