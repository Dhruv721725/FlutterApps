import 'package:flutter/material.dart';
import 'package:urban_sneaks/models/shoe.dart';

class ShoeTile extends StatelessWidget{
  Shoe shoe;
  void Function()? addShoeToCart;
  ShoeTile({required this.shoe, required this.addShoeToCart, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // shoe image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              shoe.imgPath,
              fit: BoxFit.fitWidth,
              ),
          ),

          // description
          Text(
            shoe.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[600]
            ),
            ),

          // price + detatils
          Padding(padding : EdgeInsets.only(left: 10),child:Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  // name
                  Text(
                    shoe.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  // price
                  Text(shoe.price),
                ],
              ),
              // addtocart
              GestureDetector(
                onTap: addShoeToCart,
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius:BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                      ) ,
                  ),
                  child: Icon(
                    Icons.add_shopping_cart,
                    color:Colors.grey[200] ,
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}