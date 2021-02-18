import processing.sound.*;

SoundFile so1, so2;

void setup(){
  size(800, 800);
  so1 = new SoundFile(this, "clap.wav");
  so2 = new SoundFile(this, "saxo.wav");
}

void draw(){
  if(so1.isPlaying() || so2.isPlaying()){
    background(255, 255, 0);
  }
  else {
    background(255);
  }
  float d1 = dist(width/3, height/2, mouseX, mouseY);
  if(d1<125) {
    fill(255, 0, 0); cursor(HAND);
  }
  else {
    fill(100); cursor(ARROW);
  }
  stroke(0); strokeWeight(10);
  ellipse(width/3, height/2, 250, 250);
  
  
  float d2 = dist(2*width/3, height/2, mouseX, mouseY);
  if(d2<125) {
    fill(255, 0, 0); cursor(HAND);
  }
  else {
    fill(100); cursor(ARROW);
  }
  ellipse(2*width/3, height/2, 250, 250);
}

void mousePressed(){
  float d1 = dist(width/3, height/2, mouseX, mouseY);
  if(d1<125){
    if(so1.isPlaying()){
      so1.stop();
    }
    else{
      so1.play();
    }
  }
  
  float d2 = dist(2*width/3, height/2, mouseX, mouseY);
  if(d2<125){
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
