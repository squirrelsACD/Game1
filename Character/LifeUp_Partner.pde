class lifeUpTwo {
  float loislength=30;
  float loisheight=30;
  float x;
  float y;
  float yspeed;
  float LoisCenterX;
  float LoisCenterY;

  lifeUpTwo() {
    x=random(0, width);
    yspeed=random(-1, -5);
    y=height/2;
  }
  void display() {
    image(lois, x, y, loislength, loisheight);
    LoisCenterX=(x+loislength)/2;
    LoisCenterY=(y+loisheight)/2;
  }
  void move() {
    y+=yspeed;
  }

  boolean LoisTouchesPeter(float mx, float my) {
    if (y<my+mypartner.peterheight && y>my && x>mx && x+loislength<mx+mypartner.peterlength) {
      print("peterlifeincrease");
      return true; 
    }
    else {
      return false;
    }
  }
}

