class Snake
{
  int[] NodeX, NodeY;
  int Head, Size, Block, Weight;
  color HeadClr, BodyClr; 
  final int MaxSize = 512;
  final int MaxIndx = MaxSize - 1;
  
  
  public Snake(color headClr, color bodyClr, int weight, int size, int block)
  {
    Head = 0;
    Size = size;
    Block = block;
    Weight = weight;
    HeadClr = headClr;
    BodyClr = bodyClr;
    NodeX = new int[MaxSize];
    NodeY = new int[MaxSize];
  }


  public int Tail() { return (Head+Size-1) & MaxIndx; }
  public int HeadX() { return NodeX[Head]; }
  public int HeadY() { return NodeY[Head]; }
  public int TailX() { return NodeX[Tail()]; }
  public int TailY() { return NodeX[Tail()]; }

  public void Init(int posX, int posY, int gapX, int gapY)
  {
    Head = 0;
    for(int i=0; i<Size; i++)
    {
      NodeX[i] = posX;
      NodeY[i] = posY;
      posX += gapX;
      posY += gapY;
    }
  }
  
  
  public void Draw()
  {
    // body
    int ptr = Head;
    noFill();
    stroke(BodyClr);
    strokeWeight(Weight);
    beginShape(LINES);
    for(int i=0; i<Size; i+=Block)
    {
      vertex(NodeX[ptr], NodeY[ptr]);
      ptr = (ptr+Block) & MaxIndx;
    }
    endShape();
    // head
    fill(HeadClr);
    ellipse(NodeX[Head], NodeY[Head], 2*Weight, 2*Weight);
  }
  

  void Move(int x, int y)
  {
    Head = (Head-1) & MaxIndx;
    NodeX[Head] = x;
    NodeY[Head] = y;
  }
  
  
  void Grow(int amt)
  {
    Size += amt;
  }
}

