//This is the class for the targets
class target {
  float x;
  float y;
  float d;
  float r;
  float speed;
  float maxdist;

  target() {
//    x=random(0, width);
    y=random(150,height-150);
//    y=0;
    x=0;
    d=30;
    speed=random(1, 3);
    r=d/2;
    maxdist=r;
  }
  void display() {
    noStroke();
    fill(0, 0, 255);
    ellipse(x, y, d, d);
  }

  void drop() {
    //    y=y+speed;
    x+=speed;
  }
  boolean isTouching(float mx, float my) {
    if (dist(x, y, mx, my)<=maxdist) {
      print("touch");
      return true;
    }
    else {
      return false;
    }
  }
}

