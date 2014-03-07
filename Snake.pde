class Snake
{
  int Size;
  float X, Y, Angle;
  
  PImage HeadImg;
  PImage BodyImg;
  PImage TailImg;
  float[] GapX, GapY, GapAngle;
  
  Snake(PImage headImg, PImage bodyImg, PImage tailImg, int size, int maxSize)
  {
    Size = size;
    HeadImg = headImg;
    BodyImg = bodyImg;
    TailImg = tailImg;
    // maxSize = max possible size of snake
    GapX = new float[maxSize];
    GapY = new float[maxSize];
    GapAngle = new float[maxSize];
  }
  
  void Init(float x, float y, float angle, float gapX, float gapY, float gapAngle)
  {
    X = x;
    Y = y;
    Angle = angle;
    // relative translate and rotate
    for(int i=0; i<Size; i++)
    {
      GapX[i] = gapX;
      GapY[i] = gapY;
      GapAngle[i] = gapAngle;
    }
  }
  
  void Move(float moveX, float moveY)
  {
    // move body back
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
    X += moveX;
    Y += moveY;
    println("X = " + X + ", Y = " + Y + ", Angle = " + Angle);
  }
  
  void Draw()
  {
    PImage img;
    pushMatrix();
    translate(X, Y);
    rotate(Angle);
    for(int i=Size-1; i>=0; i--)
    {
      if(i == 0) img = HeadImg;
      else if(i == Size-1) img = TailImg;
      else img = BodyImg;
      image(img, 0, 0);
      translate(GapX[i], GapY[i]);
      rotate(GapAngle[i]);
    }
    popMatrix();
  }
}

