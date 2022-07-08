public boolean checkIfValid(Tile currentTile, Tile lastTile)
{
  Piece currentPiece = currentTile.currentPiece; //Tile to move to
  Piece lastPiece = lastTile.currentPiece; //Tile to move from
  PieceType type = lastPiece.type;



  boolean returnTrue = true;

  int movementX = currentTile.x - lastTile.x;
  int movementY = currentTile.y - lastTile.y;
  if (currentPiece.pieceColor == lastPiece.pieceColor)
    return false;

  if (type == PieceType.pawn)
  {
    if (lastPiece.pieceColor == 1)
    {
      if (lastTile.y - currentTile.y != 1)
      {
        returnTrue = false;

        if (lastTile.y == 6 && lastTile.y - currentTile.y == 2 && getTile(lastTile.x, lastTile.y - 1).currentPiece.pieceColor == 2)
          returnTrue = true;
      }
    } else if (lastPiece.pieceColor == 0)
    {
      if (currentTile.y - lastTile.y != 1)
      {
        returnTrue = false;

        if (lastTile.y == 1 && currentTile.y - lastTile.y == 2 && getTile(lastTile.x, lastTile.y + 1).currentPiece.pieceColor == 2)
          returnTrue = true;
      }
    }

    if (currentPiece.type == null)
    {
      if (currentTile.x != lastTile.x)
        returnTrue = false;
    } else
    {
      if (abs(currentTile.x - lastTile.x) != 1)
      {
        returnTrue = false;
      }
    }
  } else if (type == PieceType.knight)
  {
    if ((movementX == -1 && movementY == -2)
      || (movementX == 1 && movementY == -2)
      || (movementX == -2 && movementY == -1)
      || (movementX == 2 && movementY == -1)
      || (movementX == -2 && movementY == 1)
      || (movementX == 2 && movementY == 1)
      || (movementX == -1 && movementY == 2)
      || (movementX == 1 && movementY == 2))
    {
      returnTrue = true;
    } else
    {
      returnTrue = false;
    }
  } else if (type == PieceType.bishop)
  {
    returnTrue = false;

    if (movementX == movementY || movementX == -movementY)
    {
      IntList allX = new IntList();
      IntList allY = new IntList();

      if (movementX < 0)
      {
        for (int i = currentTile.x + 1; i < lastTile.x; i++)
        {
          allX.append(i);
        }
      } else
      {
        for (int i = currentTile.x - 1; i > lastTile.x; i--)
        {
          allX.append(i);
        }
      }

      if (movementY < 0)
      {
        for (int i = currentTile.y + 1; i < lastTile.y; i++)
        {
          allY.append(i);
        }
      } else
      {
        for (int i = currentTile.y - 1; i > lastTile.y; i--)
        {
          allY.append(i);
        }
      }

      for (int i = 0; i < allX.size(); i++)
      {
        if (getTile(allX.get(i), allY.get(i)).currentPiece.pieceColor != 2)
          return false;
      }

      returnTrue = true;
    }
  } else if (type == PieceType.rook)
  {
    returnTrue = false;

    if (currentTile.x == lastTile.x || currentTile.y == lastTile.y)
    {

      IntList allX = new IntList();
      IntList allY = new IntList();

      if (movementX < 0)
      {
        for (int i = currentTile.x + 1; i < lastTile.x; i++)
        {
          allX.append(i);
        }
      } else
      {
        for (int i = currentTile.x - 1; i > lastTile.x; i--)
        {
          allX.append(i);
        }
      }

      if (movementY < 0)
      {
        for (int i = currentTile.y + 1; i < lastTile.y; i++)
        {
          allY.append(i);
        }
      } else
      {
        for (int i = currentTile.y - 1; i > lastTile.y; i--)
        {
          allY.append(i);
        }
      }

      //print(allX.size() + " " + allY.size());

      for (int i = 0; i < allX.size(); i++)
      {
        if (getTile(allX.get(i), currentTile.y).currentPiece.pieceColor != 2)
          return false;
      }
      for (int i = 0; i < allY.size(); i++)
      {
        if (getTile(currentTile.x, allY.get(i)).currentPiece.pieceColor != 2)
          return false;
      }

      returnTrue = true;
    }
  } else if (type == PieceType.queen)
  {
    returnTrue = false;
    if (movementX == movementY || movementX == -movementY)
    {
      returnTrue = false;

      IntList allX = new IntList();
      IntList allY = new IntList();

      if (movementX < 0)
      {
        for (int i = currentTile.x + 1; i < lastTile.x; i++)
        {
          allX.append(i);
        }
      } else
      {
        for (int i = currentTile.x - 1; i > lastTile.x; i--)
        {
          allX.append(i);
        }
      }

      if (movementY < 0)
      {
        for (int i = currentTile.y + 1; i < lastTile.y; i++)
        {
          allY.append(i);
        }
      } else
      {
        for (int i = currentTile.y - 1; i > lastTile.y; i--)
        {
          allY.append(i);
        }
      }

      for (int i = 0; i < allX.size(); i++)
      {
        if (getTile(allX.get(i), allY.get(i)).currentPiece.pieceColor != 2)
          return false;
      }

      returnTrue = true;
    } else if (currentTile.x == lastTile.x || currentTile.y == lastTile.y)
    {
      IntList allX = new IntList();
      IntList allY = new IntList();

      if (movementX < 0)
      {
        for (int i = currentTile.x + 1; i < lastTile.x; i++)
        {
          allX.append(i);
        }
      } else
      {
        for (int i = currentTile.x - 1; i > lastTile.x; i--)
        {
          allX.append(i);
        }
      }

      if (movementY < 0)
      {
        for (int i = currentTile.y + 1; i < lastTile.y; i++)
        {
          allY.append(i);
        }
      } else
      {
        for (int i = currentTile.y - 1; i > lastTile.y; i--)
        {
          allY.append(i);
        }
      }


      for (int i = 0; i < allX.size(); i++)
      {
        if (getTile(allX.get(i), currentTile.y).currentPiece.pieceColor != 2)
        {
          return false;
        }
      }
      for (int i = 0; i < allY.size(); i++)
      {
        if (getTile(currentTile.x, allY.get(i)).currentPiece.pieceColor != 2)
        {
          return false;
        }
      }

      returnTrue = true;
    }
  } else if (type == PieceType.king)
  {
    returnTrue = false;
    if ((movementX <= 1 && movementX >= -1 ) && (movementY <= 1 && movementY >= -1))
      returnTrue = true;
  }
  return returnTrue;
}

