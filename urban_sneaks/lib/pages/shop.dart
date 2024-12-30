import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_sneaks/components/shoe_tile.dart';
import 'package:urban_sneaks/models/cart_model.dart';
import 'package:urban_sneaks/models/shoe.dart';

class ShopPage extends StatefulWidget {
  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  
  
  void addShoeToCart(Shoe shoe){
    Provider.of<CartModel>(context,listen: false).addItemToCart(shoe);
    // alert
    showDialog(context: context, builder:(context)=> AlertDialog(
      title: Text("Succesfully Added to Cart."),
      content:Text("Check Your Cart")
    ));
  }
  
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, value, child) {
        return Column(
          children:[
            // Search Bar
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Search"),
                  Icon(Icons.search)
                ],
              ),
              ),
            // message
            Padding(padding:EdgeInsets.all(10), 
            child:Text(
              "Step into the wild—every sneaker tells a story, every trail becomes an adventure.",
              textAlign:TextAlign.center,
              style: TextStyle(
                color: Colors.grey[800]
              ),
              )
            ),
            //pics
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hot Picks 🔥",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                ),
                Text("see all",
                style:TextStyle(
                  color: Colors.blue
                ) ,
                )
              ],
            ),
          
            const SizedBox(height: 10,),
        
            Expanded(child: ListView.builder(
              itemCount: value.getShoeList().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                Shoe shoe=value.getShoeList()[index];
                return ShoeTile(
                  shoe: shoe,
                  addShoeToCart: ()=>addShoeToCart(shoe),
                  );
                }, 
              ),
            ),
        
            const SizedBox(height: 30,),
          ]
        );
      }
    );
  } 
}