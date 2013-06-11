import ddf.minim.*;
AudioPlayer DumpsterBaby;
AudioPlayer Fries;
Minim minim;
PFont myFont;
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
PImage homerwins;
PImage peterwins;
PImage tie;
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
float prizeTimer=random(5000, 5000);
int currentPrizeTimer;
int oldPrizeTimer=0;
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
  background = loadImage("background.jpg");
  homer = loadImage("homer.png");
  maggie = loadImage("maggie.png");
  peter = loadImage("peter.png");
  stewie = loadImage("stewie.png");
  brian = loadImage("briancounter.png");
  bart = loadImage("bartcounter.png");
  lois = loadImage("griffinlife.png");
  marge = loadImage("margelife.png");
  minim = new Minim(this);
  homerwins = loadImage("gameoverhomerwins.png");
  peterwins = loadImage("gameoverpeterwins.jpg");
  tie = loadImage("gameovertie.jpg");
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
      image(background, 0, 0, width, height);
      textSize(25);
      myFont = createFont("Comic Sans MS Bold", 25);
      textFont(myFont);
      fill(0, 0, 0);
      text("P2 Score:"+scoreii, width/24, 25);
      text("lives left:"+mypartner.life, width-width/9-120, 25);
      textSize(25);
      fill(0, 0, 0);
      text("P1 Score:", width/1.2, height/1.15-50);
      text(scorei, width/1.2, height/1.15);
      text("lives left:"+mycharacter.life, width-width/1.2-120, height/1.15);
      mycharacter.display();
      mypartner.display();
      for (int bi=0; bi<mybullet.size();bi++) {
        bullet b = (bullet)mybullet.get(bi);
        if (mypartner.PeterIsHit(b.x, b.y)) {
          mybullet.remove(bi);
          mypartner.life=mypartner.life-1;
        }
        //30 in the following piece of code is stewey's length
        else {
          if (mypartner.PeterIsHit(b.x+30, b.y)) {
            mybullet.remove(bi);
            mypartner.life=mypartner.life-1;
          }
        }
      }
      for (int pbi=0; pbi<mypartnerbullet.size(); pbi++) {
        partnerbullet pb = (partnerbullet)mypartnerbullet.get(pbi);
        if (mycharacter.HomerIsHit(pb.x, pb.y)) {
          mypartnerbullet.remove(pbi);
          mycharacter.life=mycharacter.life-1;
        }
        else {
          if (mycharacter.HomerIsHit(pb.x+30, pb.y)) {
            mypartnerbullet.remove(pbi);
            mycharacter.life=mycharacter.life-1;
          }
        }
      }
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
        }
      }
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
      //The following code increases/decrease life.
      for (int lui=0; lui<lifeUp1.size(); lui++) {
        lifeUp lu = (lifeUp)lifeUp1.get(lui);
        lu.display();
        lu.move();
        if (lu.y>height || lu.y<0) {
          lifeUp1.remove(lui);
        }
        if (lu.TouchesPlayer(mycharacter.x, mycharacter.y)) {
          lifeUp1.remove(lui);
          mycharacter.life=mycharacter.life+1;
        }
        //30 in the following piece of code is stewey's length
        else {
          if (lu.TouchesPlayer(mycharacter.x+30, mycharacter.y)) {
            lifeUp1.remove(lui);
            mycharacter.life=mycharacter.life+1;
          }
        }
      }
      currentPrizeTimer=millis();
      if (currentPrizeTimer-oldPrizeTimer>prizeTimer) {
        oldPrizeTimer=currentPrizeTimer;
        lifeUp1.add(new lifeUp());
        print("drop");
      }
    }
  }
  if (scorei>scoreii) {
    DumpsterBaby.play();
  }
  if (scorei<scoreii) {
    Fries.play();
  }
  GameOver();
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
void GameOver() {
  textAlign(CENTER);
  fill(300, 100, 100);
  if (mycharacter.life==0 || mypartner.life==0) {
    if (scorei>scoreii) {
      image(homerwins, 0, 0, width, height);
      textSize(50);
      text("The winner is Homer", width/2, height/2+100);
    }
    if (scorei<scoreii) {
      image(peterwins, 0, 0, width, height);
      textSize(50);
      text("The winner is Peter", width/2, height/2+100);
    }
    if (scorei==scoreii) {
      image(tie, 0, 0, width, height);
      textSize(50);
      text("It was a tie :O", width/2, height/2+100);
    }
    fill(300, 100, 100);
    textSize(25);
    text("GAME OVER", width/2, height/2-50);
    text("Peter's score was : "+ scoreii, width/2, height/2);
    text("Homer's score was : "+ scorei, width/2, height/2 + 50);
    noLoop();
  }
}

void mousePressed () {
  if (mouseButton ==RIGHT) {
    {
      pauseB=!pauseB;
    }
  }
}

