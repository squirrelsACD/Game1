PImage background;
PImage homer;
PImage maggie;
PImage peter;
PImage stewie;
PImage brian;
PImage bart;
PImage lois;
PImage marge;
PImage donut;
PImage donut1;
PImage donut2;
character mycharacter;
partner mypartner;
ArrayList lifeUp1 = new ArrayList();
ArrayList lifeUp2 = new ArrayList();
ArrayList lifeDown1 = new ArrayList();
ArrayList lifeDown2 = new ArrayList();
ArrayList mytarget = new ArrayList();
ArrayList mybullet = new ArrayList();
ArrayList mypartnerbullet = new ArrayList();
int timer=1000;
int currentTimer;
int oldTimer=0;
float prizeTimer=random(5000,20000);
int currentPrizeTimer;
int oldPrizeTimer=0;
float prizeTimer2=random(15000, 30000);
int currentPrizeTimer2;
int oldPrizeTimer2;
int scorei=0; //player 1's score
int scoreii=0; //player 2's score

void setup() {
  size(750, 750);
  donut = loadImage("Donut.png");
  donut1 = loadImage("Donut1.png");
  donut2 = loadImage("Donut2.png");
  background = loadImage("background.gif");
  homer = loadImage("homer.png");
  maggie = loadImage("maggie.png");
  peter = loadImage("peter.png");
  stewie = loadImage("stewie.png");
  brian = loadImage("briancounter.png");
  bart = loadImage("bartcounter.png");
  lois = loadImage("griffinlife.png");
  marge = loadImage("margelife.png");
  mycharacter = new character();
  mypartner = new partner();
  BlackBox.init(this);
}

void draw() {
  image(background, 0, 0, displayWidth, displayHeight);
  textSize(50);
  fill(255);
  text(scoreii, width/10, height/7);
  text(mypartner.life, width-width/10, height/7);
  textSize(50);
  fill(255);
  text(scorei, width/1.2, height/1.15);
  text(mycharacter.life, width-width/1.2, height/1.15);
  mycharacter.display();
  mypartner.display();
  for (int ti=0; ti<mytarget.size();ti++) {
    target t =(target)mytarget.get(ti);
    t.display();
    t.drop();
    //when character's bullet hits the target and to increase the score
    for (int bi=0; bi<mybullet.size();bi++) {
      bullet b = (bullet)mybullet.get(bi);
      if (t.isTouching(b.x, b.y)) {
        scorei++;
        t.hit++;
        mybullet.remove(bi);
        if (t.hit==3) {
          mytarget.remove(ti);
        }
      }
      if (t.isTouching(b.x+b.maggielength, b.y)) {
        scorei++;
        t.hit++;
        mybullet.remove(bi);
        if (t.hit==3) {
          mytarget.remove(ti);
        }
      }
      if (mypartner.PeterIsHit(b.MaggieCenterX, b.MaggieCenterY)) {
        mybullet.remove(bi);
        mypartner.life=mypartner.life-1;
      }
    }
    //when partner's bullet hits the target and to increase the score
    for (int pbi=0; pbi<mypartnerbullet.size();pbi++) {
      partnerbullet pb = (partnerbullet)mypartnerbullet.get(pbi);
      if (t.isTouching(pb.x, pb.y)) {
        scoreii++;
        t.hit++;
        mypartnerbullet.remove(pbi);
        if (t.hit==3) {
          mytarget.remove(ti);
        }
      }
      if (t.isTouching(pb.x+pb.stewielength, pb.y)) {
        scoreii++;
        t.hit++;
        mypartnerbullet.remove(pbi);
        if (t.hit==3) {
          mytarget.remove(ti);
        }
      }
      if (mycharacter.HomerIsHit(pb.x, pb.y)) {
        mypartnerbullet.remove(pbi);
        mycharacter.life=mycharacter.life-1;
      }
    }
  }
  //why does this move extremely fast when placed on line 62
  for (int bi=0; bi<mybullet.size();bi++) {
    bullet b = (bullet)mybullet.get(bi);
    b.display();
    b.move();
  }
  for (int pbi=0; pbi<mypartnerbullet.size(); pbi++) {
    partnerbullet pb = (partnerbullet)mypartnerbullet.get(pbi);
    pb.display();
    pb.move();
  }
  //to drop new targets
  currentTimer=millis();
  if (currentTimer-oldTimer>timer) {
    oldTimer=currentTimer;
    mytarget.add(new target());
  }
  //to remove the bullets after they leave the screen
  for (int bi=0; bi<mybullet.size();bi++) {
    bullet b = (bullet)mybullet.get(bi);
    if (b.y<0) {
      mybullet.remove(bi);
    }
  }
  for (int pbi=0; pbi<mypartnerbullet.size(); pbi++) {
    partnerbullet pb = (partnerbullet)mypartnerbullet.get(pbi);
    if (pb.y<0) {
      mypartnerbullet.remove(pbi);
    }
  }
  //The following code increases/decrease life. It is not yet coded to do so.
  for (int lui=0; lui<lifeUp1.size(); lui++) {
    lifeUp lu = (lifeUp)lifeUp1.get(lui);
    lu.display();
    lu.drop();
  }
    for (int ldi=0; ldi<lifeDown1.size(); ldi++){
    lifeDown ld = (lifeDown)lifeDown1.get(ldi);
    ld.display();
    ld.drop();
  }

  currentPrizeTimer=millis();
  if (currentPrizeTimer-oldPrizeTimer>prizeTimer) {
    oldPrizeTimer=currentPrizeTimer;
    lifeUp1.add(new lifeUp());
    lifeDown1.add(new lifeDown());
  }
  
    for (int luii=0; luii<lifeUp2.size(); luii++){
    lifeUpTwo lui = (lifeUpTwo)lifeUp2.get(luii);
    lui.display();
    lui.drop();
  }
  for(int ldii=0; ldii<lifeDown2.size(); ldii++){
    lifeDownTwo ldi = (lifeDownTwo) lifeDown2.get(ldii);
    ldi.display();
    ldi.drop();
  }
  
  currentPrizeTimer2=millis();
  if(currentPrizeTimer2-oldPrizeTimer2>prizeTimer2){
    oldPrizeTimer2=currentPrizeTimer2;
    lifeUp2.add(new lifeUpTwo());
    lifeDown2.add(new lifeDownTwo());
  }
}
void keyReleased() {
  if (key == 'w' || key == 'W') {
    mybullet.add(new bullet());
  }
  if (key == 'i' || key == 'I') {
    mypartnerbullet.add(new partnerbullet());
  }
}

