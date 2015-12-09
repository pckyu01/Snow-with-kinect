class Snow
{
  PVector pos;
  PVector vel;
  PVector acc;
  float rad;
  boolean isAlive;
  PImage snowflake;
  
  
  Snow(float x, float y, float r)
  {
    pos = new PVector(x, y);
    vel = new PVector(0,0);
    acc = new PVector(random(-0.01,0.01), 0.05);
    rad = r;
    isAlive = true;
    snowflake = loadImage("snowflake.png");
    snowflake.resize(50,40);
  }
  
  void Draw()
  {
    image(snowflake, pos.x, pos.y);
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
        pos.x += rad;
        vel.x *= -0.5;
        acc.x *= -0.6;
      }
      if (pos.x >= width - rad/2)
      {
        pos.x -= rad;
        vel.x *= -0.5;
        acc.x *= -0.6;
      }
      if (pos.y <= 0 + rad/2)
      {
        pos.y += rad/9;
        vel.y *= -0.9;
      }
      if (pos.y >= height - rad/2 - 50)
      {
        pos.y -= rad/9;
        //vel.y *= -0.9;
        isAlive = false;
      }
    }
  }
  
  void React()
  {
    pos.y -= 20;
  }
}