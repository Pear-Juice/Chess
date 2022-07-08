class Tile
{
  int x;
  int y;
  
  Piece currentPiece = new Piece();

  color col = -1;
  boolean tileCol;

  public void setPiece(PieceType pieceType)
  {
    currentPiece.type = pieceType;
  }
}
