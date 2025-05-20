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

  // A 2d list representing our board

  late List<List<ChessPiece?>> board;

  ChessPiece? selectedPiece;
  // the index of selected piece
  int selectedRow = -1;
  int selectedCol = -1;

  // list of valid moves [[row,col]...]
  List<List<int>> validMoves = [];
  
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
    
    //test set
    newBoard[3][3] = ChessPiece(imagePath: "pieces/knight.png", isWhite: false, type: ChessPieceType.knight);
    board = newBoard;
  }

  void pieceSelected(int row, int col){
    setState(() {
      if (board[row][col] !=null ) {
        selectedPiece = board[row][col];
        selectedRow = row;
        selectedCol = col;
      }else{
        selectedPiece = null;
        selectedRow = row;
        selectedCol = col;
      }
      // if a piece is selected its valid moves
      if (selectedPiece!=null) {
        validMoves = CalculateRawValidMoves(row, col, selectedPiece);
      }else{
        validMoves = [];
      }

      for (int i=0; i<validMoves.length; i++) {
        print(validMoves[i]);
      }
    });
  }

  List<List<int>> CalculateRawValidMoves(int row, int col, ChessPiece? piece){
    List<List<int>> candidateMoves = [];

    int direction = piece!.isWhite? 1: -1;
    
    switch (piece.type) {
      case ChessPieceType.pawn:
        // pawn can move forward if no one is there
        if(isInBoard(row+direction,col) && board[row+direction][col]==null){
          candidateMoves.add([row+direction,col]);
        }
        // pawn can move two steps if it is at start
        if(
          ((piece!.isWhite && row == 1) || (!piece!.isWhite && row == 6)) &&
          isInBoard(row+direction*2,col) && 
          board[row+direction*2][col]==null
        ){
          candidateMoves.add([row+direction*2,col]);
        }

        // pawn can move one step diagonally if any opponent is there
        if(
          isInBoard(row+direction,col+1) && 
          board[row+direction][col+1]!=null && 
          piece.isWhite != board[row+direction][col+1]!.isWhite
        ){
          candidateMoves.add([row+direction,col+1]);
        }
        if(
          isInBoard(row+direction,col-1) && 
          board[row+direction][col-1]!=null && 
          piece.isWhite != board[row+direction][col-1]!.isWhite
        ){
          candidateMoves.add([row+direction,col-1]);
        }
        break;

      case ChessPieceType.rook:
        // vertical directions row to 7th row and row to 0th row
        for(int i=row+1; i<8; i++){
          if (board[i][col]!=null) {
            if (piece.isWhite!=board[i][col]!.isWhite) {
              candidateMoves.add([i,col]);
            }
            break;
          }else{
            candidateMoves.add([i,col]);
          }
        }
        
        for(int i=row-1; i>=0; i--){
          if (board[i][col]!=null) {
            if (piece.isWhite!=board[i][col]!.isWhite) {
              candidateMoves.add([i,col]);
            }
            break;
          }else{
            candidateMoves.add([i,col]);
          }
        }

        // horizontal direction col to 7th col and col to 0th col
        for(int j=col+1; j<8; j++){
          if (board[row][j]!=null) {
            if (piece.isWhite!=board[row][j]!.isWhite) {
              candidateMoves.add([row,j]);
            }
            break;
          }else{
            candidateMoves.add([row,j]);
          }
        }
        
        for(int j=col-1; j>=0; j--){
          if (board[row][j]!=null) {
            if (piece.isWhite!=board[row][j]!.isWhite) {
              candidateMoves.add([row,j]);
            }
            break;
          }else{
            candidateMoves.add([row,j]);
          }
        }
        break;
      
      case ChessPieceType.knight:
        // coordinates of knights are fix i.e
        List<List<int>> knightMoves = [
          [2,-1],
          [2,1],
          [-2,-1],
          [-2,1],
          [-1,-2],
          [-1,2],
          [1,-2],
          [1,2],
        ];  
        for(var i in knightMoves){
          int kr = row+i[0];
          int kc = col+i[1];
          if (
            isInBoard(kr, kc) && 
            (board[kr][kc]==null || piece.isWhite!=board[kr][kc]!.isWhite)
          ){
            candidateMoves.add([kr,kc]);
          }
        }
        break;
      case ChessPieceType.bishop:
        var bcords = [
          [-1,-1],
          [-1,1],
          [1,-1],
          [1,1],
        ];
        for(int i = row; i<)
        break;
      case ChessPieceType.queen:
        break;
      case ChessPieceType.king:
        break;
      default:
    }

    return candidateMoves;
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
          int row = index ~/ 8;
          int col = index % 8;
          
          bool valid=false;
          for (int i = 0; i < validMoves.length; i++) {
            if (row==validMoves[i][0] && col==validMoves[i][1]) {
              valid=true;
              validMoves.remove([row,col]);
            }
          }
          return Square(
            isWhite: isWhite(index),
            piece: board[row][col],
            isSelected: row == selectedRow && col == selectedCol,
            onTap: () => pieceSelected(row, col),
            isValidMove: valid,
          );
        },

      ),
    );
  }
}