//This is for the bullets.

class bullet {
  float x;
  float y;
  float r1;
  float r2;
  float i=0;
  float yspeed=10;

  bullet(float r1_, float r2_) {
    x=mycharacter.x;
    y=mycharacter.y;
    r1=r1_;
    r2=r2_;
  }
  void display() {
    noFill();
    stroke(random(255), random(255), random(255));
    pushMatrix();
    translate(x, y);
    rotate(degrees(i));
    arc(0, 0, r1, r1, 0, PI);
    arc(0, 0, r2, r2, 0, PI);
    popMatrix();
  }
  void spin() {
    i=i+.005;
  }

  void move() {
    y=y-yspeed;
  }
  boolean isTouching(target t) {
    if (dist(x, y, t.x, t.y)<=r1+t.r) {
      print("touch");
      return true;
    }
    else {
      print("...");
      return false;
    }
  }
}

