void generatePieces()
{
  for (int i = 0; i < 8; i++)
  {
    getTile(i, 0).currentPiece.pieceColor = 0;
    getTile(i, 1).currentPiece.pieceColor = 0;
    
    getTile(i, 6).currentPiece.pieceColor = 1;
    getTile(i, 7).currentPiece.pieceColor = 1;

    getTile(i, 6).setPiece(PieceType.pawn);
    getTile(i, 1).setPiece(PieceType.pawn);
    
    //getTile(i, 6).setPiece(null);
    //getTile(i, 1).setPiece(null);
  }

  getTile(0, 0).setPiece(PieceType.rook);
  getTile(1, 0).setPiece(PieceType.knight);
  getTile(2, 0).setPiece(PieceType.bishop);
  getTile(3, 0).setPiece(PieceType.king);
  getTile(4, 0).setPiece(PieceType.queen);
  getTile(5, 0).setPiece(PieceType.bishop);
  getTile(6, 0).setPiece(PieceType.knight);
  getTile(7, 0).setPiece(PieceType.rook);

  getTile(0, 7).setPiece(PieceType.rook);
  getTile(1, 7).setPiece(PieceType.knight);
  getTile(2, 7).setPiece(PieceType.bishop);
  getTile(3, 7).setPiece(PieceType.queen);
  getTile(4, 7).setPiece(PieceType.king);
  getTile(5, 7).setPiece(PieceType.bishop);
  getTile(6, 7).setPiece(PieceType.knight);
  getTile(7, 7).setPiece(PieceType.rook);
}

void renderAll()
{
  renderBoard();
  renderPieces();
}

void renderPieces()
{
  for (int i = 0; i < tiles.size(); i++)
  {
    for (int j = 0; j < tiles.get(i).size(); j++)
    {
      getTile(i, j).currentPiece.draw(i, j);
    }
  }
}

void renderBoard()
{
  rectMode(CORNER);

  for (int i = 0; i < tiles.size(); i++)
  {
    for (int j = 0; j < tiles.get(i).size(); j++)
    {
      if (getTile(i, j).col == -1)
      {
        fill(getTile(i, j).tileCol ? color(74, 56, 40) : color(174, 138, 105));
        stroke(getTile(i, j).tileCol ? color(74, 56, 40) : color(174, 138, 105));
      } else
      {
        fill(getTile(i, j).col);
        stroke(getTile(i, j).col);
      }
      square(i * boxWidth, j * boxWidth, boxWidth);
    }
  }
}

void darkenOnMousePressed()
{
  currentTile.col = color(currentTile.tileCol ? color(44, 26, 10) : color(144, 108, 75));

  renderBoard();
  renderPieces();
}

int lastXTile = 0;
int lastYTile = 0;
void colorCurrentMouseSquare()
{
  if (mouseXTile != lastXTile || mouseYTile != lastYTile)
    getTile(lastXTile, lastYTile).col = -1;
  currentTile.col = color(currentTile.tileCol ? color(64, 46, 30) : color(164, 128, 95));


  renderBoard();
  renderPieces();

  lastXTile = mouseXTile;
  lastYTile = mouseYTile;
}
