int boardWidth = 8;
int boardHeight = 8;
float animationSpeed = 0.5; //constant that determines the speed of animations. adjust here later
PImage IMGpurpleGem;
PImage IMGgreenGem;
PImage IMGorangeGem;
PImage IMGyellowGem;
PImage IMGpinkGem;
PImage IMGblackGem;
PImage IMGgreyGem;
PImage[] gemImages;
PImage selectedCellIndicator1;
int[][] board;
PVector selectedCell1;
PVector selectedCell2;
boolean isCellSelected;
int score;

void setup(){
  frameRate(30);
  size(600,600);

  
  IMGpurpleGem = loadImage("gem1.png"); //loading gem images into the program
  IMGgreenGem = loadImage("gem2.png");
  IMGorangeGem = loadImage("gem3.png");
  IMGyellowGem = loadImage("gem4.png");
  IMGpinkGem = loadImage("gem5.png");
  IMGblackGem = loadImage("gem6.png");
  IMGgreyGem = loadImage("gem7.png");
  gemImages = new PImage[7];
  gemImages[0] = IMGpurpleGem;
  gemImages[1] = IMGgreenGem;
  gemImages[2] = IMGorangeGem;
  gemImages[3] = IMGyellowGem;
  gemImages[4] = IMGpinkGem;
  gemImages[5] = IMGblackGem;
  gemImages[6] = IMGgreyGem;
  
  selectedCellIndicator1 = loadImage("selected.png");
  
  selectedCell1 = new PVector(0,0);
  selectedCell2 = new PVector();
  isCellSelected = false;
  
  board = new int[boardWidth][boardHeight];
  
  resetBoard();
  
  score = 0;
}

void draw(){
  background(170,221,247);
  translate(44,44);
  
  displayBoard();
  
  if(!isCellSelected)
  {
    selectedCell1.x = mousePos().x;
    selectedCell1.y = mousePos().y;
  }
  else
  {
    noStroke();
    fill(color(252,76,91,100));
    rect(selectedCell1.x*64,selectedCell1.y*64,64,64);
    selectedCell2 = mousePos();
  }
  
  displaySelectedCellIndicators();
  
  text(str(mouseX)+':'+str(mouseY),5,-30);
  text(str(selectedCell1.x)+':' + str(selectedCell1.y),5,-15);
  text(str(selectedCell2.x)+':' + str(selectedCell2.y),70,-15);
  text(str(isCellSelected),5,0);
}

void resetBoard()
{
  board = generateRandomBoard();
}

void displayBoard()
{
  for(int ty=0;ty<boardHeight;ty++)
  {
    for(int tx=0;tx<boardWidth;tx++)
    {
      image(gemImages[board[tx][ty]],tx*64,ty*64); 
    }
  }
}

void displaySelectedCellIndicators()
{
  if(!isCellSelected)
  {
    image(selectedCellIndicator1,(selectedCell1.x*64),(selectedCell1.y*64));
  }
  else
  {
    image(selectedCellIndicator1,(selectedCell2.x*64),(selectedCell2.y*64));
  }
}

PVector mousePos()
{
  int x = mouseX-44;
  int y = mouseY-44;
  x=x/64;
  y=y/64;
  //constrain(x,0,7);         ISSUE: can select tiles off the board
  //constrain(y,0,7);
  return new PVector(x,y);
}

void mousePressed()
{
  if(!isCellSelected)
  {
    isCellSelected = true;
  }
  else
  {
    swapTiles(selectedCell1, selectedCell2);
    print(str(areTilesAdjacent(selectedCell1,selectedCell2)));
    isCellSelected = false;
  }
}






/*void keyPressed()          //Keyboard input - currently broken
{
  if(isCellSelected)
  {
    if(keyCode==UP && selectedCell1.y>0)
    {
      print("Up");
      selectedCell1.y--;
    }
    if(keyCode==DOWN && selectedCell1.y<7)
    {
      print("down");
      selectedCell1.y++;
    }
    if(keyCode==LEFT && selectedCell1.x>0)
    {
      selectedCell1.x--;
    }
    if(keyCode==RIGHT && selectedCell1.x<7)
    {
      selectedCell1.x++;
    }
  }
}*/
