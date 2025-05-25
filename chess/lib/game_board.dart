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
  List<ChessPiece> whiteTaken = [];
  List<ChessPiece> blackTaken = [];

  // for getting players turn
  bool isWhiteTurn = true;

  List <int> wking = [0,4];
  List <int> bking = [7,4];
  bool checkStatus = false;

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
      newBoard[1][i] = ChessPiece(imagePath: "lib/pieces/pawn.png", isWhite: true, type: ChessPieceType.pawn);
      newBoard[6][i] = ChessPiece(imagePath: "lib/pieces/pawn.png", isWhite: false, type: ChessPieceType.pawn);
    }

    // placing rooks
    newBoard[0][0] = ChessPiece(imagePath: "lib/pieces/rook.png", isWhite: true, type: ChessPieceType.rook);
    newBoard[0][7] = ChessPiece(imagePath: "lib/pieces/rook.png", isWhite: true, type: ChessPieceType.rook);
    newBoard[7][0] = ChessPiece(imagePath: "lib/pieces/rook.png", isWhite: false, type: ChessPieceType.rook);
    newBoard[7][7] = ChessPiece(imagePath: "lib/pieces/rook.png", isWhite: false, type: ChessPieceType.rook);
    
    // placing knights
    newBoard[0][1] = ChessPiece(imagePath: "lib/pieces/knight.png", isWhite: true, type: ChessPieceType.knight);
    newBoard[0][6] = ChessPiece(imagePath: "lib/pieces/knight.png", isWhite: true, type: ChessPieceType.knight);
    newBoard[7][1] = ChessPiece(imagePath: "lib/pieces/knight.png", isWhite: false, type: ChessPieceType.knight);
    newBoard[7][6] = ChessPiece(imagePath: "lib/pieces/knight.png", isWhite: false, type: ChessPieceType.knight);
    
    // placing bishops
    newBoard[0][2] = ChessPiece(imagePath: "lib/pieces/bishop.png", isWhite: true, type: ChessPieceType.bishop);
    newBoard[0][5] = ChessPiece(imagePath: "lib/pieces/bishop.png", isWhite: true, type: ChessPieceType.bishop);
    newBoard[7][2] = ChessPiece(imagePath: "lib/pieces/bishop.png", isWhite: false, type: ChessPieceType.bishop);
    newBoard[7][5] = ChessPiece(imagePath: "lib/pieces/bishop.png", isWhite: false, type: ChessPieceType.bishop);
  
    // placing queens
    newBoard[0][3] = ChessPiece(imagePath: "lib/pieces/queen.png", isWhite: true, type: ChessPieceType.queen);
    newBoard[7][3] = ChessPiece(imagePath: "lib/pieces/queen.png", isWhite: false, type: ChessPieceType.queen);
    
    // placing kings
    newBoard[0][4] = ChessPiece(imagePath: "lib/pieces/king.png", isWhite: true, type: ChessPieceType.king);
    newBoard[7][4] = ChessPiece(imagePath: "lib/pieces/king.png", isWhite: false, type: ChessPieceType.king);
    
    //test set
    
    board = newBoard;
  }

  void pieceSelected(int row, int col){
    setState(() {

      if (selectedPiece==null && board[row][col] !=null ) {
        if (board[row][col]!.isWhite==isWhiteTurn) {
          selectedPiece = board[row][col];
          selectedRow = row;
          selectedCol = col; 
        }
      }else if(selectedPiece!=null && board[row][col]!=null && selectedPiece!.isWhite == board[row][col]!.isWhite){
        selectedPiece = board[row][col];
        selectedRow = row;
        selectedCol = col;
      }else if(selectedPiece !=null){
        bool valid = false;
        for (var i in validMoves) {
          if (row==i[0] && col==i[1]) {
            valid=true;
            break;
          }
        }
        if (valid) {
          move(row, col);
        }else{
          // selectedPiece = board[row][col];
          // selectedRow = row;
          // selectedCol = col;
          selectedPiece = null;
          validMoves = [];
        }
      }
      // if a piece is selected its valid moves
      if (selectedPiece!=null) {
        validMoves = calcRealMoves(row, col, selectedPiece!);
      }else{
        validMoves = [];
      }
    });
  }

  List<List<int>> _calculateRawValidMoves(int row, int col, ChessPiece? piece){
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
        var rcords = [[0,1], [0,-1], [1,0], [-1,0]];
        for(var cords in rcords){
          int i=row+cords[0], j= col+cords[1];
          while (isInBoard(i, j)) {
            if (board[i][j]!=null) {
              if (board[i][j]!.isWhite!=piece.isWhite) {
                candidateMoves.add([i,j]);
              }
              break;
            }
            candidateMoves.add([i,j]);
            i+=cords[0];
            j+=cords[1];
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
        for(var cords in bcords){
          int i = row+cords[0], j = col+cords[1];
          while(isInBoard(i, j)){
            if (board[i][j]!=null) {
              if (board[i][j]!.isWhite!=piece.isWhite) {
                candidateMoves.add([i,j]);
              }
              break;
            }
            candidateMoves.add([i,j]);
            i+=cords[0];
            j+=cords[1];
          }    
        }
        break;
      case ChessPieceType.queen:
        var qcords = [[0,1], [0,-1], [1,0], [-1,0], [-1,-1], [-1,1], [1,-1], [1,1],];
        for(var cords in qcords){
          int i=row+cords[0], j= col+cords[1];
          while (isInBoard(i, j)) {
            if (board[i][j]!=null) {
              if (board[i][j]!.isWhite!=piece.isWhite) {
                candidateMoves.add([i,j]);
              }
              break;
            }
            candidateMoves.add([i,j]);
            i+=cords[0];
            j+=cords[1];
          }
        }
        break;

      case ChessPieceType.king:
        var kcords = [[0,1], [0,-1], [1,0], [-1,0], [-1,-1], [-1,1], [1,-1], [1,1],];
        for(var cords in kcords){
          int i = row+cords[0] , j= col+cords[1];
          if (isInBoard(i, j) && (board[i][j]==null || board[i][j]!.isWhite!= piece.isWhite)) {
            candidateMoves.add([i,j]);
          }
        }
        break;
      default:
    }

    return candidateMoves;
  }

  // calculating real valid moves which dosen't let the king to enter the check
  List<List<int>> calcRealMoves(int row, int col, ChessPiece piece){
    List<List<int>> cmoves = _calculateRawValidMoves(row, col, piece);
    List<List<int>> vmoves = [];

    if (piece.type!=ChessPieceType.king) {
      for (var cord in cmoves) {
        if (isMoveSafe(piece, row, col, cord[0], cord[1])) {
          vmoves.add(cord);
        }
      }
    }else{
      List<int> originalKingPos = piece.isWhite ? wking : bking;
      for (var cord in cmoves) {
        // simulated
        ChessPiece? temp = board[cord[0]][cord[1]];
        board[cord[0]][cord[1]]=piece;
        board[row][col]=null;

        if (piece.isWhite) {
          wking = [cord[0],cord[1]]; 
        }else{
          bking = [cord[0],cord[1]];
        }

        if (!isKingChecked(piece.isWhite)) {
          vmoves.add(cord); 
        }

        board[row][col] = piece;
        board[cord[0]][cord[1]] = temp;

        if (piece.isWhite) {
          wking = originalKingPos;
        }else{
          bking = originalKingPos;
        }
      }
    }

    return vmoves;
  }

  bool isMoveSafe(ChessPiece piece, int row, int col, int drow, int dcol){
    // simulating movements
    bool safe = true;
    // piece at destination 
    ChessPiece? temp = board[drow][dcol];
    board[drow][dcol] = board[row][col];
    board[row][col] = null;

    // getting cords of king of color of piece
    List<int> kingPos = piece!.isWhite ? wking : bking;

    if (isKingChecked(piece!.isWhite)) {
      safe=false;
    }

    // putting pieces back
    board[row][col] = board[drow][dcol];
    board[drow][dcol] = temp;

    return safe;
  }

  void move(int nrow, int ncol){
    // if the new spot has an enemy piece store it 
    if (board[nrow][ncol]!=null) {
      if (selectedPiece!.isWhite) {
        blackTaken.add(board[nrow][ncol]!);
      }else{
        whiteTaken.add(board[nrow][ncol]!);
      }
    }

    board[nrow][ncol] = selectedPiece;
    board[selectedRow][selectedCol]=null;

    if (selectedPiece!.type==ChessPieceType.king) {
      if (selectedPiece!.isWhite) {
        wking = [nrow, ncol];
      }else{
        bking = [nrow, ncol];
      }
    }
    
    // if king is under attack
    if (isKingChecked(!isWhiteTurn)) {
      checkStatus = true;
    }else{
      checkStatus = false;
    }

    setState(() {
      selectedPiece=null;
      selectedRow=-1;
      selectedCol=-1;
      validMoves=[];
    });
    
    if (isCheckMate(!isWhiteTurn)) {
      showDialog(context: context, builder: (context)=>AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("C H E C K  M A T E !"),
            Text("${isWhiteTurn? "Black" : "White"} Wins🎉🎊",style: TextStyle(fontSize: 14),),
          ],
        ),
        actions: [
          TextButton(
            onPressed:resetGame,
            child: Text("Play Again")
          )
        ],
      ));
    }

    isWhiteTurn=!isWhiteTurn;
  }
  void resetGame(){
    validMoves=[];
    wking = [0,4];
    bking = [7,4];
    checkStatus = false;
    whiteTaken.clear();
    blackTaken.clear();
    _initializeBoard();
    isWhiteTurn = true;
    setState(() {});
    Navigator.pop(context);
  }

  bool isKingChecked(bool isWhiteKing){
    List<int> kingPos = isWhiteKing ? wking: bking;
    // check if any enemy piece can attack the king
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        // skip the empty spaces and pieces of same colors
        if (board[i][j]==null || board[i][j]!.isWhite==isWhiteKing){
          continue;
        }
        List<List<int>> cords = _calculateRawValidMoves(i, j, board[i][j]);
        if (cords.any((cord)=>kingPos[0]==cord[0] && kingPos[1]==cord[1])) {
          return true;
        }
      }
    }
    return false;
  }

  bool isCheckMate(bool isWhiteKing){
    // if king is not in check !checkmate
    if (!isKingChecked(isWhiteKing)) {
      return false;
    }
    
    // if their is at least one legal move for any of the player's pieces !checkmate
    for(int i=0; i<8; i++){
      for (int j=0; j<8; j++){
        if (board[i][j]==null || board[i][j]!.isWhite!=isWhiteKing) {
          continue;
        }

        List<List<int>> validMoves = calcRealMoves(i, j, board[i][j]!);
        if (validMoves.isNotEmpty) {
          return false;
        }
      }
    }

    // no legal moves to make ad king is checked its's checkmate
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: (){
                    showDialog(context: context, builder: (context)=>AlertDialog(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Restart the game!"),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: resetGame, 
                          child: Text("Restart")
                        )
                      ],
                    ));
                  }, 
                  icon: Icon(Icons.restore)
                )
              ]
            ),
      
            // W H I T E  P I E C E S  T A K E N
            Expanded(
              flex: 1,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8), 
                itemBuilder: (context, index){
                  return 
                  Container(
                    child: index < blackTaken.length? Image.asset(
                      blackTaken[index].imagePath,
                      color: Colors.grey[800],
                    ):null ,
                  );
                }
              )
            ),
            
            // C H E C K  S T A T U S
            Text(checkStatus ? "C H E C K !":"", textAlign: TextAlign.center,),
      
            // C H E S S  B O A R D
            Expanded(
              flex: 4,
              child: GridView.builder(
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
            ),
      
            // B L A C K  P I E C E S  T A K E N
            Expanded(
              flex: 1,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8), 
                itemBuilder: (context, index){
                  return 
                  Container(
                    child: index < whiteTaken.length? Image.asset(
                      whiteTaken[index].imagePath,
                      color: Colors.grey[400],
                    ):null ,
                  );
                }
              )
            ),
          ],
        ),
      ),
    );
  }
}