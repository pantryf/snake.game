/*
 * SNAKE
 * -----
 * A game that involves a snake and its food.
 * 
 */
void setup()
{
  size(800, 600);
  rectMode(CENTER);
  imageMode(CENTER);
  action_Init();
}


void draw()
{
  background(0);
  action_Update();
}

