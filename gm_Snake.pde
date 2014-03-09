/*
 * SNAKE
 * -----
 * A game that involves a snake and its food.
 * 
 */
PImage abc;
void setup()
{
  size(800, 600);
  rectMode(CENTER);
  imageMode(CENTER);
  action_Init();
  abc = loadImage("snake_bg_edges.jpg");
}


void draw()
{
  // background(0);
  image(abc, 400, 300);
  action_Update();
}

