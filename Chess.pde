public ArrayList<ArrayList<Tile>> tiles = new ArrayList<ArrayList<Tile>>();
public int boxWidth = 64 * 3;


int mouseXTile;
int mouseYTile;

Tile currentTile;

boolean mousePressedOnPiece;
Tile lastTile;

public enum PieceType
{
  pawn,
    knight,
    bishop,
    rook,
    queen,
    king,
}

void setup()
{
  size(1536, 1536);
  background(255/2);

  generateMap();
  renderBoard();

  generatePieces();

  currentTile = tiles.get(mouseXTile).get(mouseYTile);

  renderPieces();
}

void draw()
{
  mouseXTile = ensureRange((int)(mouseX / boxWidth), 0, 7);
  mouseYTile = ensureRange((int)(mouseY / boxWidth), 0, 7);

  currentTile = tiles.get(mouseXTile).get(mouseYTile);

  if (!mousePressed)
    colorCurrentMouseSquare();
}

void mousePressed()
{
  darkenOnMousePressed();

  if (currentTile.currentPiece.type != null)
  {
    mousePressedOnPiece = true;
  } else
  {
    mousePressedOnPiece = false;
  }

  lastTile = currentTile;
}

boolean turn = true;

int printIndex = 0;
void mouseReleased()
{
  Tile inCheckTile = new Tile();
  Tile notCheckTile = new Tile();
  
  if (mousePressedOnPiece && checkIfValid(currentTile, lastTile) && lastTile != currentTile)
  {
    if (checkForCheck(currentTile, lastTile, 1, inCheckTile, notCheckTile))
    {
      //println(printIndex + ": " + "W " + lastTile.currentPiece.type + " " + currentTile.x + ", " + currentTile.y);
      //println(printIndex + ":W: check: "+ inCheckTile.x + ", " + inCheckTile.y + "  notCheck: " + notCheckTile.x + ", " + notCheckTile.y);
      
      if (notCheckTile.currentPiece.type == PieceType.king)
      {
        println("white in check");
        return;
      }
    }

    if (checkForCheck(currentTile, lastTile, 0, inCheckTile, notCheckTile))
    {
      //println(printIndex + ": " + "B " + lastTile.currentPiece.type + " " + currentTile.x + ", " + currentTile.y);
      //println(printIndex + ":B: check: "+ inCheckTile.x + ", " + inCheckTile.y + "  notCheck: " + notCheckTile.x + ", " + notCheckTile.y);
      
      if (notCheckTile.currentPiece.type == PieceType.king)
      {
        println("black in check");
        return;
      }
    }
    
    printIndex++;

    if (turn)
    {
      if (lastTile.currentPiece.pieceColor == 1)
      {
        turn = false;
      } else if (lastTile.currentPiece.pieceColor == 0)
      {
        return;
      }
    } else
    {
      if (lastTile.currentPiece.pieceColor == 0)
      {
        turn = true;
      } else if (lastTile.currentPiece.pieceColor == 1)
      {
        return;
      }
    }
    //set tile
    
    

    currentTile.setPiece(lastTile.currentPiece.type);
    currentTile.currentPiece.pieceColor = lastTile.currentPiece.pieceColor;
    lastTile.setPiece(null);
    lastTile.currentPiece.pieceColor = 2;
  }
}

void pieceTaken(Tile taker, Tile taken)
{
}

void generateMap()
{
  boolean lastColor = true;

  for (int i = 0; i < 8; i++)
  {
    if (lastColor)
      lastColor = false;
    else
      lastColor = true;

    ArrayList<Tile> newListTiles = new ArrayList<Tile>();

    for (int j = 0; j < 8; j++)
    {
      if (lastColor)
      {
        lastColor = false;
      } else
      {
        lastColor = true;
      }

      Tile newTile = new Tile();

      newTile.tileCol = lastColor;
      newTile.x = i;
      newTile.y = j;

      newListTiles.add(newTile);
    }

    tiles.add(newListTiles);
  }
}



Tile getTile(int x, int y)
{
  return tiles.get(x).get(y);
}

Tile getTileClone(int x, int y)
{
  x = ensureRange(x, 0 , 7);
  y = ensureRange(y, 0 , 7);
  
  Tile clonedTile = new Tile();
  Piece clonedPiece = new Piece();

  clonedPiece.type = tiles.get(x).get(y).currentPiece.type;
  clonedPiece.pieceColor = tiles.get(x).get(y).currentPiece.pieceColor;

  clonedTile.x = tiles.get(x).get(y).x;
  clonedTile.y = tiles.get(x).get(y).y;
  clonedTile.tileCol = tiles.get(x).get(y).tileCol;
  clonedTile.col = tiles.get(x).get(y).col;
  clonedTile.currentPiece = clonedPiece;


  return clonedTile;
}

Tile getTileClone(Tile _tile)
{
  Tile clonedTile = new Tile();
  Piece clonedPiece = new Piece();

  clonedPiece.type = _tile.currentPiece.type;
  clonedPiece.pieceColor = _tile.currentPiece.pieceColor;

  clonedTile.x = _tile.x;
  clonedTile.y = _tile.y;
  clonedTile.tileCol = _tile.tileCol;
  clonedTile.col = _tile.col;
  clonedTile.currentPiece = clonedPiece;


  return clonedTile;
}

int ensureRange(int value, int min, int max)
{
  return Math.min(Math.max(value, min), max);
}
