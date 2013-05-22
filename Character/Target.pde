//This is the class for the targets
class target {
  float x;
  float y;
  float d;
  float r;
  float speed;

  target() {
    x=random(0, width);
    y=0;
    d=30;
    speed=random(1, 3);
    r=d/2;
  }
  void display() {
    noStroke();
    fill(0, 0, 255);
    ellipse(x, y, d, d);
  }

  void drop() {
    y=y+speed;
  }
}


