import 'package:chess/components/piece.dart';
import 'package:chess/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Square extends StatelessWidget{
  final bool isWhite ;
  final ChessPiece? piece;
  final bool isSelected;
  final Function()? onTap;
  final bool isValidMove; 

  Square({
    super.key,
    required this.isWhite,
    this.piece,
    required this.isSelected,
    required this.onTap,
    required this.isValidMove,
  });

  @override
  Widget build(BuildContext context) {
    Color? squareColor;
    if (isSelected) {
      squareColor = Colors.green;
    }else if(isValidMove){
      squareColor = Colors.tealAccent;
    }
    else{
      squareColor = isWhite? foregroungColor : backgroundColor;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: squareColor,
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