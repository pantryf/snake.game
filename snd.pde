// | Sound Store |
import ddf.minim.*;

Minim minim = new Minim(this);
HashMap<String, AudioPlayer> Snd = new HashMap();


// load a specific sound
void snd_Load(String id, String file)
{
  AudioPlayer snd = minim.loadFile(file);
  Snd.put(id, snd);
}

// loads sounds in an xml
void snd_Load(XML xml)
{
  // get all snd tags
  XML[] sndXml = xml.getChildren("snd");
  // load all sounds mentioned
  for(int i=0; i<sndXml.length; i++)
  {
    String id = sndXml[i].getString("id");
    String file = sndXml[i].getString("file");
    snd_Load(id, file);
  }
}


// free a specific sound
void snd_Free(String id)
{
  Snd.remove(id);
}

// free sounds in an xml
void snd_Free(XML xml)
{
  // get all snd tags
  XML[] sndXml = xml.getChildren("snd");
  // free all sounds mentioned
  for(int i=0; i<sndXml.length; i++)
  {
    String id = sndXml[i].getString("id");
    snd_Free(id);
  }
}


// clears all sounds
void snd_Clear()
{
  Snd.clear();
}


// return a sound
AudioPlayer snd(String id)
{
  return Snd.get(id);
}

// play a sound
void snd(String id, boolean loop)
{
  if(loop) Snd.get(id).loop();
  Snd.get(id).play();
}

