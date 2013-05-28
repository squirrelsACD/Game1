PImage background;
PImage homer;
PImage maggie;
character mycharacter;
ArrayList mytarget = new ArrayList();
ArrayList mybullet = new ArrayList();
int timer=1000;
int currentTimer;
int oldTimer=0;
int prizeTimer=5000;
int currentPrizeTimer;
int oldPrizeTimer=0;

void setup() {
  size(750, 750);
  background = loadImage("background.gif");
  homer = loadImage("homer.jpg");
  maggie = loadImage("maggie.jpg");
  mycharacter= new character();
}

void draw() {
  image(background, 0, 0, displayWidth, displayHeight);
  mycharacter.display();
  for (int ti=0; ti<mytarget.size();ti++) {
    target t =(target)mytarget.get(ti);
    t.display();
    t.drop();
    for (int bi=0; bi<mybullet.size();bi++) {
      bullet b = (bullet)mybullet.get(bi);
      if (t.isTouching(b.x, b.y)) {
        mytarget.remove(ti);
      }
      if (t.isTouching(b.x+b.maggielength, b.y)) {
        mytarget.remove(ti);
      }
    }
  }
  for (int bi=0; bi<mybullet.size();bi++) {
    bullet b = (bullet)mybullet.get(bi);
    b.display();
    b.move();
  }
  currentTimer=millis();
  if (currentTimer-oldTimer>timer) {
    oldTimer=currentTimer;
    mytarget.add(new target());
  }

  for (int bi=0; bi<mybullet.size();bi++) {
    bullet b = (bullet)mybullet.get(bi);
    if (b.y<0) {
      mybullet.remove(bi);
    }
  }
  currentPrizeTimer=millis();
//    NEED TO WORK ON THE FOLLOWING CODE
//  if (currentPrizeTimer-oldPrizeTimer>prizeTimer) {
//    fill(255, 255, 255);
//    ellipse(width/2, height/2, 200, 200);
//    oldPrizeTimer=currentPrizeTimer;
//  }
}
void keyReleased() {
  if (key == 's' || key == 'S') {
    mybullet.add(new bullet());
  }
}

