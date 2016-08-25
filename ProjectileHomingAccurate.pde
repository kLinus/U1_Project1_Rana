class ProjectileHomingAccurate extends Projectile
{
  PVector v1;

  ProjectileHomingAccurate(float projX, float projY, float velX, float velY)
  {
    super(projX, projY, velX, velY);
    v1=new PVector(0, 0);
  }
  void move()
  {
    v1.x=projX-x;
    v1.y=projY-y;
    v1.normalize();
    projX-=multiplier*(5*v1.x);
    projY-=multiplier*(5*v1.y);
    //line(projX,projY,x,y);
  }
}