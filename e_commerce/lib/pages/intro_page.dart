import 'package:e_commerce/components/comp_button.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.shopping_bag,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
              ),

            const SizedBox(height: 20,),

            // title
            Text(
              "Minimal Shop",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              ),

            const SizedBox(height: 10,),

            // subtitle
            Text(
              "Premium Quality Products"
              ),
             
            const SizedBox(height: 30,),
  
            // button
            CompButton(
              onPressed: ()=>Navigator.pushNamed(context, '/shop_page'), 
              child: Icon(Icons.arrow_forward)
              )

          ],
        ),
      ),
    );
  }
}