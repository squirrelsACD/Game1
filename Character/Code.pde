import ddf.minim.*;
AudioPlayer DumpsterBaby;
AudioPlayer Fries;
Minim minim;
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
PImage Begin;
PImage startscreen;
PImage pause;
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
float prizeTimer=random(5000, 20000);
int currentPrizeTimer;
int oldPrizeTimer=0;
float prizeTimer2=random(15000, 30000);
int currentPrizeTimer2;
int oldPrizeTimer2;
int scorei=0; //player 1's score
int scoreii=0; //player 2's score
boolean pauseB=false;
boolean gamestart=false;
void setup() {
  size(750, 750);
  Begin = loadImage("Begin.png");
  pause = loadImage("PauseScreen.jpg");
  startscreen = loadImage("StartScreen.jpg");
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
  minim = new Minim(this);
  DumpsterBaby = minim.loadFile("Dumpster Baby.mp3");
  Fries = minim.loadFile("Fries.mp3");
  mycharacter = new character();
  mypartner = new partner();
  BlackBox.init(this);
}

void draw() {
  StartTheGame();
  if (pauseB==true) {
    image(pause, 0, 0, 750, 750);
  }
  else if (pauseB==false) {
    if (gamestart==false) {
      image(startscreen, 0, 0, 750, 750);
      imageMode(CENTER);
      image(Begin, width/2, 600, 300, 300);
      imageMode(CORNER);
    }
    else if (gamestart==true) {
<<<<<<< HEAD
  image(background, 0, 0, displayWidth, displayHeight);
  textSize(25);
  fill(255);
  text("P2 Score:", width/10, height/7-50);
  text(scoreii, width/10, height/7);
  text("lives left:", width-width/10-120, height/7);
  text(mypartner.life, width-width/10, height/7);
  textSize(25);
  fill(255);
  text("P1 Score:", width/1.2, height/1.15-50);
  text(scorei, width/1.2, height/1.15);
  text("lives left:", width-width/1.2-120, height/1.15);
  text(mycharacter.life, width-width/1.2+20, height/1.15);
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
        t.hit++;
        scorei+=2*t.hit;
        mybullet.remove(bi);
        if (t.hit==3) {
          mytarget.remove(ti);
=======
      image(background, 0, 0, displayWidth, displayHeight);
      textSize(25);
      fill(255);
      text("P2 Score:", width/10, height/7-50);
      text(scoreii, width/10, height/7);
      text("lives left:", width-width/10-120, height/7);
      text(mypartner.life, width-width/10, height/7);
      textSize(25);
      fill(255);
      text("P1 Score:", width/1.2, height/1.15-50);
      text(scorei, width/1.2, height/1.15);
      text("lives left:", width-width/1.2-120, height/1.15);
      text(mycharacter.life, width-width/1.2+20, height/1.15);
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
            t.hit++;
            scorei+=2*t.hit;
            mybullet.remove(bi);
            if (t.hit==3) {
              mytarget.remove(ti);
            }
          }
          if (t.isTouching(b.x+b.maggielength, b.y)) {
            t.hit++;
            scorei+=2*t.hit;
            mybullet.remove(bi);
            if (t.hit==3) {
              mytarget.remove(ti);
            }
          }
          if (mypartner.PeterIsHit(b.MaggieCenterX, b.MaggieCenterY)) {
            mybullet.remove(bi);
            mypartner.life=mypartner.life-1;
          }
>>>>>>> 3aacfc41c6a6d51b431f68e6fe4f5175aded39dc
        }
        //when partner's bullet hits the target and to increase the score
        for (int pbi=0; pbi<mypartnerbullet.size();pbi++) {
          partnerbullet pb = (partnerbullet)mypartnerbullet.get(pbi);
          if (t.isTouching(pb.x, pb.y)) {
            t.hit++;
            scoreii+=2*t.hit;
            mypartnerbullet.remove(pbi);
            if (t.hit==3) {
              mytarget.remove(ti);
            }
          }
          for (int bi=0; bi<mybullet.size();bi++) {
            bullet b = (bullet)mybullet.get(bi);
            if (pb.isTouching(b.x, b.y)) {
              mybullet.remove(bi);
              mypartnerbullet.remove(pbi);
            }
          }

          if (t.isTouching(pb.x+pb.stewielength, pb.y)) {
            t.hit++;
            scoreii+=2*t.hit;
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
        if (lu.y>height || lu.y<0) {
          lifeUp1.remove(lui);
        }
      }
      for (int ldi=0; ldi<lifeDown1.size(); ldi++) {
        lifeDown ld = (lifeDown)lifeDown1.get(ldi);
        ld.display();
        ld.drop();
        if (ld.y>height || ld.y<0) {
          lifeDown1.remove(ldi);
        }
      }

      currentPrizeTimer=millis();
      if (currentPrizeTimer-oldPrizeTimer>prizeTimer) {
        oldPrizeTimer=currentPrizeTimer;
        lifeUp1.add(new lifeUp());
        lifeDown1.add(new lifeDown());
      }

      for (int luii=0; luii<lifeUp2.size(); luii++) {
        lifeUpTwo lu2 = (lifeUpTwo)lifeUp2.get(luii);
        lu2.display();
        lu2.drop();
        if (lu2.y>height || lu2.y<0) {
          lifeUp2.remove(luii);
        }
      }
      for (int ldii=0; ldii<lifeDown2.size(); ldii++) {
        lifeDownTwo ld2 = (lifeDownTwo) lifeDown2.get(ldii);
        ld2.display();
        ld2.drop();
        if (ld2.y>height || ld2.y<0) {
          lifeDown2.remove(ldii);
        }
      }

      currentPrizeTimer2=millis();
      if (currentPrizeTimer2-oldPrizeTimer2>prizeTimer2) {
        oldPrizeTimer2=currentPrizeTimer2;
        lifeUp2.add(new lifeUpTwo());
        lifeDown2.add(new lifeDownTwo());
      }
    }
  }
  if (scorei>scoreii) {
    DumpsterBaby.play();
  }
  if (scorei<scoreii) {
    Fries.play();
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
void StartTheGame() {
  if (mousePressed && (mouseButton ==LEFT)) {
    gamestart=true;
  }
}
void mousePressed () {
  if (mouseButton == RIGHT) {
    {
      pauseB=!pauseB;
    }
  }
}

