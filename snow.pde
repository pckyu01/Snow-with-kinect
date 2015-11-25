class Snow
{
  PVector pos;
  PVector vel;
  PVector acc;
  float rad;
  boolean isAlive;
  
  
  Snow(float x, float y, float r)
  {
    pos = new PVector(x, y);
    vel = new PVector(0,0);
    acc = new PVector(random(-0.01,0.01), 0.01);
    rad = r;
    isAlive = true;
  }
  
  void Draw()
  {
    fill(255);
    ellipse(pos.x, pos.y, rad, rad);
  }
  
  void Move()
  {
    if (isAlive)
    {
      {
        vel.x += acc.x;
        vel.y += acc.y;
      }
      pos.x += vel.x;
      pos.y += vel.y;
      if (pos.x <= 0 + rad/2)
      {
        pos.x += rad/9;
        vel.x *= -0.5;
        acc.x *= -0.6;
      }
      if (pos.x >= width - rad/2)
      {
        pos.x -= rad/9;
        vel.x *= -0.5;
        acc.x *= -0.6;
      }
      if (pos.y <= 0 + rad/2)
      {
        pos.y += rad/9;
        vel.y *= -0.9;
      }
      if (pos.y >= height - rad/2)
      {
        pos.y -= rad/9;
        //vel.y *= -0.9;
        isAlive = false;
      }
    }
  }
  
  void React()
  {
    float dis = dist(pos.x, pos.y, mouseX, mouseY);
    
    ellipse(mouseX,mouseY,50,50);
    
    if(dis < 25 + rad/2)
    {
      vel.x = 0;
      vel.y = 0;
      //pos.x -= (mouseX - pos.x);
      //pos.y -= (mouseY - pos.y);
    }
  }
  
}