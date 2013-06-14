//This is for the bullets.

//Peter's bullets
class partnerbullet {
  float stewielength=30;
  float stewieheight=30;
  float x;
  float y;
  float yspeed=10;
  float StewieCenterX;
  float StewieCenterY;
  float maxdist;

  partnerbullet() {
    x=mypartner.x+mypartner.peterlength/2-stewielength/2;
    y=mypartner.y+mypartner.peterheight;
    maxdist=y/2; 
  }
  void display() {
    image(stewie, x, y, stewielength, stewieheight);
    StewieCenterX=(x+stewielength)/2;
    StewieCenterY=(y+stewieheight)/2;
  }
  void move() {
    y+=yspeed;
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

