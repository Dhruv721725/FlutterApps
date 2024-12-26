import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ButtonCounter()
    );
  }
}

class ButtonCounter extends StatefulWidget{
  @override
  State<ButtonCounter> createState() => _ButtonCounterState();
}

class _ButtonCounterState extends State<ButtonCounter> {
  int _counter=0;

  void increase(){
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My 1st App"),
        backgroundColor: Colors.purple,
      ),
      body:Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("This is the no. of times u pushed the button."),
          Text(
            "$_counter",
            style:TextStyle(
              fontSize:20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.purpleAccent),
            ),
            onPressed: () {increase();},
            child: Icon(Icons.add,),
          ),
        ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){increase();},
        child: Icon(Icons.add),
        backgroundColor: Colors.purpleAccent,  
      ),
    );
  } 
}