class Snake
{
  PImage HeadImg;
  PImage BodyImg;
  PImage TailImg;
  int Size, Block;
  int[] PosX, PosY;
  float[] Angle;
  
  public Snake(PImage headImg, PImage bodyImg, PImage tailImg, int size, int block, int maxSize)
  {
    Size = size;
    Block = block;
    HeadImg = headImg;
    BodyImg = bodyImg;
    TailImg = tailImg;
    PosX = new int[maxSize];
    PosY = new int[maxSize];
    Angle = new float[maxSize];
  }
  
  public float X() { return PosX[0]; }
  public float Y() { return PosY[0]; }
  public float Angle() { return Angle[0]; }
  
  public void Init(int posX, int posY, float angle, int gapX, int gapY, float gapAngle)
  {
    for(int i=0; i<Size; i++)
    {
      PosX[i] = posX;
      PosY[i] = posY;
      Angle[i] = angle;
      posX += gapX;
      posY += gapY;
      angle += gapAngle;
    }
  }
  
  private void drawBlock(PImage img, int ptr)
  {
    pushMatrix();
    translate(PosX[ptr], PosY[ptr]);
    rotate(Angle[ptr]);
    image(img, 0, 0);
    popMatrix();
  }
  
  public void Draw()
  {
    drawBlock(HeadImg, 0);
    for(int i=Block; i<Size; i+=Block)
      drawBlock(BodyImg, i);
    drawBlock(TailImg, PosX.length-1);
  }
  
  void Move(int moveX, int moveY, float angle, int speed)
  {
    
  }
}

