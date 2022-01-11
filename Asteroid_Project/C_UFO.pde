class UFO extends GameObject {

  int side;
  int shotTimer;
  int threshold;
  float vy, vx;

  UFO () {

    side = int(random(0, 4));
    lives = 3;
    size = 75;

    // coming from a random side
    if (side == 0) {
      location = new PVector (int(random(0, width)), -30);
      velocity = new PVector (0, 2.5);
    } else if (side == 1) {
      location = new PVector (int(random(0, width)), height + 30);
      velocity = new PVector (0, -2.5);
    } else if (side == 2) {
      location = new PVector (width + 30, int(random(0, height)));
      velocity = new PVector (-2.5, 0);
    } else {
      location = new PVector (-30, int(random(0, height)));
      velocity = new PVector (2.5, 0);
    }

    shotTimer = 0;
    threshold = 10;
  }

  void show () {
    
    fill(#32F022);
    circle(location.x, location.y, size); 
  }

  void act () {

    location.add(velocity);

    //aiming
    vy = myShip.location.y-location.y;
    vx = myShip.location.x-location.x;

    //shooting bullets
    shotTimer++;
    if (shotTimer > threshold) {
      myObjects.add(new UFOBullet(location.x, location.y, vx, vy));
      shotTimer = 0;
    }

    //removing UFO off screen
    if (location.x > width + 50 || location.y < -50 || location.y > height + 50 || location.y < -50) {
      lives = 0;
    }

    //killed by bullets
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size + myObj.size) {
          myObj.lives = 0;
          lives--;
          int numberofparticles = 20;
          int n = 0;
          while (n < numberofparticles) {
            myObjects.add(new Particles(location.x, location.y));
            n++;
          }
        }
      }
      i++;
    }
  }
}
