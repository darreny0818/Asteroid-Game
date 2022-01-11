class Bullet extends GameObject {

  int timer; //how long the bullet stays alive for

  Bullet () {
    timer = 90;
    lives = 1;
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(15);
    size = 10;
  }

  void show() {
    stroke(255);
    fill(255, 0, 0);
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    super.act();

    timer--;
    if (timer == 0) {
      lives = 0;
    }
  }
}
