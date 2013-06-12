class lifeUp {
  float margelength=30;
  float margeheight=30;
  float x;
  float y;
  float yspeed;
  float MargeCenterX;
  float MargeCenterY;

  lifeUp() {
    x=random(0, width);
    yspeed=random(1, 5);
    y=height/2;
    y+=yspeed;
  }
  void display() {
    image(marge, x, y, margelength, margeheight);
    MargeCenterX=(x+margelength)/2;
    MargeCenterY=(y+margeheight)/2;
  }
  void move() {
    y+=yspeed;
  }

  boolean TouchesPlayer(float mx, float my) {
    if (y+margeheight>my && y+margeheight<my+100 && x>mx && x+margelength<mx+100) {
      print("lifeincrease");
      return true; 
    }
    else {
      return false;
    }
  }
}

