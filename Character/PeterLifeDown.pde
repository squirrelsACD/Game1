class PeterLifeDown {
  float margelength=30;
  float margeheight=30;
  float x;
  float y;
  float yspeed;
  float MargeCenterX;
  float MargeCenterY;

  PeterLifeDown() {
    x=random(0, width);
    yspeed=random(-1, -5);
    y=height/2;
  }
  void display() {
    image(marge, x, y, margelength, margeheight);
    MargeCenterX=(x+margelength)/2;
    MargeCenterY=(y+margeheight)/2;
  }
  void move() {
    y+=yspeed;
  }

  boolean MargeTouchesPeter(float mx, float my) {
    if (y<my+mypartner.peterheight && y>my && x>mx && x+margelength<mx+mypartner.peterlength) {
      print("homerlifedecrease");
      return true; 
    }
    else {
      return false;
    }
  }
}
