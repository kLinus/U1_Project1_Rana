class ProjectileHoming extends Projectile
{
  ProjectileHoming(float projX, float projY, float velX, float velY)
  {
    super(projX, projY, velX, velY);
  }
  void move()
  {
    if(projX<x)
    {
      projX+=multiplier*3;
    }
    if(projX>x)
    {
      projX-=multiplier*3;
    }
    if(projY<y)
    {
      projY+=multiplier*3;
    }
    if(projY>y)
    {
      projY-=multiplier*3;
    }
  }
}