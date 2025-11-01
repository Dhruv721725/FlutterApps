import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemPage extends StatefulWidget {
  String item;
  ItemPage({
    super.key,
    required this.item 
  });
  @override
  State<ItemPage> createState() => _ItemPageState();  
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item),
      ),
    );
  }
}