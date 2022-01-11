void game () {

  //gif
  image(gamegif[f1], 400, 300, width, height); 
  f1++; 
  if (f1 == n1) f1 = 0;

  //game setup stuff
  int i = 0;

  while (i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();


  //removing objects
    if (myObj.lives == 0) {
      myObjects.remove(i);
    } else {
      i++;
    }
  }

  //pause button
  fill(255);
  circle(50, 50, 50);
  stroke(0);
  strokeWeight(2);
  line(42, 35, 42, 65);
  line(58, 35, 58, 65);
  strokeWeight(1);
  
  //teleport timer bar
  
  fill(255);
  textSize(30);
  text("TELEPORT:", 200, 527);
  
  rectMode(CORNER);
  stroke(255);
  noFill();
  rect(300, 515, 300, 20);
  fill(tp);
  rect(300, 515, tpbar, 20);
  rectMode(CENTER);
  
  tpbar = tpbar + 1;
  if (tpbar >= 300) {
    tpbar = 300;
    tp = #49E33C;
  } else {
    tp = #E83B46;
  }
  
  if (teleporttimer == 0) tpbar = 0;
  
  //showing number of lives
  fill(255);
  textFont(wizardy);
  textSize(25);
  text("Lives: " + myShip.lives, 700, 50);


  //moving to win/lose screen
  if (myShip.lives == 0) {
    mode = GAMEOVER;
  }
  
  if (score == 21) {
    mode = GAMEOVER;
  }
}

void gameClicks () {

  if (dist(mouseX, mouseY, 50, 50) <= 25) {
    mode = PAUSE;
  }
}
