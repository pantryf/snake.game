class food
{
  int X, Y;
  final int Score = 1;
  final int Weight = 16;
  
  
  public food(int x, int y)
  {
    X = x;
    Y = y;
  }
  
  
  public void Draw()
  {
    stroke(128);
    strokeWeight(1);
    int frame = (frameCount & 0x7F) << 1;
    fill(abs(128 - frame));
    rect(X, Y, Weight, Weight);
  }
  
  
  public boolean Touch(int x, int y)
  { return (X == x) && (Y == y); }
}


class rat extends food
{
  final int Score = 2;
  public rat(int x, int y)
  {
    super(x, y);
  }
}

