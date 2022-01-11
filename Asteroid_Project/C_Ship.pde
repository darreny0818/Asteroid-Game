class Ship extends GameObject {

  PVector direction;
  int shotTimer, threshold;
  int immunity;

  Ship () {
    lives = 3;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    shotTimer = 0;
    threshold = 20;
    immunity = 0;
    teleporttimer = 0;
    size = 50;
  }


  // Behavior functions
  void show () {
    pushMatrix ();
    translate(location.x, location.y);
    rotate(direction.heading());

    if (immunity <= 150) {
      fill(#FF0818);
    } else {
      stroke(255);
      fill(#712025);
    }

    triangle(-25, -12.5, -25, 12.5, 25, 0);
    popMatrix ();
  }

  void act () {
    super.act();

    //capping its speed
    if (velocity.mag() > 5)
      velocity.setMag(5);

    //fire
    if (upkey) {
      velocity.add(direction);
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
    }

    //moving
    if (downkey) velocity.sub(direction);
    if (leftkey) direction.rotate( -radians(5) );
    if (rightkey) direction.rotate( radians(5) );

    //firing bullets
    shotTimer++;
    if (spacekey && shotTimer >= threshold) {
      myObjects.add(new Bullet());
      shotTimer = 0;
    }

    //teleporting
    teleporttimer = teleporttimer + 1;
    int h = 0;

    if (tkey && teleporttimer >= 300) {
      while (h < myObjects.size()) {
        GameObject myObj = myObjects.get(h);
        if (myObj instanceof Asteroid || myObj instanceof UFO || myObj instanceof UFOBullet) {
          while (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size/2 + 200) {
            location = new PVector(int(random(0, width)), (int(random(0, height))));
            teleporttimer = 0;
          }
        }
        h++;
      }
    }

    immunity++;

    //hit by ufo bullet
    int i = 0;

    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof UFOBullet) {
        if (immunity >= 150 && dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size/2) {
          myObj.lives = 0;
          lives--;
          immunity = 0;
        }
      }
      i++;
    }


    //getting hit by asteroid
    int g = 0;

    while (g < myObjects.size()) {
      GameObject myObj = myObjects.get(g);
      if (myObj instanceof Asteroid) {
        if (immunity >= 150 && dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size/2) {
          lives--;
          immunity = 0;
        }
      }
      g++;
    }
  }
}
