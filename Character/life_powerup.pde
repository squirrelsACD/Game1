//This is the class for the life powerup +1
class lifeUp {
  float x;
  float y;
  float d;
  float r;
  float speed;
  float maxdist;

  lifeUp() {
    x=random(0, width);
    y=width/2;
    d=30;
    speed=random(-5,5);
    r=d/2;
    maxdist=r;
  }
  void display() {
    imageMode(CENTER);
    image(marge, x, y, d, d);
    imageMode(CORNER);
    //    noStroke();
    //    fill(0, 0, 255);
    //    ellipse(x, y, d, d);
  }

  void drop() {
    y+=speed;
  }
   boolean lifeIncrease(float mx, float my) {
    if (dist(x, y, mx, my)<=maxdist) {
      print("touch");
      return true;
    }
    else {
      return false;
    }
  }
}

