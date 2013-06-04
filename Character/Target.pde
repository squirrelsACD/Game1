//This is the class for the targets
class target {
  float x;
  float y;
  float d;
  float r;
  float hit=0;
  float speed;
  float maxdist;

  target() {
    //    x=random(0, width);
    y=random(150, height-150);
    //    y=0;
    x=0;
    d=30;
    r=d/2;
    maxdist=r;
    speed=random(1,3);
  }
  void display() {
    noStroke();
    fill(0, 0, 255);
    ellipse(x, y, d, d);
  }

  void drop() {
    if (hit==0) {
      speed=random(1, 3);
    }
    if (hit==1) {
      speed=random(3, 5);
    }
    if (hit==2) {
      speed=random(5, 7);
    }
  
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

