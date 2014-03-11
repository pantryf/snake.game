class snake
{
  String Name;
  int Type, Score;
  boolean ShowName;
  int[] NodeX, NodeY;
  int Head, Size, Dir;
  color HeadClr, BodyClr;
  
  final int Weight = 10;
  final int MaxSize = 256;
  final int MaxIndx = MaxSize - 1;
  final color TongClr = color(255, 100, 150);
  final int[] StepX = {Weight, 0, -Weight, 0};
  final int[] StepY = {0, Weight, 0, -Weight};
  
  // draw snake tongue
  public snake(String name, int type, int size)
  {
    Dir = 0;
    Head = 0;
    Score = 0;
    Name = name;
    Size = size;
    ShowName = true;
    Type = type >> 24;
    HeadClr = type | 0xFF000000;
    BodyClr = (~type) | 0xFF000000;
    NodeX = new int[MaxSize];
    NodeY = new int[MaxSize];
  }
  
  public int Tail() { return (Head+Size-1) & MaxIndx; }
  public int HeadX() { return NodeX[Head]; }
  public int HeadY() { return NodeY[Head]; }
  public int TailX() { return NodeX[Tail()]; }
  public int TailY() { return NodeX[Tail()]; }
  
  public void Init(int posX, int posY, int dir)
  {
    Head = 0;
    dir ^= 2;
    for(int i=0; i<Size; i++)
    {
      NodeX[i] = posX;
      NodeY[i] = posY;
      posX = (posX + StepX[dir]) % width;
      posY = (posY + StepY[dir]) % height;
    }
  }
  
  public void Draw()
  {
    // body
    noStroke();
    fill(BodyClr);
    int ptr = (Head+1) & MaxIndx;
    for(int i=1; i<Size; i++)
    {
      ellipse(NodeX[ptr], NodeY[ptr], Weight, Weight);
      ptr = (ptr+1) & MaxIndx;
    }
    pushMatrix();
    // tongue
    stroke(TongClr);
    strokeWeight(1);
    // head
    fill(HeadClr);
    translate(HeadX(), HeadY());
    rotate(HALF_PI * Dir);
    ellipse(0, 0, 1.5*Weight, 1.5*Weight);
    fill(0);
    rect(0.3*Weight, +0.5*Weight, 2, 2);
    rect(0.3*Weight, -0.5*Weight, 2, 2);
    popMatrix();
  }
  
  public void Move(int dir)
  {
    Dir = ((Dir & 1) != (dir & 1))? dir : Dir;
    int newX = HeadX() + StepX[Dir];
    int newY = HeadY() + StepY[Dir];
    Head = (Head-1) & MaxIndx;
    NodeX[Head] = (newX + width) % width;
    NodeY[Head] = (newY + height) % height;
  }
  
  public void Grow(int amt)
  { Size = (int) constrain(Size + amt, 2, MaxSize); }
  
  public boolean HeadTouch(int x, int y)
  { return (HeadX() == x) && (HeadY() == y); }
  
  public int BodyTouch(int x, int y)
  {
    int ptr = (Head+1) & MaxIndx;
    for(int i=1; i<Size; i++)
    {
      if((NodeX[ptr] == x) && (NodeY[ptr] == y)) return i;
      ptr = (ptr+1) & MaxIndx;
    }
    return -1;
  }
}

