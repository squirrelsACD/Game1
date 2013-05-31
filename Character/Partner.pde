//This object will shoot the weapon
class partner {
  float peterlength=100;
  float peterheight=100;
  float x=width/2; 
  float y=0;
  partner() {
  }
  void display() {
    image(peter, x, y, peterlength, peterlength);
    if (keyPressed) {
      if (key == '4') {
        if (x>=0) {
          x-=5;
        }
      }
      if (key == '6') {
        if (x+peterlength<=width) {
          x+=5;
        }
      }
    }
  }
}


