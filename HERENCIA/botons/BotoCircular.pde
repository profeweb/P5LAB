class BotoCircular extends Boto {
  
  BotoCircular(float x, float y, float w, float h, String t, color c){
    super( x,  y,  w,  h,  t,  c);
  }
  
  void display(){
    if(mouseOver()){
      fill(c);
    }
    else {
      fill(200);
    }
    ellipseMode(CENTER);
    ellipse(x, y, w, h);
    
    fill(0); textAlign(CENTER); textSize(24);
    text(txt, x, y + 12 );
  }
  
  boolean mouseOver(){    
     return (dist(x, y, mouseX, mouseY)<=w/2);
  }
  
}
