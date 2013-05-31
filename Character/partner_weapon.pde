//This is for the bullets.

class partnerbullet {
  float stewielength=30;
  float stewieheight=30;
  float x;
  float y;
  float yspeed=10;
  float xcenter;
  float ycenter;
  partnerbullet() {
    x=mypartner.x+mypartner.peterlength/2-stewielength/2;
    y=mypartner.y+mypartner.peterheight;
  }
  void display() {
    image(stewie, x, y, stewielength, stewieheight);
    xcenter=(x+stewielength)/2;
    ycenter=(y+stewieheight)/2;
  }
  void move() {
    y+=yspeed;
  }
}

