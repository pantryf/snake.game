Snake Viper;
float speed = 0;
float angle = 0;

void Init()
{
  PImage headImg = loadImage("head.jpg");
  PImage bodyImg = loadImage("body.jpg");
  PImage tailImg = loadImage("tail.jpg");
  Viper = new Snake(headImg, bodyImg, tailImg, 100, 10, 100);
  Viper.Init(300, 100, 0, -1, 0, 0);
  // log_Write(Viper.PosX);
}

void Update()
{
  if(keyPressed)
  {
    if(key == 'w') speed = constrain(speed + 0.1, 0, 5);
    if(key == 's') speed = constrain(speed - 0.1, 0, 5);
    if(key == 'a') angle -= 0.04;
    if(key == 'd') angle += 0.04;
  }
  if(speed > 0) Viper.Move(speed, angle);
  Viper.Draw();
}


