import 'package:e_commerce/models/prduct.dart';
import 'package:flutter/material.dart';

class Shop {
  static final List <Product> _products=[
    Product(name: "Wallet 5", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/wallet5.jpg"),
    Product(name: "Watch 5", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/watch5.jpg"),
    Product(name: "Cap 5", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/cap5.jpg"),
    Product(name: "Ring 5", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/ring5.jpg"),
    Product(name: "Glasses 5", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/glasses5.jpg"),
  ];

  final List <Product> _userCart=[];

  static get productList=>_products;
  
  get userCart=>_userCart;

  void addToCart(Product product){
    _userCart.add(product);
  }

  void removeFromCart(Product product){
    _userCart.remove(product);
  }
}