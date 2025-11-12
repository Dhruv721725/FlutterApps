import 'package:bee_list/services/models.dart';
import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final DateTime time;

  const NoteTile({
    super.key,
    required this.text,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[  
        Text(
          text,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          Text("${time.day} ${months()[time.month]}, ${time.year}")
        ],)
      ],
      ),
    );
  }
}