import ddf.minim.*;
/*
Rana Lulla's Project
 I don't really have a formal name as of yet, but it's basically a joystick
 controlled game where you dodge bullets and waves of projectiles.
 */
PVector v1;
float x, y;
int screenState, timer, attackPattern, score;
boolean died;
Minim minim;
AudioPlayer music;

ArrayList<ProjectileNormal> normalProjectiles = new ArrayList<ProjectileNormal>();
ArrayList<ProjectileHoming> homingProjectiles = new ArrayList<ProjectileHoming>();
ArrayList<ProjectileHomingAccurate> accurateHomingProjectiles = new ArrayList<ProjectileHomingAccurate>();


void setup()
{
  minim = new Minim(this);

  music = minim.loadFile("Megalovania.mp3");
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
  switch(screenState)
  {
  case 0:
    startScreen();
    break;
  case 1:
    music.play();

    gameCode();
    movementCode();
    if (died)
    {
      music.close();
      screenState=2;
      music = minim.loadFile("Megalovania.mp3");
    }
    break;
  case 2:
    background(0);
    killAll();
    textSize(50);
    text("You died!", width/2, height/3);
    textSize(30);
    text("Click to play again!", width/2, 2*(height/3));
    text(score, width/2, height/2);
    if (mousePressed)
    {
      x=width/2;
      y=2*(height/3);
      score=0;
      screenState=1;
      died=false;
      timer=0;
    }
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
    x=width/2;
    y=3*(height/4);
    attackPattern=int(random(1, 4));
    timer=millis()+5000;
    switch(attackPattern)
    {
    case 1: 
      Attack1();
      break;
    case 2:
      Attack2();
      break;
    case 3:
      Attack3();
      break;
    }
  }
  switch(attackPattern)
  {
  case 1:
    attack1Update();
    break;
  case 2:
    attack2Update();
    break;
  case 3:
    attack3Update();
    break;
  }
  movementCode();
  score++;
  textSize(10);
  text(score, 10, 10);
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
      died=true;
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
      died=true;
    }
  }
}
void attack3Update()
{
  for (int i=0; i<accurateHomingProjectiles.size(); i++)
  {
    ProjectileHomingAccurate part = accurateHomingProjectiles.get(i);
    part.move();
    part.collision();
    if (part.collide)
    {
      died=true;
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
  if (x<0||y<0||x>width||y>height)
  {
    died=true;
  }
}
void killAll()
{
  normalProjectiles.clear();
  homingProjectiles.clear();
  accurateHomingProjectiles.clear();
}