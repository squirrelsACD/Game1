import ddf.minim.*;

AudioPlayer player;
Minim minim;

void setup(){
  size(200,200);
  minim = new Minim(this);
  player = minim.loadFile("BuildTheRobots.mp3");
  player.play();
}
void draw(){
  background(0);
}
void stop(){
  player.close();
  minim.stop();
  super.stop();
}
  