boolean checkForCheck(Tile currentTile, Tile lastTile, int pieceColor, Tile inCheckTile, Tile notCheckTile)
{
  Tile tempCurrentTile = getTileClone(currentTile);
  Tile tempLastTile = getTileClone(lastTile);

  currentTile.currentPiece.type = lastTile.currentPiece.type;
  currentTile.currentPiece.pieceColor = lastTile.currentPiece.pieceColor;

  lastTile.setPiece(null);
  lastTile.currentPiece.pieceColor = 2;


  for (int i = 0; i < 8; i++)
  {
    for (int j = 0; j < 8; j++)
    {
      Tile checkTile = getTileClone(i, j);

      if (checkIfValid(currentTile, checkTile) && checkTile.currentPiece.pieceColor != lastTile.currentPiece.pieceColor)
      {
        lastTile.currentPiece.type = tempCurrentTile.currentPiece.type;
        lastTile.currentPiece.pieceColor = tempCurrentTile.currentPiece.pieceColor;

        lastTile.setPiece(tempLastTile.currentPiece.type);
        lastTile.currentPiece.pieceColor = tempLastTile.currentPiece.pieceColor;

        inCheckTile.x = checkTile.x;
        inCheckTile.y = checkTile.y;
        inCheckTile.currentPiece.type = checkTile.currentPiece.type;
        inCheckTile.currentPiece.pieceColor = checkTile.currentPiece.pieceColor;
        
        notCheckTile.x = currentTile.x;
        notCheckTile.y = currentTile.y;
        notCheckTile.currentPiece.type = currentTile.currentPiece.type;
        notCheckTile.currentPiece.pieceColor = currentTile.currentPiece.pieceColor;
  
        return true;
      }
    }
  }

  currentTile.currentPiece.type = tempCurrentTile.currentPiece.type;
  currentTile.currentPiece.pieceColor = tempCurrentTile.currentPiece.pieceColor;

  lastTile.currentPiece.type = tempLastTile.currentPiece.type;
  lastTile.currentPiece.pieceColor = tempLastTile.currentPiece.pieceColor;

  return false;
}

/*boolean checkForCheck(int pieceColor)
 {
 Tile kingTile = new Tile();
 
 for (int i = 0; i < 8; i++)
 {
 for (int j = 0; j < 8; j++)
 {
 if (getTileClone(i, j).currentPiece.type == PieceType.king && getTileClone(i, j).currentPiece.pieceColor == pieceColor)
 {
 kingTile = getTileClone(i, j);
 }
 }
 }
 
 for (int i = 0; i < 8; i++)
 {
 for (int j = 0; j < 8; j++)
 {
 Tile lastTile = getTileClone(i, j);
 //kingTile.currentPiece = lastTile.currentPiece;
 
 //println(kingTile.x + " " + lastTile.currentPiece.x);
 
 if (checkIfValid(kingTile, lastTile) && lastTile.currentPiece.pieceColor != pieceColor && lastTile.currentPiece.pieceColor != 2)
 {
 return true;
 }
 }
 }
 
 return false;
 }*/
