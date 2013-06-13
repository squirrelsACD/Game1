class HomerLifeDown {
  float loislength=30;
  float loisheight=30;
  float x;
  float y;
  float yspeed;
  float LoisCenterX;
  float LoisCenterY;

  HomerLifeDown() {
    x=random(0, width);
    yspeed=random(1, 5);
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

  boolean LoisTouchesHomer(float mx, float my) {
    if (y+loisheight>my && y+loisheight<my+mycharacter.homerheight && x>mx && x+loisheight<mx+mycharacter.homerlength) {
      print("homerlifedecrease");
      return true; 
    }
    else {
      return false;
    }
  }
}

