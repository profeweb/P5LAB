class SoundButton {
  
  float x, y, d;
  SoundFile so;
  color cMouseOn, cMouseOut;
  
  SoundButton(float x, float y, float d, SoundFile s, 
              color c1, color c2){
    this.x = x;
    this.y = y;
    this.d = d;
    this.so = s;
    this.cMouseOn = c1;
    this.cMouseOut = c2;
  }
  
  void dibuixa(){
    float d = dist(this.x, this.y , mouseX, mouseY);
    if(d<this.d/2) {
      fill(this.cMouseOn); cursor(HAND);
    }
    else {
      fill(this.cMouseOut); cursor(ARROW);
    }
    stroke(0); strokeWeight(10);
    ellipse(this.x, this.y, this.d, this.d);
  }
  
  void play(){
    float d = dist(this.x, this.y, mouseX, mouseY);
    if(d<this.d/2){
      if(this.so.isPlaying()){
        this.so.stop();
      }
      else{
        this.so.play();
      }
    }
  }
  
  boolean estaSonant(){
    return this.so.isPlaying();
  }
}
