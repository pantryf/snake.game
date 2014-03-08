Snake Viper;

void Init()
{
  Viper = new Snake(color(220), color(180), 10, 100, 5);
  Viper.Init(300, 100, -1, 0);
  Viper.Draw();
}

void Update()
{
  int moveX = mouseX - pmouseX;
  int moveY = mouseY - pmouseY;
  if(moveX != 0 || moveY != 0) Viper.Move(Viper.HeadX() + moveX, Viper.HeadY() + moveY);
  Viper.Draw();
  if(mousePressed) Viper.Grow(1);
}

/*
void log_Write(int[] arr)
{
  for(int i=0; i<arr.length; i++)
    print(arr[i] + "|");
  println();
}
*/
