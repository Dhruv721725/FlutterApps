import 'package:chatbot/components/comp_funcs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CompResponseTile extends StatelessWidget{
  String  text;
  CompResponseTile({
    super.key,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.fromLTRB(8, 8, 56, 8),
      alignment: Alignment.bottomLeft,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.secondary,
        ),       
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // copy button
            Container(
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(10),topEnd: Radius.circular(10))
              ),
              child: IconButton(
                onPressed: (){
                  Clipboard.setData(ClipboardData(text: text));
                  CompFuncs().warning("Copied to clipboard.", context);
                }, 
                icon: Icon(Icons.copy,size: 15,)
              ),
            ),            
            // response
            Container(
              padding: EdgeInsets.all(12),
              child: Text(text.trim(), style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),)
            ),
          ],
        ),
      ),
    );
  }
}