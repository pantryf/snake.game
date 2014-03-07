/*
 * SNAKE
 * -----
 * A game that involves a snake and its food.
 * 
 */

void setup()
{
  size(640, 480);
  frameRate(1);
  rectMode(CENTER);
  Init();
}

void draw()
{
  background(0);
  Update();
}


