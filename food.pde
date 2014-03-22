class food
{
  String Type;
  region Size;
  int Score;
  
  public food(String type, region Size)
  {
    // X = x;
    // Y = y;
  }
  
  
  public void Draw()
  {
    stroke(128);
    strokeWeight(1);
    int frame = (frameCount & 0x7F) << 1;
    fill(abs(128 - frame));
    // rect(X, Y, Weight, Weight);
  }
  
  
  public boolean Touch(int x, int y)
  { return (X == x) && (Y == y); }
}

