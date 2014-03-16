// | Area Store |
HashMap<String, region> Area = new HashMap();


// load a specific area
void area_Load(String id, int[] x1, int[] y1, int[] x2, int[] y2)
{
  region area = new region(x1, y1, x2, y2);
  Area.put(id, area);
}

// load areas in an xml
void area_Load(XML xml)
{
  // get all area tags
  XML[] areaXml = xml.getChildren("area");
  // load all area mentioned
  for(int i=0; i<areaXml.length; i++)
  {
    String id = areaXml[i].getString("id");
    XML[] rectXml = areaXml[i].getChildren("rect");
    int[] x1 = new int[rectXml.length];
    int[] y1 = new int[rectXml.length];
    int[] x2 = new int[rectXml.length];
    int[] y2 = new int[rectXml.length];
    for(int j=0; j<rectXml.length; j++)
    {
      x1[j] = rectXml[j].getInt("x1");
      y1[j] = rectXml[j].getInt("y1");
      x2[j] = rectXml[j].getInt("x2");
      y2[j] = rectXml[j].getInt("y2");
    }
    area_Load(id, x1, y1, x2, y2);
  }
}


// free a specific area
void area_Free(String id)
{
  Area.remove(id);
}

// free areas in an xml
void area_Free(XML xml)
{
  // get all area tags
  XML[] areaXml = xml.getChildren("area");
  // free all areas mentioned
  for(int i=0; i<areaXml.length; i++)
  {
    String id = areaXml[i].getString("id");
    area_Free(id);
  }
}


// clears all areas
void area_Clear()
{
  Area.clear();
}


// return an area
region area(String id)
{
  return Area.get(id);
}

// check if a point is inside area
boolean area(String id, int x, int y)
{
  return Area.get(id).Inside(x, y);
}


class region
{
  int[] X1, Y1, X2, Y2;
  
  region(int[] x1, int[] y1, int[] x2, int[] y2)
  {
    X1 = x1;
    Y1 = y1;
    X2 = x2;
    Y2 = y2;
  }
  
  boolean Inside(int x, int y)
  {
    for(int i=0; i<X1.length; i++)
      if(x>=X1[i] && x<=X2[i] && y>=Y1[i] && y<=Y2[i])
        return true;
    return false;
  }
  
  boolean Outside(int x, int y)
  {
    return !Inside(x, y);
  }
}

