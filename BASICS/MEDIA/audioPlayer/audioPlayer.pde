import processing.sound.*;

SoundFile file;
    
void setup() {
  size(640, 360);
  background(255);
  smooth(16);

  file = new SoundFile(this, "jazz.wav");
  file.play();
}


void draw() {
  background(255);
  
  if(file.isPlaying()){
    fill(0,255,0); noStroke();
    ellipse(50,50,20,20);
    text("Playing ...", 100, 50);
  }
  else {
    fill(255,0,0); noStroke();
    ellipse(50,50,20,20);
    text("Not playing ...", 100, 50);
  }
  
  stroke(0);
  strokeWeight(8);
  strokeCap(ROUND);
  line(50, height/2, width-50, height/2);
  
  strokeWeight(2);
  stroke(255,0,0);
  float lineLength = 50 + (width-100)* file.position()/file.duration();
  line(50, height/2, lineLength, height/2);
  
  println(file.duration());
  
}

void keyPressed() {
  if(key=='s' || key=='S'){
    file.stop();
  }
  else if(key=='p' || key=='P'){
    file.play();
  }
  else if(key=='a' || key=='A'){
    file.pause();
  }
  else if(key=='l' || key=='L'){
    file.loop();
  }
}
