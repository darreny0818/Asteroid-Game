class Particles extends GameObject {

  int t; // for transparency

  Particles (float x, float y) {
    lives = 1;
    size = int(random(5, 12));
    t = int(random(200, 255));
    location = new PVector (x, y);
    velocity = new PVector(int(random(-5, 5)), int(random(-5, 5)));
  }

  void show () {
    noStroke();
    fill(255, t);
    square(location.x, location.y, size);
  }

  void act () {
    super.act();
    t = t - 10;
    if (t <= 0) lives = 0;
  }
}
