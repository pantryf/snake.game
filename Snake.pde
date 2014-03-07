class Snake
{
  PImage HeadImg;
  PImage BodyImg;
  PImage TailImg;
  int Size, Block;
  float[] PosX, PosY;
  float[] Angle;
  
  public Snake(PImage headImg, PImage bodyImg, PImage tailImg, int size, int block, int maxSize)
  {
    Size = size;
    Block = block;
    HeadImg = headImg;
    BodyImg = bodyImg;
    TailImg = tailImg;
    PosX = new float[maxSize];
    PosY = new float[maxSize];
    Angle = new float[maxSize];
  }
  
  public float X() { return PosX[0]; }
  public float Y() { return PosY[0]; }
  public float Angle() { return Angle[0]; }
  
  public void Init(float posX, float posY, float angle, float gapX, float gapY, float gapAngle)
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
    for(int i=Block; i<Size; i+=Block)
      drawBlock(BodyImg, i);
    drawBlock(TailImg, PosX.length-1);
    drawBlock(HeadImg, 0);
  }
  
  void Move(float moveX, float moveY, float angle)
  {
    arrayCopy(PosX, 0, PosX, 1, PosX.length-1);
    arrayCopy(PosY, 0, PosY, 1, PosY.length-1);
    arrayCopy(Angle, 0, Angle, 1, Angle.length-1);
    PosX[0] = PosX[1] + moveX;
    PosY[0] = PosY[1] + moveY;
    Angle[0] = angle;
  }
}

