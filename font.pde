// | Font Store |
HashMap<String, PFont> Font = new HashMap();


// add a font
PFont font_Add(String id, PFont font)
{
  if(!empty(id)) Font.put(id, font);
  return font;
}

// load a font
PFont font_Load(String id, String file)
{
  PFont font = loadFont(file);
  return font_Add(id, font);
}

// load font from xml
PFont font_Load(XML xml)
{ 
  String id = xml.getString("id");
  String ref = xml.getString("ref");
  String file = xml.getString("file");
  if(!empty(ref)) return font_Add(id, Font.get(ref));
  return font_Load(id, file);
}

// load fonts from xml
PFont[] font_LoadAll(XML[] xml)
{
  PFont[] font = new PFont[xml.length];
  for(int i=0; i<xml.length; i++)
    font[i] = font_Load(xml[i]);
  return font;
}

// load fonts from xml
PFont[] font_LoadAll(XML xml)
{
  return font_LoadAll(xml.getChildren("font"));
}


// remove a font
void font_Remove(String id)
{
  Font.remove(id);
}

// remove font in xml
void font_Remove(XML xml)
{
  String id = xml.getString("id");
  font_Remove(id);
}

// remove fonts in xml
void font_RemoveAll(XML[] xml)
{
  for(int i=0; i<xml.length; i++)
    font_Remove(xml[i]);
}

// remove fonts in xml
void font_RemoveAll(XML xml)
{
  font_RemoveAll(xml.getChildren("font"));
}

// clear all fonts
void font_Clear()
{
  Font.clear();
}


// get a font
PFont font(String id)
{
  return Font.get(id);
}

// select a font
void font(String id, int sz)
{
  textFont(Font.get(id), sz);
}

