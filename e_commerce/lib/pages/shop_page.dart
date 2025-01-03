import 'package:e_commerce/components/comp_drawer.dart';
import 'package:e_commerce/components/comp_product_tile.dart';
import 'package:e_commerce/models/prduct.dart';
import 'package:e_commerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<Shop>(context).productList;
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Page🔥"),
        actions:[ 
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, "/cart_page"),
            child: Icon(Icons.shopping_cart),
          ),
        ),
        ],
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer:CompDrawer(),
      body: ListView(
        children: [
          Center(
            child: Text(
              "Pick from the selected list of premiumm products."
            ),
          ),  

          Container(
            height: 550,
            child: ListView.builder(
              padding: EdgeInsets.all(15),
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (BuildContext context, index){
                return CompProductTile(product: products[index]);
              },
              ),
          ),
        ],
      ),
    );
  }
}