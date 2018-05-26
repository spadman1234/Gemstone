
int[][] generateRandomBoard()
{
  int[][] generatedBoard = new int[8][8];
  for(int iy=0;iy<8;iy++)
  {
    for(int ix=0;ix<8;ix++)
    {
      generatedBoard[ix][iy] = int(random(7));
      print(generatedBoard[ix][iy]);
    }
  }
  return generatedBoard;                        //board may not be solvable and may already have matches on it. TODO: update board and drop tiles until there are no matches left
}
/*
boolean isBoardSolvable(int[][] boardToTest)
{
  
}



boolean isMoveValid(PVector tile1, PVector tile2)
{
  
}
*/
boolean areTilesAdjacent(PVector tile1, PVector tile2)
{
  //println(abs(tile1.x-tile2.x));
  //println(abs(tile1.y-tile2.y));
  if((abs(tile1.x-tile2.x)<=1 && abs(tile1.y-tile2.y)<=1) && !(int(abs(tile1.x-tile2.x)+abs(tile1.y-tile2.y))==2))
  {
    return true;
  }
  else
  {
    return false;
  }
}

void swapTiles(PVector tile1, PVector tile2)
{
  if(areTilesAdjacent(tile1,tile2))
  {
    int item1 = board[int(tile1.x)][int(tile1.y)];
    int item2 = board[int(tile2.x)][int(tile2.y)];
    board[int(tile1.x)][int(tile1.y)] = item2;
    board[int(tile2.x)][int(tile2.y)] = item1;
  }
}
/*

void updateBoard()
{
  
}

void dropTiles()
{
  
}

void checkForMatches()
{
  
}
*/
