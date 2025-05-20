import 'package:chess/components/piece.dart';
import 'package:chess/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Square extends StatelessWidget{
  final bool isWhite ;
  final ChessPiece? piece;
  Square({
    super.key,
    required this.isWhite,
    this.piece,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: isWhite? foregroungColor : backgroundColor,
        child: piece!=null ? 
          Image.asset(
            piece!.imagePath,
            color: piece!.isWhite? Colors.white: Colors.black ,
          ) : 
          null,
      ),
    );
  }
}