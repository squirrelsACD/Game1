//This object will shoot the weapon
class character {
  float homerlength=100;
  float homerheight=100;
  float x=width/2; 
  float y=650;
  int life=3;
  float HomerCenterX;
  character() {
  }
  void display() {
    image(homer, x, y, homerlength, homerheight);
      if (BlackBox.isKeyDown(BlackBox.VK_A)) {
        if (x>=0) {
          x-=5;
        }
      }
      if (BlackBox.isKeyDown(BlackBox.VK_D)) {
        if (x+homerlength<=width) {
          x+=5;
        }
      }
    HomerCenterX=.5*(x+homerlength);
  }
  boolean HomerIsHit(float mx, float my) {
    if (my==y+50 && x+10<mx && x+homerlength>mx+10) {
      print("homerhit");
      return true;
    }
    else {
      return false;
    }
  }
}

