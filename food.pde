class food
{
  String Anim;
  
  int Score;
  
  
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

