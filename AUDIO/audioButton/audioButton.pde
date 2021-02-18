import processing.sound.*;

SoundFile so1, so2;

void setup(){
  size(800, 800);
  so1 = new SoundFile(this, "clap.wav");
  so2 = new SoundFile(this, "saxo.wav");
}

void draw(){
  if(so2.isPlaying()){
    background(255, 255, 0);
  }
  else {
    background(255);
  }
  float d = dist(width/2, height/2, mouseX, mouseY);
  if(d<150) {
    fill(255, 0, 0); cursor(HAND);
  }
  else {
    fill(100); cursor(ARROW);
  }
  stroke(0); strokeWeight(10);
  ellipse(width/2, height/2, 300, 300);
}

void mousePressed(){
  float d = dist(width/2, height/2, mouseX, mouseY);
  if(d<150){
    if(so2.isPlaying()){
      so2.stop();
    }
    else{
      so2.play();
    }
  }
}

void keyPressed(){
  if(key=='p' || key=='P'){
    so2.play();
  }
  else if(key=='s' || key=='S'){
    so2.stop();
  }
}
