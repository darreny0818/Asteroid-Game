class UFOBullet extends GameObject {

  int timer;

  UFOBullet(float x, float y, float vx, float vy) {
    lives = 1;
    timer = 90;
    location = new PVector(x, y);
    velocity = new PVector(vx, vy);
    velocity.setMag(10);
    size = 10;
  }

  void show() {
    stroke(255);
    fill(#32F022);
    circle(location.x, location.y, size);
  }


  void act() {
    super.act();

    timer--;
    if (timer == 0) {
      lives = 0;
    }
  }
}
