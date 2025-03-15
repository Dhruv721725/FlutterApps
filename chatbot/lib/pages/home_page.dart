import 'package:chatbot/components/comp_drawer.dart';
import 'package:chatbot/components/comp_funcs.dart';
import 'package:chatbot/components/comp_prompt_tile.dart';
import 'package:chatbot/components/comp_response_tile.dart';
import 'package:chatbot/components/comp_textfield.dart';
import 'package:chatbot/firestore/fire_store.dart';
import 'package:chatbot/services/gemini_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _promptText = TextEditingController();
  GeminiService _gemini = GeminiService();
  FireStore _firestore  = FireStore();
  Widget _response=SizedBox();
  Widget _prompt=SizedBox();

  void respond()async{
    String text = _promptText.text.trim();
    if (text!="") {
      setState(() {
        _prompt = CompPromptTile(text: text);
        _response = CompResponseTile(text:'Thinking...');
      });
      
      _promptText.clear();
      String response = await _gemini.getGeminiResponse(text+" please result in brief");
      
      setState(() {
        _response = CompResponseTile(text:response);
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
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text("Jimmy"),
        ),
      
        drawer: CompDrawer(),
        
        body: Column(
          children: [
            Expanded( 
              child:ListView(
                children: [
                  _prompt,
                  _response,
                ],
              )
            ),

            CompTextfield(
              controller: _promptText, 
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