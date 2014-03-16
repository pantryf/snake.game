/*
 * SNAKE
 * -----
 * A game that involves a snake and its food.
 * 
 */
 // 2hrs coding tear begins at 16.3.2014, 5:00 PM
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

