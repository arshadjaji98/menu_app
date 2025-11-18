import 'package:flutter/material.dart';
import 'package:menu_app/model/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
      name: "Dumble",
      imagePath: 'asset/sushi (2).png',
      price: "20",
      rating: '4.9',
    ),
    Food(
      name: "Mashroom",
      imagePath: 'asset/sushi (1).png',
      price: "11",
      rating: '4.9',
    ),
    Food(
      name: "Salmon Eggs",
      imagePath: 'asset/sushi.png',
      price: "13",
      rating: '4.9',
    ),
  ];
  List<Food> _cart = [];
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  void addToCart(Food fooditem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(fooditem);
    }
    notifyListeners();
  }

  void removeToCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
