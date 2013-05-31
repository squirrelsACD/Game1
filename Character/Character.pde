//This object will shoot the weapon
class character {
  float homerlength=100;
  float homerheight=100;
  float x=width/2; 
  float y=650;
  character() {
  }
  void display() {
    image(homer, x, y, homerlength, homerheight);
    if (keyPressed) {
      if (key == 'a' || key == 'A') {
        if (x>=0) {
          x-=5;
        }
      }
      if (key == 'd' || key == 'D') {
        if (x+homerlength<=width) {
          x+=5;
        }
      }
    }
  }
}




//fix the index error if it shows up again

