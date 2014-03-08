/*
 * SNAKE
 * -----
 * A game that involves a snake and its food.
 * 
 */
void setup()
{
  size(640, 480);
  rectMode(CENTER);
  imageMode(CENTER);
  Init();
}


void draw()
{
  background(0);
  Update();
}

