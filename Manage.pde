Snake Viper;

void Init()
{
  PImage headImg = loadImage("head.jpg");
  PImage bodyImg = loadImage("body.jpg");
  PImage tailImg = loadImage("tail.jpg");
  Viper = new Snake(headImg, bodyImg, tailImg, 100, 10, 100);
  Viper.Init(300, 100, 0, 1, 0, 0);
  // log_Write(Viper.PosX);
}

void Update()
{
  float xMove = mouseX - Viper.X();
  float yMove = mouseY - Viper.Y();
  float angle = atan2(yMove, xMove);
  xMove = xMove / 50;
  yMove = yMove / 50;
  if(mousePressed) Viper.Move(xMove, yMove, angle);
  Viper.Draw();
}

