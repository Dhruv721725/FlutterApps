import 'package:flutter/material.dart';
import 'package:urban_sneaks/pages/home.dart';

class IntroPage extends StatelessWidget{
  const IntroPage({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center( child: Padding(padding: EdgeInsets.all(30),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
      
            // logo
            Padding(padding:EdgeInsets.all(50),
            child: Image.asset(
                "./lib/shoesImages/logo.png",
                height: 240,
              ),
            ),

            const SizedBox(height: 40,),

            // text slogan
            Text("Have Guts to Dare",
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
      
            Text("Step into the wild—every sneaker tells a story, every trail becomes an adventure.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey
              ),
              textAlign: TextAlign.center,
            ),
      
            // button
            GestureDetector(
              onTap: ()=>Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> HomePage())
              ),
              child: Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10)
              ),
              child:const Center(child:Text(
                "Shop Now",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  ),
                )
              ),
            ))
          ],
        ),
      )),
    );
  }
}
