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
    //    x=mouseX-50;
    if (keyPressed) {
      if (key == 'a' || key == 'A') {
        x-=5;
      }
      if (key == 'd' || key == 'D') {
        x+=5;
      }
    }
  }
}


//fix the index error if it shows up again

