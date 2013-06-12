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
    y-=yspeed;
  }
  void display() {
    image(lois, x, y, loislength, loisheight);
    LoisCenterX=(x+loislength)/2;
    LoisCenterY=(y+loisheight)/2;
  }
  void move() {
    y+=yspeed;
  }

  boolean TouchesPlayer(float mx, float my) {
    if (y<my+100 && y>my && x>mx && x+loislength<mx+100) {
      print("lifeincrease");
      return true; 
    }
    else {
      return false;
    }
  }
}

