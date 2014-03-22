// | Image Store |
HashMap<String, PImage> Img = new HashMap();


// add an image
PImage img_Add(String id, PImage img)
{
  if(!empty(id)) Img.put(id, img);
  return img;
}

// load an image
PImage img_Load(String id, String file)
{
  PImage img = loadImage(file);
  return img_Add(id, img);
}

// load image from xml
PImage img_Load(XML xml)
{ 
  String id = xml.getString("id");
  String ref = xml.getString("ref");
  String file = xml.getString("file");
  if(!empty(ref)) return img_Add(id, Img.get(ref));
  return img_Load(id, file);
}

// load images from xml
PImage[] img_LoadAll(XML[] xml)
{
  PImage[] img = new PImage[xml.length];
  for(int i=0; i<xml.length; i++)
    img[i] = img_Load(xml[i]);
  return img;
}

// load images from xml
PImage[] img_LoadAll(XML xml)
{
  return img_LoadAll(xml.getChildren("img"));
}


// remove an image
void img_Remove(String id)
{
  Img.remove(id);
}

// remove image in xml
void img_Remove(XML xml)
{
  String id = xml.getString("id");
  img_Remove(id);
}

// remove images in xml
void img_RemoveAll(XML[] xml)
{
  for(int i=0; i<xml.length; i++)
    img_Remove(xml[i]);
}

// remove images in xml
void img_RemoveAll(XML xml)
{
  img_RemoveAll(xml.getChildren("img"));
}

// clear all images
void img_Clear()
{
  Img.clear();
}


// get an image
PImage img(String id)
{
  return Img.get(id);
}

// draw an image
void img(String id, int x, int y)
{
  image(Img.get(id), x, y);
}

