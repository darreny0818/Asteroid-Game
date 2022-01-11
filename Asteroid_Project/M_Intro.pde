void intro () {

  background (0);
  image(introscreen, 400, 300, width, height);
  
  textFont(dolphin);
  fill(255);
  textSize(125);
  text("ASTEROIDS", 400, 150);
  
  //restart button
  fill (0);
  stroke(255);
  strokeWeight(thick);
  rect(400, 470, 200, 80);

  if (mouseX >= 300 && mouseX <=500 && mouseY >= 430 && mouseY <= 510) {
    thick = 6;
  } else {
    thick = 1;
  }

  textFont(wizardy);
  textSize(40);
  fill(255);
  text("ENTER", 400, 470);
  
}

void introClicks () {
  
  if (mouseX >= 300 && mouseX <=500 && mouseY >= 430 && mouseY <= 510) {
    mode = GAME;
  }
  
  
}
