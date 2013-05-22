//This object will shoot the weapon
class character {
  float w=100;
  float h=25;
  float x=width/2; 
  float y=height-h/2;
  color c = color(0, 255, 0);
  character() {
  }
  void display() {
    x=mouseX;
    fill(c);
    rectMode(CENTER);
    rect(x, y, w, -h);
  }
}

