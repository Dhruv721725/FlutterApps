import 'package:flutter/material.dart';
import 'package:urban_sneaks/models/shoe.dart';

class CartModel extends ChangeNotifier{
  List<Shoe> shoeShop=[
    Shoe(name: "Dark Forest", imgPath: 'lib/shoesImages/hulk.jpg', price: "\$80", description: "Dare To Wear🔥"),
    Shoe(name: "Dooms day", imgPath: 'lib/shoesImages/black.jpg', price: "\$150", description: "Dare To Wear🔥"),
    Shoe(name: "Aligator", imgPath: 'lib/shoesImages/crocodile.jpg', price: "\$90", description: "Dare To Wear🔥"),
    Shoe(name: "Dead Pool", imgPath: 'lib/shoesImages/deadpool.jpg', price: "\$70", description: "Dare To Wear🔥"),
    Shoe(name: "Avengers", imgPath: 'lib/shoesImages/avengers.jpg', price: "\$70", description: "Dare To Wear🔥"),
    Shoe(name: "Classic", imgPath: 'lib/shoesImages/brown.jpg', price: "\$77", description: "Dare To Wear🔥"),
    Shoe(name: "Nike Clove", imgPath: 'lib/shoesImages/green.jpg', price: "\$85", description: "Dare To Wear🔥"),
    Shoe(name: "Guardmen", imgPath: 'lib/shoesImages/grey.jpg', price: "\$130", description: "Dare To Wear🔥"),
    Shoe(name: "Lavendar", imgPath: 'lib/shoesImages/lavendar.jpg', price: "\$110", description: "Dare To Wear🔥"),
    Shoe(name: "Supreme", imgPath: 'lib/shoesImages/coffee.jpg', price: "\$120", description: "Dare To Wear🔥"),
  ];

  List<Shoe> usercart=[];

  List<Shoe> getShoeList(){
    return shoeShop;
  }

  List<Shoe> userCartList(){
    return usercart;
  }

  void addItemToCart(Shoe shoe){
    usercart.add(shoe);
  }

  void removeItemFromCart(Shoe shoe){
    usercart.remove(shoe);
  }
}