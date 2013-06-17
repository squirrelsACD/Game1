int homerpicker;
int peterpicker;
import ddf.minim.*;
AudioPlayer ThemeSongs;
AudioPlayer DumpsterBaby;
AudioPlayer Fries;
AudioPlayer Doh;
AudioPlayer HomerWin;
AudioPlayer PeterWin;
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
ArrayList myHomerLifeDown = new ArrayList();
ArrayList myPeterLifeDown = new ArrayList();
ArrayList mytarget = new ArrayList();
ArrayList mybullet = new ArrayList();
ArrayList mypartnerbullet = new ArrayList();
int timer=1000;
int currentTimer;
int oldTimer=0;
float prizeTimerHomer=random(5000, 5000);
int currentPrizeTimerHomer;
int oldPrizeTimerHomer=0;
float prizeTimerPeter=random(5000, 5000);
int currentPrizeTimerPeter;
int oldPrizeTimerPeter=0;
int scorei=0; //player 1's score
int scoreii=0; //player 2's score
boolean pauseB=false;
boolean gamestart=false;

void setup() {
  size(750, 750);
  Begin = loadImage("startscreen.png");
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
  peterwins = loadImage("gameoverpeterwins.png");
  tie = loadImage("gameovertie.jpg");
  DumpsterBaby = minim.loadFile("Dumpster Baby.mp3");
  Fries = minim.loadFile("Fries.mp3");
  Doh = minim.loadFile("Doh.mp3");
  HomerWin = minim.loadFile("Spiderpig.mp3");
  PeterWin = minim.loadFile("CantTouchMe.mp3");
  ThemeSongs = minim.loadFile("ThemeSongs.mp3");
  mycharacter = new character();
  mypartner = new partner();
  BlackBox.init(this);
}

