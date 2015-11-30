import kinect4WinSDK.*;
import kinect4WinSDK.SkeletonData;

Kinect kinect;

PImage hand;
ArrayList<Snow> snow;
ArrayList <SkeletonData> bodies;

void setup()
{
  fullScreen();
  kinect = new Kinect(this);
  
  snow = new ArrayList<Snow>();
  bodies = new ArrayList<SkeletonData>();
}

void draw()
{
  hand = kinect.GetDepth();
  hand.resize(width,height);
  background(0);

  image(kinect.GetMask(), 0, 0, width, height);
  
  snow.add(new Snow(random(0,width), 0, 5));
  
  for (int i = 0; i < snow.size(); i ++)
  {
    
    if (red(hand.get((int)snow.get(i).pos.x, (int)snow.get(i).pos.y)) < 210)
    {
      snow.get(i).Move();
    }
    else
    {
      snow.get(i).React();
    }
    
    snow.get(i).Draw();
    if (i >= 500)
    {
      snow.remove(100);
    }
  }  
}