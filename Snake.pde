class Snake
{
  int Head;
  PImage HeadImg;
  PImage BodyImg;
  PImage TailImg;
  int Size, Block;
  float[] PosX, PosY, Angle;
  
  Snake(PImage headImg, PImage bodyImg, PImage tailImg, int size, int block, int maxSize)
  {
    Head = 0;
    Size = size;
    Block = block;
    HeadImg = headImg;
    BodyImg = bodyImg;
    TailImg = tailImg;
    PosX = new float[maxSize];
    PosY = new float[maxSize];
    Angle = new float[maxSize];
  }
  
  void X() { return PosX[Head]; }
  void Y() { return PosY[Head]; }
  void Angle() { return Angle[Head]; }
  
  void Init(float posX, float posY, float angle, float gapX, float gapY, float gapAngle)
  {
    Head = 0;
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
  
  void Move(float moveX, float moveY)
  {
    // move body back
    /*
    for(int i=Size-1; i>0; i--)
    {
      GapX[i-1] = GapX[i];
      GapY[i-1] = GapY[i];
      GapAngle[i-1] = GapAngle[i];
    }
    // update new gap
    float angle = atan2(moveY, moveX);
    GapAngle[0] = - (angle - Angle);
    GapX[0] = -moveX;
    GapY[0] = -moveY;
    Angle = angle;
    */
    X += moveX;
    Y += moveY;
  }
  
  void Draw()
  {
    for(int i=0, ptr=Head; i<Size; i++, ptr=(ptr+1)&PosX.length)
    {
      
    }
  }
}

