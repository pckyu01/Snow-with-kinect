import kinect4WinSDK.*;

Kinect kinect;

PImage hand;
ArrayList<Snow> snow;

void setup()
{
  fullScreen();
  kinect = new Kinect(this);
  hand = kinect.GetDepth();
  snow = new ArrayList<Snow>();
}

void draw()
{
  background(0);
  image(kinect.GetDepth(), 0, 0);
  snow.add(new Snow(random(0,width), 0, 5));
  
  for (int i = 0; i < snow.size(); i ++)
  {
    snow.get(i).Draw();
    snow.get(i).Move();
    snow.get(i).React();
    if (i >= 500)
    {
      snow.remove(100);
    }
  }
  
}