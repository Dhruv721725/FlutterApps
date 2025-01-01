import 'package:e_commerce/components/comp_drawer.dart';
import 'package:e_commerce/components/comp_product_tile.dart';
import 'package:e_commerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ShopPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Page🔥"),
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
              itemCount: Shop.productList.length,
              itemBuilder: (BuildContext context, index){
                return CompProductTile(product: Shop.productList[index]);
              },
              ),
          ),
        ],
      ),
    );
  }
}