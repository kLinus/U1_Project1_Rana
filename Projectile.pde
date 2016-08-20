class Projectile
{
  float velX, velY, projX, projY, distance, size=10;
  boolean collide, kill;
  Projectile(float _x, float _y, float _velX, float _velY)
  {
    projX=_x;
    projY=_y;
    velX=_velX;
    velY=_velY;
  }
  void collision()
  {
    fill(255,0,0);
    distance=dist(projX, projY, x, y);
    if (distance<=5+size/2)
    {
      collide=true;
    }
    fill(0);
    ellipse(projX, projY, size, size);
  }
  void killBottom()
  {
    if (projY>height)
    {
      kill=true;
    }
  }
  void killTop()
  {
    if (projY<0)
    {
      kill=true;
    }
  }
  void killLeft()
  {
    if (projX<0)
    {
      kill=true;
    }
  }
  void killRight()
  {
    if (projX>width)
    {
      kill=true;
    }
  }
  void bounceBottom()
  {
    if (projY>height)
    {
      velY*=-1;
    }
  }
  void bounceTop()
  {
    if (projY<0)
    {
      velY*=-1;
    }
  }
  void bounceLeft()
  {
    if (projX<0)
    {
      velX*=-1;
    }
  }
  void bounceRight()
  {
    if (projX>width)
    {
      velX*=-1;
    }
  }
}