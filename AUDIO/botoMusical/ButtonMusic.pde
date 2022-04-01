import processing.sound.*;

class ButtonMusic {
  
  // Atributs
  float x, y, r;
  SoundFile so;
  color c1, c2;
  
  ButtonMusic(float x, float y, float r, 
              String s, PApplet p, color c1, color c2){ 
       this.x = x; this.y = y;
       this.r = r; 
       this.c1 = c1; this.c2 = c2;
       this.so = new SoundFile(p, s);
  }
  
  void display(){
    fill(this.c1);
    stroke(0); strokeWeight(4);
    circle(this.x, this.y, 2*this.r);
  }
  
  boolean mouseOver(){
    float d = dist(this.x, this.y, mouseX, mouseY);
    if(d<this.r){ return true; }
    else { return false; }
    // return d<this.r;
  }
  
  void play(){
    so.play();
  }
  
  
}
