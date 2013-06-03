//This is for the bullets.

class bullet {
  float maggielength=30;
  float maggieheight=30;
  float x;
  float y;
  float yspeed=10;
  float MaggieCenterX;
  float MaggieCenterY;
  bullet() {
    x=mycharacter.x+mycharacter.homerlength/2-maggielength/2;
    y=mycharacter.y;
  }
  void display() {
    image(maggie, x, y, maggielength, maggieheight);
    MaggieCenterX=(x+maggielength)/2;
    MaggieCenterY=(y+maggieheight)/2;
  }
  void move() {
    y-=yspeed;
    x=x;
  }
}

