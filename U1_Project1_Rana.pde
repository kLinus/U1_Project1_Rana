/*
Rana Lulla's Project
I don't really have a formal name as of yet, but it's basically a joystick
controlled game where you dodge bullets and waves of projectiles.
*/
PVector v1;
float x, y;
int screenState, timer, attackPattern;

ArrayList<ProjectileNormal> normalProjectiles = new ArrayList<ProjectileNormal>();
ArrayList<ProjectileHoming> homingProjectiles = new ArrayList<ProjectileHoming>();

void setup()
{
  v1=new PVector(0, 0);
  imageMode(CENTER);
  fullScreen(P2D);
  x=width/2;
  y=3*(height/4);
  textAlign(CENTER);
  noCursor();
}
void draw()
{
  if(mousePressed)
  {
    //killAll();
  }
  switch(screenState)
  {
  case 0:
    startScreen();
    break;
  case 1:
    gameCode();
    movementCode();
    break;
  }
  fill(0, 0, 255);
  ellipse(mouseX, mouseY, 10, 10);
  fill(255);
}
void startScreen()
{
  background(0);
  textSize(200);
  text("Start", width/2, height/2);
  if (mousePressed)
  {
    screenState=1;
  }
}
void gameCode()
{
  background(255);
  if (millis()>timer)
  {
    attackPattern=int(random(1, 3));
    timer=millis()+15000;
    switch(attackPattern)
    {
    case 1: 
      Attack1();
      break;
    case 2:
      Attack2();
      break;
    }
  }
  //println(attackPattern);
  switch(attackPattern)
  {
  case 1:
    attack1Update();
    break;
  case 2:
    attack2Update();
    break;
  }
  movementCode();
}
void attack1Update()
{
  for (int i=0; i<normalProjectiles.size(); i++)
  {
    ProjectileNormal part = normalProjectiles.get(i);
    part.killBottom();
    part.move();
    part.collision();
    if (part.collide)
    {
      text("YOUDIED", width/2, height/2);
    }
    if (part.kill)
    {
      normalProjectiles.remove(i);
    }
  }
}
void attack2Update()
{
  for (int i=0; i<homingProjectiles.size(); i++)
  {
    ProjectileHoming part = homingProjectiles.get(i);
    part.move();
    part.collision();
    if (part.collide)
    {
      text("YOUDIED", width/2, height/2);
    }
  }
}
void movementCode()
{
  fill(0);
  v1.x=mouseX-(width/2);
  v1.y=mouseY-(3*(height/4));
  v1.normalize();
  line(width/2, 3*(height/4), mouseX, mouseY);
  ellipse(width/2, 3*(height/4), 20, 20);
  x+=3*(v1.x);
  y+=3*(v1.y);
  fill(0, 0, 255);
  ellipse(x, y, 10, 10);
  fill(0);
  if(x<0)
  {
    x=0;
  }
  if(y<0)
  {
    y=0;
  }
  if(x>width)
  {
    x=width;
  }
  if(y>height)
  {
    y=height;
  }
}
void killAll()
{
  while (0<normalProjectiles.size())
  {
    normalProjectiles.remove(0);
  }
  while (0<homingProjectiles.size())
  {
    homingProjectiles.remove(0);
  }
}