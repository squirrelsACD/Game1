//This object will shoot the weapon
class partner {
  float peterlength=100;
  float peterheight=100;
  float x=width/2; 
  float y=0;
  int life=3;
  float PeterCenterX;
  partner() {
  }
  void display() {
    image(peter, x, y, peterlength, peterheight);
    if (keyPressed) {
      if (key == '4') {
        if (x>=0) {
          x-=5;
        }
      }
      if (key == '6') {
        if (x+peterlength<=width) {
          x+=5;
        }
      }
    }
    PeterCenterX=.5*(x+peterlength);
  }
//IsHit boolean needs to account for the left edge of bullet hitting players
  boolean PeterIsHit(float mx, float my) {
//    if (my==peterheight && x<mx && x+peterlength>mx) {
    if (my==peterheight && dist(PeterCenterX,peterheight,mx,my)<50) {
      print("peterhit");
      return true;
    }
    else {
      return false;
    }
  }
}

