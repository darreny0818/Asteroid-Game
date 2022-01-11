void gameover () {
  
  image(gameovergif[f], 400, 300, width, height);
    f++;
    if (f == n) f = 0;

  //win or lose
  if (score == 21) {
    fill(255);
    textSize(100);
    textFont(military);
    text("WINNER", 400, 150);
    
  } else {    
    fill(255);
    textSize(100);
    textFont(military);
    text("GAMEOVER", 400, 150);
  }

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

  fill(255);
  textFont(wizardy);
  textSize(40);
  text("RESTART", 400, 465);
}

void gameoverClicks () {

  if (mouseX >= 300 && mouseX <=500 && mouseY >= 430 && mouseY <= 510) {
    setup();
    mode = INTRO;
    score = 0;
    tpbar = 0;
    teleporttimer = 0;
  }
}
