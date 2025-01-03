import 'package:e_commerce/models/prduct.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier{
  final List <Product> _products=[
    Product(name: "Wallet ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/wallet5.jpg"),
    Product(name: "Watch ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/watch5.jpg"),
    Product(name: "Cap ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/cap5.jpg"),
    Product(name: "Ring ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/ring5.jpg"),
    Product(name: "Glasses ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/glasses5.jpg"),
    Product(name: "Wallet ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/wallet4.jpg"),
    Product(name: "Watch ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/watch4.jpg"),
    Product(name: "Cap ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/cap4.jpg"),
    Product(name: "Ring ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/ring4.jpg"),
    Product(name: "Glasses ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/glasses4.jpg"),
    Product(name: "Wallet ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/wallet3.jpg"),
    Product(name: "Watch ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/watch3.jpg"),
    Product(name: "Cap ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/cap3.jpg"),
    Product(name: "Ring ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/ring3.jpg"),
    Product(name: "Glasses ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/glasses3.jpg"),
    Product(name: "Wallet ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/wallet2.jpg"),
    Product(name: "Watch ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/watch2.jpg"),
    Product(name: "Cap ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/cap2.jpg"),
    Product(name: "Ring ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/ring2.jpg"),
    Product(name: "Glasses ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/glasses2.jpg"),
    Product(name: "Wallet ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/wallet1.jpg"),
    Product(name: "Watch ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/watch1.jpg"),
    Product(name: "Cap ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/cap1.jpg"),
    Product(name: "Ring ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/ring1.jpg"),
    Product(name: "Glasses ", price: 150, description: "Its a feel not an accessory.", imagePath: "lib/products/glasses1.jpg"),
  ];

  final List <Product> _userCart=[];

  get productList=>_products;
  
  get userCart=>_userCart;

  void addToCart(Product product){
    _userCart.add(product);
  }

  void removeFromCart(Product product){
    _userCart.remove(product);
    Listener();
  }
}