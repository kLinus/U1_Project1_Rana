void Attack1()
{
  killAll();

  for (int i=0; i<100; i++)
  {
    normalProjectiles.add(new ProjectileNormal(random(width), 0, 0, 3));
  }
}
void Attack2()
{
  killAll();

  for (int i=0; i<5; i++)
  {
    homingProjectiles.add(new ProjectileHoming(random(width), 0, 0, 0));
    homingProjectiles.add(new ProjectileHoming(0, random(height), 0, 0));
    homingProjectiles.add(new ProjectileHoming(random(width), height, 0, 0));
    homingProjectiles.add(new ProjectileHoming(width, random(height), 0, 0));
  }
}