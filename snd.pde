// | Sound Store |
import ddf.minim.*;

Minim minim = new Minim(this);
HashMap<String, AudioPlayer> Snd = new HashMap();


// add a sound
AudioPlayer snd_Add(String id, AudioPlayer snd)
{
  if(!empty(id)) Snd.put(id, snd);
  return snd;
}

// load a sound
AudioPlayer snd_Load(String id, String file)
{
  AudioPlayer snd = minim.loadFile(file);
  return snd_Add(id, snd);
}

// load sound from xml
AudioPlayer snd_Load(XML xml)
{
  String id = xml.getString("id");
  String ref = xml.getString("ref");
  String file = xml.getString("file");
  if(!empty(ref)) return snd_Add(id, Snd.get(ref));
  return snd_Load(id, file);
}

// load sounds from xml
AudioPlayer[] snd_LoadAll(XML[] xml)
{
  AudioPlayer[] snd = new AudioPlayer[xml.length];
  for(int i=0; i<xml.length; i++)
    snd[i] = snd_Load(xml[i]);
  return snd;
}

// load sounds from xml
AudioPlayer[] snd_LoadAll(XML xml)
{
  return snd_LoadAll(xml.getChildren("snd"));
}


// remove a sound
void snd_Remove(String id)
{
  Snd.remove(id);
}

// remove sound in xml
void snd_Remove(XML xml)
{
  String id = xml.getString("id");
  snd_Remove(id);
}

// remove sounds in xml
void snd_RemoveAll(XML[] xml)
{
  for(int i=0; i<xml.length; i++)
    snd_Remove(xml[i]);
}

// remove sounds in xml
void snd_RemoveAll(XML xml)
{
  snd_RemoveAll(xml.getChildren("snd"));
}

// clear all sounds
void snd_Clear()
{
  Snd.clear();
}


// get a sound
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

