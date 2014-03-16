// | Animation Store |
HashMap<String, animation> Anim = new HashMap();


// load a specific animation
void anim_Load(String id, PImage[] img, int[] wait, boolean loop)
{
  animation anim = new animation(img, wait, loop);
  Anim.put(id, anim);
}

// loads animations in an xml
void anim_Load(XML xml)
{
  // get all anim tags
  XML[] animXml = xml.getChildren("anim");
  // load all anims mentioned
  for(int i=0; i<animXml.length; i++)
  {
    String id = animXml[i].getString("id");
    boolean loop = Boolean.parseBoolean(animXml[i].getString("loop"));
    XML[] imgXml = animXml[i].getChildren("img");
    PImage[] img = new PImage[imgXml.length];
    int[] wait = new int[imgXml.length];
    for(int j=0; j<imgXml.length; j++)
    {
      String imId = imgXml[j].getString("id");
      String file = imgXml[j].getString("file");
      wait[j] = imgXml[j].getInt("wait");
      if(str_Empty(file)) img[j] = Img.get(imId);
      else
      {
        img[j] = loadImage(file);
        if(!str_Empty(imId)) img_Load(imId, img[j]);
      }
    }
    anim_Load(id, img, wait, loop);
  }
}


// free a specific animation
void anim_Free(String id)
{
  Anim.remove(id);
}

// free animations in an xml
void anim_Free(XML xml)
{
  // get all img tags
  XML[] animXml = xml.getChildren("anim");
  // free all anims mentioned
  for(int i=0; i<animXml.length; i++)
  {
    String id = animXml[i].getString("id");
    anim_Free(id);
  }
}


// clears all animations
void anim_Clear()
{
  Anim.clear();
}


// return an animation
animation anim(String id)
{
  return Anim.get(id);
}

// draw an animation
void anim(String id, int x, int y)
{
  Anim.get(id).Draw(x, y);
}


// animation class
class animation
{
  int[] Wait;
  PImage[] Img;
  boolean Loop;
  int Ptr, WaitNow;
  int Rate;
  
  animation(PImage[] img, int[] wait, boolean loop)
  {
    Img = img;
    Wait = wait;
    Loop = loop;
    WaitNow = 0;
    Ptr = -1;
    Rate = 1;
  }
  
  void Draw(int x, int y)
  {
    while(WaitNow <= 0)
    {
      Ptr = (Ptr + 1) % Img.length;
      WaitNow += Wait[Ptr];
    }
    image(Img[Ptr], x, y);
    WaitNow -= Rate;
  }
}

