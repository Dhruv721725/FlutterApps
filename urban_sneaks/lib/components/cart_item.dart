import 'package:flutter/material.dart';
import 'package:urban_sneaks/models/shoe.dart';

class CartItem extends StatefulWidget {
  void Function()? onDel;
  Shoe shoe;
  CartItem({required this.shoe, required this.onDel, super.key});
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25,10,25,0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image:AssetImage('lib/shoesImages/logo.png'),
          )
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(4),
        leading: Image.asset(widget.shoe.imgPath),
        title: Text(widget.shoe.name),
        subtitle: Text(widget.shoe.price),
        trailing: 
        IconButton(
          onPressed: widget.onDel,
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}