import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_sneaks/components/cart_item.dart';
import 'package:urban_sneaks/models/cart_model.dart';
import 'package:urban_sneaks/models/shoe.dart';

class CartPage extends StatefulWidget {
  
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  void onDel (Shoe shoe){
    setState(() {
      Provider.of<CartModel>(context, listen: false).usercart.remove(shoe);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
    builder: (context, value, child )=>Column(
      crossAxisAlignment: CrossAxisAlignment.start,  
      children: [
        Text (
          "My Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 20,
          ),
        ),

        const SizedBox(height: 10,),
        Expanded(
          child:ListView.builder(
            itemCount: value.userCartList().length,
            itemBuilder: (context,index){
              Shoe shoe=value.userCartList()[index];
              return CartItem(
                shoe: shoe,
                onDel: ()=>onDel(shoe),
                );
            },
          )
        )
      ],
    ));
  }
}