void draw() {
  StartTheGame();
  if (pauseB==true) {
    image(pause, 0, 0, 750, 750);
  }
  else {
    if (gamestart==false) {
      image(startscreen, 0, 0, 750, 750);
      imageMode(CENTER);
      image(Begin, width/2, 675, 300, 125);
      imageMode(CORNER);
      textSize(25);
    }
    else {
      ThemeSongs.pause();
      ThemeSongs.rewind();
      image(background, 0, 0, width, height);
      textSize(20);
      myFont = createFont("Comic Sans MS Bold", 25);
      textFont(myFont);
      fill(0, 0, 0);
      text("P2 Score:"+scoreii, width/8, 25);
      text("lives left:"+mypartner.life, width-width/9, 25);
      textSize(25);
      fill(0, 0, 0);
      text("P1 Score:"+scorei, width/8, height/1.15);
      text("lives left:"+mycharacter.life, width-width/9, height/1.15);
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
      //Homer life increase
      for (int lui=0; lui<lifeUp1.size(); lui++) {
        lifeUp lu = (lifeUp)lifeUp1.get(lui);
        lu.display();
        lu.move();
        if (lu.y>height || lu.y<0) {
          lifeUp1.remove(lui);
        }
        if (lu.MargeTouchesHomer(mycharacter.x, mycharacter.y)) {
          lifeUp1.remove(lui);
          mycharacter.life=mycharacter.life+1;
        }
        //30 in the following piece of code is stewey's length
        else {
          if (lu.MargeTouchesHomer(mycharacter.x+30, mycharacter.y)) {
            lifeUp1.remove(lui);
            mycharacter.life=mycharacter.life+1;
          }
        }
      }
      //Homer life decrease
      for (int hldi=0; hldi<myHomerLifeDown.size(); hldi++) {
        HomerLifeDown hld = (HomerLifeDown)myHomerLifeDown.get(hldi);
        hld.display();
        hld.move();
        if (hld.y>height || hld.y<0) {
          myHomerLifeDown.remove(hldi);
        }
        if (hld.LoisTouchesHomer(mycharacter.x, mycharacter.y)) {
          myHomerLifeDown.remove(hldi);
          mycharacter.life--;
          scoreii+=50;
        }
        else {
          if (hld.LoisTouchesHomer(mycharacter.x+30, mycharacter.y)) {
            myHomerLifeDown.remove(hldi);
            mycharacter.life--;
            scoreii+=50;
          }
        }
      }
      currentPrizeTimerHomer=millis();
      currentPrizeTimerPeter=millis();
      if (currentPrizeTimerHomer-oldPrizeTimerHomer>prizeTimerHomer) {
        oldPrizeTimerHomer=currentPrizeTimerHomer;
        homerpicker= int(random(1, 3));
        if (homerpicker==1) {
          lifeUp1.add(new lifeUp());
        }
        if (homerpicker==2) {
          myHomerLifeDown.add(new HomerLifeDown());
        }
        print("drop");
      }
      //difference between if and elseif
      if (currentPrizeTimerPeter-oldPrizeTimerPeter>prizeTimerPeter) {
        oldPrizeTimerPeter=currentPrizeTimerPeter;
        peterpicker= int(random(1, 3));  
        if (peterpicker==1) {
          lifeUp2.add(new lifeUpTwo());
        }
        if (peterpicker==2) {
          myPeterLifeDown.add(new PeterLifeDown());
        }
        print("drop");
      }
      //Peter life increase
      for (int lu2i=0; lu2i<lifeUp2.size(); lu2i++) {
        lifeUpTwo lu2 = (lifeUpTwo)lifeUp2.get(lu2i);
        lu2.display();
        lu2.move();
        if (lu2.y>height || lu2.y<0) {
          lifeUp2.remove(lu2i);
        }
        if (lu2.LoisTouchesPeter(mypartner.x, mypartner.y)) {
          lifeUp2.remove(lu2i);
          mypartner.life=mypartner.life+1;
        }
        //30 in the following piece of code is lois's length
        else {
          if (lu2.LoisTouchesPeter(mypartner.x-30, mypartner.y)) {
            lifeUp2.remove(lu2i);
            mypartner.life=mypartner.life+1;
          }
        }
      }
      //Peter life decrease
      for (int pldi=0; pldi<myPeterLifeDown.size(); pldi++) {
        PeterLifeDown pld = (PeterLifeDown)myPeterLifeDown.get(pldi);
        pld.display();
        pld.move();
        if (pld.y>height || pld.y<0) {
          myPeterLifeDown.remove(pldi);
        }
        if (pld.MargeTouchesPeter(mypartner.x, mypartner.y)) {
          myPeterLifeDown.remove(pldi);
          mypartner.life--;
          scorei+=50;
        }
        else {
          if (pld.MargeTouchesPeter(mypartner.x-30, mypartner.y)) {
            myPeterLifeDown.remove(pldi);
            mypartner.life--;
            scorei+=50;
          }
        }
      }
    }
  }
  if (scorei>scoreii && mycharacter.life>0 && mypartner.life>0 && pauseB==false) {
    DumpsterBaby.play();
  }
  else {
    DumpsterBaby.pause();
  }
  if (scorei<scoreii && mycharacter.life>0 && mypartner.life>0 && pauseB==false) {
    Fries.play();
  }
  else {
    Fries.pause();
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
  if (key==' ') {
    gamestart=true;
    HomerWin.rewind();
    PeterWin.rewind();
    Doh.rewind();
  }
}
void GameOver() {
  textAlign(CENTER);
  fill(255, 0, 255);
  if (mycharacter.life<=0 || mypartner.life<=0) {
    for (int pbi=0; pbi<mypartnerbullet.size(); pbi++) {
      partnerbullet pb = (partnerbullet)mypartnerbullet.get(pbi);
      if (pb.y>0 && pb.y<height) {
        mypartnerbullet.remove(pbi);
      }
    }
    for (int bi=0; bi<mybullet.size();bi++) {
      bullet b = (bullet)mybullet.get(bi);
      if (b.y>0 && b.y<height) {
        mybullet.remove(bi);
      }
    }
    for (int ti=0; ti<mytarget.size();ti++) {
      target t =(target)mytarget.get(ti);
      if (t.x>0 && t.x<width) {
        mytarget.remove(ti);
      }
    }
    for (int hldi=0; hldi<myHomerLifeDown.size(); hldi++) {
      HomerLifeDown hld = (HomerLifeDown)myHomerLifeDown.get(hldi);
      if (hld.y<height || hld.y>0) {
        myHomerLifeDown.remove(hldi);
      }
    }
    for (int lui=0; lui<lifeUp1.size(); lui++) {
      lifeUp lu = (lifeUp)lifeUp1.get(lui);
      if (lu.y<height || lu.y>0) {
        lifeUp1.remove(lui);
      }
    }
    for (int lu2i=0; lu2i<lifeUp2.size(); lu2i++) {
      lifeUpTwo lu2 = (lifeUpTwo)lifeUp2.get(lu2i);
      if (lu2.y<height || lu2.y>0) {
        lifeUp2.remove(lu2i);
      }
    }
    for (int pldi=0; pldi<myPeterLifeDown.size(); pldi++) {
      PeterLifeDown pld = (PeterLifeDown)myPeterLifeDown.get(pldi);
      if (pld.y<height || pld.y>0) {
        myPeterLifeDown.remove(pldi);
      }
    }
    for (int lu2i=0; lu2i<lifeUp2.size(); lu2i++) {
      lifeUpTwo lu2 = (lifeUpTwo)lifeUp2.get(lu2i);
      if (lu2.y<height || lu2.y>0) {
        lifeUp2.remove(lu2i);
      }
    }
    if (scorei>scoreii) {
      background(255);
      image(homerwins, 0, 0, width, height);
      textSize(50);
      text("The winner is Homer", width/2, height/2+100);
      //      DumpsterBaby.pause();
      HomerWin.play();
    }
    else if (scorei<scoreii) {
      background(255);
      image(peterwins, 0, 0, width, height);
      textSize(50);
      text("The winner is Peter", width/2, height/2+100);
      //      Fries.pause();
      PeterWin.play();
    }
    else {
      image(tie, 0, 0, width, height);
      textSize(50);
      text("It was a tie :O", width/2, height/2+100);
      Doh.play();
    }
    fill(255, 0, 255);
    textSize(25);
    text("GAME OVER...Press enter", width/2, height/2-50);
    text("Peter's score: "+ scoreii, width/2, height/2);
    text("Homer's score: "+ scorei, width/2, height/2 + 50);
    println(" gamestart: " + gamestart);
    gamestart=false;
    println(" gamestart: " + gamestart);
    if (key == ENTER || key == RETURN) {
      mypartner.x = width/2;
      mycharacter.x = width/2;
      mycharacter.life=3;
      mypartner.life=3;
      scorei=0;
      scoreii=0;
      PeterWin.pause();
      HomerWin.pause();
      ThemeSongs.play();
      DumpsterBaby.rewind();
      Fries.rewind();
    }
  }
}
void mousePressed () {
  if (mouseButton==RIGHT && gamestart==true) {
    pauseB=!pauseB;
    ThemeSongs.play();
    Fries.pause();
    DumpsterBaby.pause();
  }
}

