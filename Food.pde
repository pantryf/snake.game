class Food
{
  int X, Y;
  color Clr;
  int Weight;
  
  
  public Food(color clr, int x, int y, int weight)
  {
    X = x;
    Y = y;
    Clr = clr;
    Weight = weight;
  }
  
  
  public void Draw()
  {
    noStroke();
    fill(Clr);
    ellipse(X, Y, Weight, Weight);
  }
  
  
  public int Dist(int x, int y)
  { return abs(x - X) + abs(y - Y); }
}

