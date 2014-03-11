boolean menu_Ready;
PImage menu_CobraImg;
PImage menu_RattlImg;

final String menu_CobraFile = "menu/cobra-256.png";
final String menu_RattlFile = "menu/rattlesnake-256.png"; 



void menu_Main()
{
  
}

void menu_Load()
{
  if(menu_Ready) return;
  menu_CobraImg = loadImage(menu_CobraFile);
  menu_RattlImg = loadImage(menu_RattlFile);
  menu_Ready = true; 
}

void menu_Free()
{
  if(!menu_Ready) return;
  menu_CobraImg = null;
  menu_RattlImg = null;
  menu_Ready = false;
}

