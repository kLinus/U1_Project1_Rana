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
      projX+=3;
    }
    if(projX>x)
    {
      projX-=3;
    }
    if(projY<y)
    {
      projY+=3;
    }
    if(projY>y)
    {
      projY-=3;
    }
  }
}