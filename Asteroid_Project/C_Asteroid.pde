class Asteroid extends GameObject {

  Asteroid() {
    lives = 1;
    location = new PVector (random(0, width), random(0, height));
    velocity = new PVector (0, 1);
    velocity.rotate (random(0, TWO_PI));
    velocity.setMag(3);
    size = 100;
  }

  Asteroid(int s, float x, float y) {
    lives = 1;
    location = new PVector (x, y);
    velocity = new PVector (0, 1);
    velocity.rotate (random(0, TWO_PI));
    velocity.setMag(3);
    size = s;
  }

  void show () {
    fill(0);
    stroke(255);
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    super.act();

    //dying and splitting
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
          myObj.lives = 0;
          score++;
          lives--;
          int numberofparticles = 20;
          int n = 0;
          while (n < numberofparticles) {
            myObjects.add(new Particles(location.x, location.y));
            n++;
          }
          if (size > 25) {
            myObjects.add(new Asteroid(size/2, location.x, location.y));
            myObjects.add(new Asteroid(size/2, location.x, location.y));
          }
        }
      }

      i++;
    }
  }
}
