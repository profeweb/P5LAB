import processing.sound.*;

// variable de so
SoundFile so1;

void setup(){
  size(800, 800);
  
  // Constructor del so
  so1 = new SoundFile(this, "saxo.wav");
}

void draw(){
  if(so1.isPlaying()){
    background(255, 255, 0);
  }
  else {
    background(255);
  }
  
  // Calcula la distància del mouse al centre del botó
  float d1 = dist(width/2, height/2, mouseX, mouseY);
  
  // Si el cursor està a sobre del botó
  if(d1<125) {
    fill(255, 0, 0); cursor(HAND);
  }
  else {
    fill(100); cursor(ARROW);
  }
  stroke(0); strokeWeight(10);
  ellipse(width/2, height/2, 250, 250);
}

// En pitjar el mouse:
void mousePressed(){
  // Distancia del mouse al centre del botó
  float d1 = dist(width/2, height/2, mouseX, mouseY);
  
  // Si està a sobre del botó
  if(d1<125){
    if(so1.isPlaying()){
      so1.stop();
    }
    else{
      so1.play();
    }
  }
  
}

// En pitjar el teclat:
void keyPressed(){
  // Fer play en pitjar la tecla P
  if(key=='p' || key=='P'){
    so1.play();
  }
  // Fer stop en pitjar la tecla S
  else if(key=='s' || key=='S'){
    so1.stop();
  }
}
