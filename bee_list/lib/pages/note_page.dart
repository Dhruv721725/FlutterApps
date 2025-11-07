import 'package:bee_list/components/delete_alert.dart';
import 'package:bee_list/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotePage extends StatefulWidget {
  final String keyText;
  final int id;
  NotePage({
    super.key,
    required this.keyText,
    required this.id,
  });
  
  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  late TextEditingController _controller = new TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: Data[widget.keyText]!["Notes"]![widget.id]["text"]);
  }

  void onDelete(){
    showDialog(
      context: context, 
      builder: (context)=>DeleteAlert(
        message: "Are your sure?", 
        onDelete: (){
          setState(() {
            print("Deleting item");
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    saveNote();
    _controller.dispose();
    super.dispose();
  }

  void saveNote(){
    Data[widget.keyText]!["Notes"]![widget.id]["text"]=_controller.text;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.keyText} Note"),

        actions: [
          IconButton(
            onPressed: onDelete,
            icon: Icon(Icons.delete_outlined)
          )
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(12),
        child: Container(
          height: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12)
          ),
          child: TextFormField(
            controller: _controller,
            autofocus: true,
            maxLines: null,
            minLines: 1,
            keyboardType: TextInputType.multiline,
          
            textInputAction: TextInputAction.newline,
          
            decoration: InputDecoration(
              hintText: "Write your note here...",
              border: InputBorder.none
            ),  
          ),
        ),
      ), 
    );
  }
}