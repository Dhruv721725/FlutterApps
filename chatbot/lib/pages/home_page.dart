import 'package:chatbot/components/comp_drawer.dart';
import 'package:chatbot/components/comp_funcs.dart';
import 'package:chatbot/components/comp_textfield.dart';
import 'package:chatbot/firestore/fire_store.dart';
import 'package:chatbot/services/gemini_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _prompt = TextEditingController();
  GeminiService _gemini = GeminiService();
  FireStore _firestore  = FireStore();
  String _response="";

  void respond()async{
    String text = _prompt.text.trim();
    if (text!="") {
      
      setState(() {
        _response = "Thinking...";
      });

      _firestore.addMessage(text, "prompt");
      
      String response = await _gemini.getGeminiResponse(text);
      
      _firestore.addMessage(response, "response");

      setState(() {
        _response = response;
      });

    }else{
      CompFuncs().warning("Empty prompt", context);
    }
  }
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

            CompTextfield(
              controller: _prompt, 
              hintText: "prompt here...",

              suffixIcon:IconButton(
                onPressed: respond, 
                icon: Icon(Icons.send)
              ) ,
            )
          ],
        ),
      ),
    );
  }
}