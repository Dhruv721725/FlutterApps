import 'dart:io';

import 'package:e_commerce/components/comp_button.dart';
import 'package:e_commerce/components/comp_drawer.dart';
import 'package:e_commerce/models/prduct.dart';
import 'package:e_commerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().userCart;
    void onDel(BuildContext context, Product product){
      showDialog(
        context: context, 
        builder: (context)=>AlertDialog(
          content:Text("Do you want to remove this product?"),
          actions: [
            MaterialButton(
              onPressed: (){
                setState(() {
                  Provider.of<Shop>(context,listen: false).removeFromCart(product);
                });
                Navigator.of(context).pop();
              },
              child: Text("Yes"),
            ),
            
            MaterialButton(
              onPressed: Navigator.of(context).pop,
              child: Text("No"),
            ),
            
          ],
        )
      );
    }

    void payFun(BuildContext context,){
      showDialog(
        context: context, 
        builder: (context)=>AlertDialog(
          content:Text("place order now?"),
          actions: [
            MaterialButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text("Yes"),
            ),
            
            MaterialButton(
              onPressed: Navigator.of(context).pop,
              child: Text("No"),
            ),
            
          ],
        )
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page🔥"),
        actions:[ 
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, "/shop_page"),
            child: Icon(Icons.home),
          ),
        ),
        ],
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer:CompDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        // padding: EdgeInsets.symmetric(vertical: 20),
        child:Column(
          children: [
            Expanded(
              child: cart.length!=0 ?ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      tileColor: Theme.of(context).colorScheme.primary,
                      leading: Image.asset(cart[index].imagePath),
                      title: Text(cart[index].name),
                      subtitle: Text(cart[index].price.toString()),
                      trailing: IconButton(
                        onPressed: ()=>onDel(context, cart[index]), 
                        icon: Icon(Icons.delete),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.secondary),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                          iconColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.inversePrimary)
                        ),
                      ),
                    ),
                  );
                }
              ):Center(child: Text("Your cart is empty.")),
            ),
        
            Container(
              margin: EdgeInsets.all(50),
              child: CompButton(
                onPressed: (){payFun(context);}, 
                child: Text("Pay Now"),
              ),
            )
          ]
        ),
      ),
    );
  }
}