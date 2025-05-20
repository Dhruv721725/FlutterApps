enum ChessPieceType{pawn, rook, bishop, knight, queen, king}

class ChessPiece{
    final ChessPieceType type;
    final bool isWhite;
    final String imagePath;

    ChessPiece({
        required this.imagePath,
        required this.isWhite,
        required this.type
    });
}