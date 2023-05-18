class BotoCircular extends Boto {
  
  BotoCircular(float x, float y, float w, float h, String t, color c){
    super( x,  y,  w,  h,  t,  c);
  }
  
  void display(){
    fill(c);
    ellipseMode(CENTER);
    ellipse(x, y, w, h);
    
    fill(0); textAlign(CENTER); textSize(24);
    text(txt, x, y);
  }
  
}
