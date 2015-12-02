import kinect4WinSDK.*;
import kinect4WinSDK.SkeletonData;

Kinect kinect;

PImage hand;
PImage winter;
ArrayList<Snow> snow;
ArrayList <SkeletonData> bodies;

void setup()
{
  fullScreen();
  kinect = new Kinect(this);
  
  snow = new ArrayList<Snow>();
}

void draw()
{
  winter = loadImage("winter.jpg");
  winter.resize(width,height);
  hand = kinect.GetDepth();
  hand.resize(width,height);
  background(winter);

  image(kinect.GetMask(), 0, 0, width, height);
  
  snow.add(new Snow(random(0,width), 0, 5));
  
  for (int i = 0; i < snow.size(); i ++)
  {
    
    if (red(hand.get((int)snow.get(i).pos.x + 25, (int)snow.get(i).pos.y + 20)) < 210)
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

void appearEvent(SkeletonData _s) 
{
  if (_s.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    bodies.add(_s);
  }
}

void disappearEvent(SkeletonData _s) 
{
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_s.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.remove(i);
      }
    }
  }
}

void moveEvent(SkeletonData _b, SkeletonData _a) 
{
  if (_a.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_b.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.get(i).copy(_a);
        break;
      }
    }
  }
}