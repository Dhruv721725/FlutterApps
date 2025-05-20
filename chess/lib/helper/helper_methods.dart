bool isWhite(index){
  return (index~/8 + index%8)%2 == 0?true : false; 
}
bool isInBoard(row,col){
  return row<8 && row>-1 && col<8 && col>-1;
}