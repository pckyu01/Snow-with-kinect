import org.openkinect.processing.*;

Kinect kinect;


ArrayList<Snow> snow;

void setup()
{
  size(1000,500);
  background(0);
  snow = new ArrayList<Snow>();
}

void draw()
{
  background(0);
  
  snow.add(new Snow(random(0,1000), 0, 5));
  
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