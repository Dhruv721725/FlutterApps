import 'package:chess/components/piece.dart';
import 'package:chess/components/square.dart';
import 'package:chess/helper/helper_methods.dart';
import 'package:chess/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GameBoard extends StatefulWidget{
  const GameBoard({super.key});
  @override
  State<GameBoard> createState()=> _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {

  // ChessPiece pawn = ChessPiece(imagePath: "pieces/bishop.png", isWhite: false, type: ChessPieceType.pawn);
  // A 2d list representing our board

  late List<List<ChessPiece?>> board;

  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  void _initializeBoard(){
    // assigning pieces to their coordinate
    List<List<ChessPiece?>> newBoard = List.generate(8,(index)=>List.generate(8, (index)=>null));
    
    // placing pawns
    for (int i = 0; i < 8; i++) {
      newBoard[1][i] = ChessPiece(imagePath: "pieces/pawn.png", isWhite: true, type: ChessPieceType.pawn);
      newBoard[6][i] = ChessPiece(imagePath: "pieces/pawn.png", isWhite: false, type: ChessPieceType.pawn);
    }

    // placing rooks
    newBoard[0][0] = ChessPiece(imagePath: "pieces/rook.png", isWhite: true, type: ChessPieceType.rook);
    newBoard[0][7] = ChessPiece(imagePath: "pieces/rook.png", isWhite: true, type: ChessPieceType.rook);
    newBoard[7][0] = ChessPiece(imagePath: "pieces/rook.png", isWhite: false, type: ChessPieceType.rook);
    newBoard[7][7] = ChessPiece(imagePath: "pieces/rook.png", isWhite: false, type: ChessPieceType.rook);
    
    // placing knights
    newBoard[0][1] = ChessPiece(imagePath: "pieces/knight.png", isWhite: true, type: ChessPieceType.knight);
    newBoard[0][6] = ChessPiece(imagePath: "pieces/knight.png", isWhite: true, type: ChessPieceType.knight);
    newBoard[7][1] = ChessPiece(imagePath: "pieces/knight.png", isWhite: false, type: ChessPieceType.knight);
    newBoard[7][6] = ChessPiece(imagePath: "pieces/knight.png", isWhite: false, type: ChessPieceType.knight);
    
    // placing bishops
    newBoard[0][2] = ChessPiece(imagePath: "pieces/bishop.png", isWhite: true, type: ChessPieceType.bishop);
    newBoard[0][5] = ChessPiece(imagePath: "pieces/bishop.png", isWhite: true, type: ChessPieceType.bishop);
    newBoard[7][2] = ChessPiece(imagePath: "pieces/bishop.png", isWhite: false, type: ChessPieceType.bishop);
    newBoard[7][5] = ChessPiece(imagePath: "pieces/bishop.png", isWhite: false, type: ChessPieceType.bishop);
  
    // placing queens
    newBoard[0][3] = ChessPiece(imagePath: "pieces/queen.png", isWhite: true, type: ChessPieceType.queen);
    newBoard[7][4] = ChessPiece(imagePath: "pieces/queen.png", isWhite: false, type: ChessPieceType.queen);
    
    // placing kings
    newBoard[0][4] = ChessPiece(imagePath: "pieces/king.png", isWhite: true, type: ChessPieceType.king);
    newBoard[7][3] = ChessPiece(imagePath: "pieces/king.png", isWhite: false, type: ChessPieceType.king);
    
    board = newBoard;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GridView.builder(
        itemCount: 8*8,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: 
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8,), 
        
        itemBuilder: (context, index){
          return Square(
            isWhite: isWhite(index),
            piece: board[index~/8][index%8],
          );
        },

      ),
    );
  }
}