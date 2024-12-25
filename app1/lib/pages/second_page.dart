import 'package:app1/pages/first_page.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget{
  const SecondPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page2"),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(200, 33, 149, 243),
        child: Column(
          children: [
            //? DrawerHeader(
            //? ),
            ListTile(
            ),
          ]
        ),
      ),
      body:Center(
        child:ElevatedButton(
          onPressed: ()=>{
            print("Button clicked"),
            Navigator.pushNamed(context,'/firstpage')
            }, 
          child: Text(
            "Click Me to visit first page",
            ),
          ),
        )
    );
  }
}