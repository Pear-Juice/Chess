public class Piece
{
  public PieceType type;

  public int pieceColor = 2;

  public void draw(int x, int y)
  {
    stroke(pieceColor == 1 ? 255 : 0);
    fill(pieceColor == 1 ? 255 : 0);
    rectMode(CENTER);

    if (type == PieceType.pawn)
    {
      if (pieceColor == 1)
      {
        rect(x * boxWidth + (boxWidth / 2), y * boxWidth + (boxWidth / 1.5), boxWidth / 3, boxWidth / 8); //Base
        rect(x * boxWidth + (boxWidth / 2), y * boxWidth + (boxWidth / 2.5), boxWidth / 6, boxWidth / 3); //Stick
      } 
      else if (pieceColor == 0)
      {
        rect(x * boxWidth - (boxWidth / 2) + boxWidth, y * boxWidth - (boxWidth / 1.5) + boxWidth, boxWidth / 3, boxWidth / 8);
        rect(x * boxWidth - (boxWidth / 2) + boxWidth, y * boxWidth - (boxWidth / 2.5) + boxWidth, boxWidth / 6, boxWidth / 3);
      }
    }
    else if (type == PieceType.knight)
    {
      if (pieceColor == 1)
      {
        rect(x * boxWidth + (boxWidth / 2), y * boxWidth + (boxWidth / 1.5), boxWidth / 3, boxWidth / 8); //Base
        rect(x * boxWidth + (boxWidth / 2), y * boxWidth + (boxWidth / 2.5), boxWidth / 6, boxWidth / 3); //Stick
        
        rect(x * boxWidth + (boxWidth / 1.7), y * boxWidth + (boxWidth / 3), boxWidth / 6, boxWidth / 8 ); //Face
      }
      else if (pieceColor == 0)
      {
        rect(x * boxWidth - (boxWidth / 2) + boxWidth, y * boxWidth - (boxWidth / 1.5) + boxWidth, boxWidth / 3, boxWidth / 8); //Base
        rect(x * boxWidth - (boxWidth / 2) + boxWidth, y * boxWidth - (boxWidth / 2.5) + boxWidth, boxWidth / 6, boxWidth / 3); //Stick
        
        rect(x * boxWidth - (boxWidth / 1.7) + boxWidth, y * boxWidth - (boxWidth / 3) + boxWidth, boxWidth / 6, boxWidth / 8 ); //Face
      }
    }
    else if (type == PieceType.bishop)
    {
      if (pieceColor == 1)
      {
        rect(x * boxWidth + (boxWidth / 2), y * boxWidth + (boxWidth / 1.5), boxWidth / 3, boxWidth / 8); //Base
        triangle(
        x * boxWidth + (boxWidth / 3), y * boxWidth + (boxWidth / 2.5),
        x * boxWidth + (boxWidth / 1.5), y * boxWidth + (boxWidth / 2.5),
        x * boxWidth + (boxWidth / 2), y * boxWidth + (boxWidth / 4)
        ); //triangle top
        
        triangle(
        x * boxWidth + (boxWidth / 3), y * boxWidth + (boxWidth / 2.5),
        x * boxWidth + (boxWidth / 1.5), y * boxWidth + (boxWidth / 2.5),
        x * boxWidth + (boxWidth / 2), y * boxWidth + (boxWidth / 1.77)
        ); //triangle bottom
        
      }
      else if (pieceColor == 0)
      {
        rect(x * boxWidth - (boxWidth / 2)  + boxWidth, y * boxWidth - (boxWidth / 1.5)  + boxWidth, boxWidth / 3, boxWidth / 8); //Base
        
        triangle(
        x * boxWidth - (boxWidth / 3) + boxWidth, y * boxWidth - (boxWidth / 2.5) + boxWidth,
        x * boxWidth - (boxWidth / 1.5) + boxWidth, y * boxWidth - (boxWidth / 2.5) + boxWidth,
        x * boxWidth - (boxWidth / 2) + boxWidth, y * boxWidth - (boxWidth / 4) + boxWidth
        ); //triangle top
        
        triangle(
        x * boxWidth - (boxWidth / 3) + boxWidth, y * boxWidth - (boxWidth / 2.5) + boxWidth,
        x * boxWidth - (boxWidth / 1.5) + boxWidth, y * boxWidth - (boxWidth / 2.5) + boxWidth,
        x * boxWidth - (boxWidth / 2) + boxWidth, y * boxWidth - (boxWidth / 1.77) + boxWidth
        ); //triangle bottom
      }
    }
    else if (type == PieceType.rook)
    {
      if (pieceColor == 1)
      {
        rect(x * boxWidth + (boxWidth / 2), y * boxWidth + (boxWidth / 1.5), boxWidth / 3, boxWidth / 8); //Base
        rect(x * boxWidth + (boxWidth / 2), y * boxWidth + (boxWidth / 2.4), boxWidth / 6, boxWidth / 3.3); //Stick
        
        rect(x * boxWidth + (boxWidth / 2.8), y * boxWidth + (boxWidth / 3.2), boxWidth / 15, boxWidth / 6); //Crown Left
        
        rect(x * boxWidth + (boxWidth / 1.54), y * boxWidth + (boxWidth / 3.2), boxWidth / 15, boxWidth / 6); //Crown Right
      }
      else if (pieceColor == 0)
      {
        rect(x * boxWidth - (boxWidth / 2) + boxWidth, y * boxWidth - (boxWidth / 1.5) + boxWidth, boxWidth / 3, boxWidth / 8); //Base
        rect(x * boxWidth - (boxWidth / 2) + boxWidth, y * boxWidth - (boxWidth / 2.4) + boxWidth, boxWidth / 6, boxWidth / 3.3); //Stick
        
        rect(x * boxWidth - (boxWidth / 2.8) + boxWidth, y * boxWidth - (boxWidth / 3.2) + boxWidth, boxWidth / 15, boxWidth / 6); //Crown Left
        
        rect(x * boxWidth - (boxWidth / 1.54) + boxWidth, y * boxWidth - (boxWidth / 3.2) + boxWidth, boxWidth / 15, boxWidth / 6); //Crown Right
      }
    }
    else if (type == PieceType.queen)
    {
      if (pieceColor == 1)
      {
        rect(x * boxWidth + (boxWidth / 2), y * boxWidth + (boxWidth / 1.5), boxWidth / 3, boxWidth / 8); //Base
        
        triangle(
        x * boxWidth + (boxWidth / 3), y * boxWidth + (boxWidth / 2.5),
        x * boxWidth + (boxWidth / 1.5), y * boxWidth + (boxWidth / 2.5),
        x * boxWidth + (boxWidth / 2), y * boxWidth + (boxWidth / 4)
        ); //triangle top
        
        triangle(
        x * boxWidth + (boxWidth / 3), y * boxWidth + (boxWidth / 2.5),
        x * boxWidth + (boxWidth / 1.5), y * boxWidth + (boxWidth / 2.5),
        x * boxWidth + (boxWidth / 2), y * boxWidth + (boxWidth / 1.77)
        ); //triangle bottom
        
        rect(x * boxWidth + (boxWidth / 2), y * boxWidth + (boxWidth / 2.4), boxWidth / 4, boxWidth / 4.2); //Stick
      }
      else if (pieceColor == 0)
      {
        rect(x * boxWidth - (boxWidth / 2) + boxWidth, y * boxWidth - (boxWidth / 1.5) + boxWidth, boxWidth / 3, boxWidth / 8); //Base
        
        triangle(
        x * boxWidth - (boxWidth / 3) + boxWidth, y * boxWidth - (boxWidth / 2.5) + boxWidth,
        x * boxWidth - (boxWidth / 1.5) + boxWidth, y * boxWidth - (boxWidth / 2.5) + boxWidth,
        x * boxWidth - (boxWidth / 2) + boxWidth, y * boxWidth - (boxWidth / 4) + boxWidth
        ); //triangle top
        
        triangle(
        x * boxWidth - (boxWidth / 3) + boxWidth, y * boxWidth - (boxWidth / 2.5) + boxWidth,
        x * boxWidth - (boxWidth / 1.5) + boxWidth, y * boxWidth - (boxWidth / 2.5) + boxWidth,
        x * boxWidth - (boxWidth / 2) + boxWidth, y * boxWidth - (boxWidth / 1.77) + boxWidth
        ); //triangle bottom
        
        rect(x * boxWidth - (boxWidth / 2) + boxWidth, y * boxWidth - (boxWidth / 2.4) + boxWidth, boxWidth / 4, boxWidth / 4.2); //Stick
      }
    }
    else if (type == PieceType.king)
    {
      if (pieceColor == 1)
      {
        rect(x * boxWidth + (boxWidth / 2), y * boxWidth + (boxWidth / 1.5), boxWidth / 3, boxWidth / 8); //Base
        rect(x * boxWidth + (boxWidth / 2), y * boxWidth + (boxWidth / 2.5), boxWidth / 6, boxWidth / 3); //Stick
        
        rect(x * boxWidth + (boxWidth / 2), y * boxWidth + (boxWidth / 2.5), boxWidth / 3, boxWidth / 8); //Stick
      }
      else if (pieceColor == 0)
      {
        rect(x * boxWidth - (boxWidth / 2) + boxWidth, y * boxWidth - (boxWidth / 1.5) + boxWidth, boxWidth / 3, boxWidth / 8); //Base
        rect(x * boxWidth - (boxWidth / 2) + boxWidth, y * boxWidth - (boxWidth / 2.5) + boxWidth, boxWidth / 6, boxWidth / 3); //Stick
        
        rect(x * boxWidth - (boxWidth / 2) + boxWidth, y * boxWidth - (boxWidth / 2.5) + boxWidth, boxWidth / 3, boxWidth / 8); //Stick
      }
    }
  }
}
