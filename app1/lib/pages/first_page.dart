import 'package:app1/pages/second_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page1"),
        backgroundColor: Colors.blue,
      ),
      body:Center(
        child:ElevatedButton(
          onPressed: ()=>{
            print("Button clicked"),
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage(),),)
            }, 
          child: Text(
            "Click Me to visit second page",
            ),
          ),
        )
    );
  }
}