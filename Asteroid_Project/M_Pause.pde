void pause () {

  //return button
  noFill();

  //play button
  fill(255);
  circle(50, 50, 50);
  stroke(0);
  strokeWeight(2);
  triangle(42, 37, 42, 63, 65, 50);
  strokeWeight(1);
  
  //pause button
  fill(255);
  textFont(dolphin);
  text("PAUSED", 400, 300);
  
}

void pauseClicks () {

  if (dist(mouseX, mouseY, 50, 50) <= 25) {
    mode = GAME;
  }
}
