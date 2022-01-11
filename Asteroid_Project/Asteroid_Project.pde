//Darren Yang, 1-3, Oct 4th
//Asteroid project

Ship myShip;
boolean upkey, downkey, leftkey, rightkey, spacekey, tkey;
ArrayList <GameObject> myObjects;

int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

PImage [] gameovergif;
PImage [] gamegif;
PImage UFO;

int n1 = 8;
int f1 = 0;
int n = 3;
int f = 0;
int thick;
int UFOtimer = 0;
int score = 0;
int tpbar = 0;
int teleporttimer;
int i = 0;

PImage introscreen;
PFont military;
PFont dolphin;
PFont wizardy;

color tp = #E83B46;

void setup () {
  size (800, 600);
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;

  //gifs images and fonts
  introscreen = loadImage("Introscreen.jpeg");
  military = createFont("Military Kid.ttf", 125);
  dolphin = createFont("Cute Dolphin.ttf", 125);
  wizardy = createFont("Wizardry Night.ttf", 125);
  gameovergif = new PImage [n];
  gamegif = new PImage [n1];
  UFO = loadImage("UFO.png");
  
  int i = 0;
  while (i < n) {
    gameovergif[i] = loadImage("frame_" + i + "_delay-0.07s.gif");
    i++;  
  }
  
  int ii = 0;
  while (ii < n1) {
    gamegif[ii] = loadImage("frame_" + ii + "_delay-0.1s.gif");
    ii++;
  }
  
  //Spaceship & Asteroid
  myShip = new Ship ();
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myShip);
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  
}

void draw () {

  UFOtimer++;
  if (UFOtimer > 480) {
    UFOtimer = 0;
    myObjects.add(new UFO());
  }

  if (mode == INTRO) {
    intro();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: Mode = " + mode);
  }
}

void keyPressed () {
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (keyCode == ' ') spacekey = true;
  if (key == 't' || key == 'T') tkey = true;
}

void keyReleased () {
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (keyCode == ' ') spacekey = false;
  if (key == 't' || key == 'T') tkey = false;
}
