import 'package:e_commerce/models/prduct.dart';
import 'package:e_commerce/models/shop.dart';
import 'package:flutter/material.dart';

class CompProductTile extends StatelessWidget {
  final Product product;
  const CompProductTile({
    super.key,
    required this.product,
  });

  void addToCart(BuildContext context){
    showDialog(
      context: context, 
      builder: (context)=>AlertDialog(
        content: Text("Add this item to your cart?"),
        actions: [
          MaterialButton(
            onPressed: (){
              Navigator.of(context).pop();
              // Shop.addToCart(product);
            },
            child: Text("Yes"),
            ),
          MaterialButton(
            onPressed: ()=>Navigator.of(context).pop(),
            child: Text("Cancel"),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10)
      ),
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  padding: EdgeInsets.all(25),
                  width: double.infinity,
                  child: ClipRRect(
                    child: Image.asset(product.imagePath),
                  ),
                )
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                product.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                ),
                
              Text(
                product.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  
                ),
                textAlign: TextAlign.center,
                ),
            ],
          ),
            
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.price.toString()),
              IconButton(
                onPressed: ()=>addToCart(context), 
                icon: Icon(Icons.add_shopping_cart),
                padding: EdgeInsets.all(10),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.secondary),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}