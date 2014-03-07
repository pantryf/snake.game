Snake Viper;

void Init()
{
  PImage headImg = loadImage("head.jpg");
  PImage bodyImg = loadImage("body.jpg");
  PImage tailImg = loadImage("tail.jpg");
  Viper = new Snake(headImg, bodyImg, tailImg, 100, 10, 100);
  Viper.Init(300, 100, 0, 1, 0, 0);
  log_Write(Viper.PosX);
}

void Update()
{
  float xMove = mouseX - 320;
  float yMove = mouseY - 240;
  float dist = -10;
  float angle = atan2(yMove, xMove);
  rect(320, 240, 10, 10);
  Viper.Draw();
}

