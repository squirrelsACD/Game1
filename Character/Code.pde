//Player will have 200 bullets to destroy 75 targets. 
//If a single target gets past the player, he loses.
//The difficulty will automatically increase after the player gets 20 points.
PImage background;
int timer=1000;
int currentTimer;
int oldTimer=0;
character mycharacter;
bullet[] mybulletArray = new bullet[200];
target[] mytargetArray = new target[77];
int bulletcount=0;
int score;
int targetcount=0;
int winningscore=75;

void setup() {
  size(750, 750);
  background = loadImage("background.gif");
  mycharacter = new character();
  mybulletArray[0] = new bullet(30, 20);
  mytargetArray[0] = new target();
  frameRate(100);
}
void draw() { 
  image(background, 0, 0, displayWidth, displayHeight);
  textSize(50);
  fill(255, 255, 255);
  textAlign(CENTER);
  //This will create the scoreboard.
  text(score, width/2, height/10);
  mycharacter.display();
  currentTimer=millis();
  //After the predetermined time, a new target will appear.
  if (currentTimer-oldTimer>timer) {
    oldTimer=currentTimer;
    targetcount=targetcount+1;
    mytargetArray[targetcount]=new target();
  }
  for (int ti=0; ti<=targetcount; ti=ti+1) {
    mytargetArray[ti].display();
    mytargetArray[ti].drop();
    for (int i=0;i<=bulletcount; i=i+1) {
      //      mybulletArray[i].isTouching(mytargetArray[ti]);
      if (mybulletArray[i].isTouching(mytargetArray[ti])) {
        mytargetArray[ti].y=-height*100000;
        score=score+1;
      }
    }
  }
  for (int i=0; i<=bulletcount; i=i+1) {
    mybulletArray[i].display(); 
    mybulletArray[i].spin();
    mybulletArray[i].move();
  }
  //This will enable bulltets to emerge when the x button is pressed.
  if (keyPressed) {
    if (key == 'x' || key == 'X') {
      if (bulletcount<mybulletArray.length-1) {
        bulletcount=bulletcount+1;
        mybulletArray[bulletcount]=new bullet(30, 20);
      }
    }
  }
  //The difficulty will automatically increase after 15 points.
  if (score>15) {
    for (int ti=0; ti<=targetcount; ti=ti+1) {
      mytargetArray[ti].speed=random(7, 9);
    }
  }
  gameOver();
  win();
}

//This is a code that says what will happen if the ball gets past the chracter.
void gameOver() {
  for (int ti=0; ti<=targetcount; ti=ti+1) {
    if (mytargetArray[ti].y>height) {
      fill(color(255, 0, 0));
      fill(255, 0, 0);
      textAlign(CENTER);
      text("GAME OVER    :(    :(    :(    :(", width/2, height/2-50);
      text("Your score was : "+ score, width/2, height/2);
      text("Since you stink, ", width/2, height/2 + 75);
      text("you don't get a retry", width/2, height/2 + 130);
      noLoop();
    }
  }
}
//This will happen if the player wins.
void win() {
  if (score>=winningscore) {
    fill(color(255, 0, 0));
    fill(255, 0, 0);
    text("you win", width/2, height/2);
    noLoop();
  }
}

//
//bullet[] mybulletArray = new bullet[200];
//int bulletcount = 0;
//void setup() {
//}
//
//void draw() {
//}
//
//void mousePressed() {
//  if (bulletcount<mybulletArray.length-1) {
//    bulletcount++;
//    mybulletArray[bulletcount] = new bullet();
//  }
//}

