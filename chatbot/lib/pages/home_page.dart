import 'package:chatbot/components/comp_drawer.dart';
import 'package:chatbot/services/gemini_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GeminiService _geminiService=GeminiService();
  TextEditingController _promptController = TextEditingController();
  String _response="";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Jimmy"),
        ),
      
        drawer: CompDrawer(),
        
        body: Column(
          children: [
            
            Expanded( 
              child:Text(_response)
            ),

            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: TextField(
                controller: _promptController,
                decoration: InputDecoration(
                  hintText: "Prompt here...",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary)
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)
                  ),
                  suffixIcon: IconButton(
                    onPressed: ()async{
                      var response = await _geminiService.getGeminiResponse(_promptController.text);
                      setState((){
                        _response=response;
                      });
                    }, 
                    icon: Icon(Icons.send)
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}