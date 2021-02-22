import processing.sound.*;

SoundFile so1, so2;

SoundButton sb1, sb2;

color c1 = color(255, 0, 0);
color c2 = color(100);

void setup(){
  size(800, 800);
  so1 = new SoundFile(this, "clap.wav");
  so2 = new SoundFile(this, "saxo.wav");
  
  sb1 = new SoundButton(width/3, height/2, 200, so1, c1, c2); 
  sb2 = new SoundButton(2*width/3, height/2, 200, so2, c1, c2);
}
void draw(){
  if(sb1.estaSonant() || sb2.estaSonant()){
    background(255, 255, 0);
  }
  else {
    background(255);
  }
  sb1.dibuixa();
  sb2.dibuixa();
}

void mousePressed(){
  sb1.play();
  sb2.play();
}

void keyPressed(){
  if(key=='p' || key=='P'){
    so2.play();
  }
  else if(key=='s' || key=='S'){
    so2.stop();
  }
}
