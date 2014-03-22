// | Text Store |
HashMap<String, String> Txt = new HashMap();


// add a text
String txt_Add(String id, String txt)
{
  if(!empty(id)) Txt.put(id, txt);
  return txt;
}

// load text from xml
String txt_Load(XML xml)
{ 
  String id = xml.getString("id");
  String ref = xml.getString("ref");
  String val = xml.getString("val");
  if(!empty(ref)) return txt_Add(id, Txt.get(ref));
  return txt_Add(id, val);
}

// load texts from xml
String[] txt_LoadAll(XML[] xml)
{
  String[] txt = new String[xml.length];
  for(int i=0; i<xml.length; i++)
    txt[i] = txt_Load(xml[i]);
  return txt;
}

// load texts from xml
String[] txt_LoadAll(XML xml)
{
  return txt_LoadAll(xml.getChildren("txt"));
}


// remove a text
void txt_Remove(String id)
{
  Txt.remove(id);
}

// remove text in xml
void txt_Remove(XML xml)
{
  String id = xml.getString("id");
  txt_Remove(id);
}

// remove texts in xml
void txt_RemoveAll(XML[] xml)
{
  for(int i=0; i<xml.length; i++)
    txt_Remove(xml[i]);
}

// remove texts in xml
void txt_RemoveAll(XML xml)
{
  txt_RemoveAll(xml.getChildren("txt"));
}

// clear all texts
void txt_Clear()
{
  Txt.clear();
}


// get a text
String txt(String id)
{
  return Txt.get(id);
}

// draw a text
void txt(String id, int x, int y)
{
  text(Txt.get(id), x, y);
}

