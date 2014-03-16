// | Image Store |
HashMap<String, PImage> Img = new HashMap();


// add a specific image
void img_Load(String id, PImage img)
{
  Img.put(id, img);
}

// load a specific image
void img_Load(String id, String file)
{
  PImage img = loadImage(file);
  Img.put(id, img);
}

// loads images in an xml
void img_Load(XML xml)
{
  // get all img tags
  XML[] imgXml = xml.getChildren("img");
  // load all images mentioned
  for(int i=0; i<imgXml.length; i++)
  {
    String id = imgXml[i].getString("id");
    String file = imgXml[i].getString("file");
    img_Load(id, file);
  }
}


// free a specific image
void img_Free(String id)
{
  Img.remove(id);
}

// free images in an xml
void img_Free(XML xml)
{
  // get all img tags
  XML[] imgXml = xml.getChildren("img");
  // free all images mentioned
  for(int i=0; i<imgXml.length; i++)
  {
    String id = imgXml[i].getString("id");
    img_Free(id);
  }
}


// clears all images
void img_Clear()
{
  Img.clear();
}


// return an image
PImage img(String id)
{
  return Img.get(id);
}

// draw an image
void img(String id, int x, int y)
{
  image(Img.get(id), x, y);
}

