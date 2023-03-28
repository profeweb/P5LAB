class RoundButton extends Button {
  
  String info;
  
  RoundButton(float x, float y, float w, float h, color c, String t){
    super(x, y, w, h, c);
    this.info = t;
  }
  
  void display(){
    fill(c);
    if(mouseDins()){
      strokeWeight(5);
    }
    else {
      strokeWeight(1);
    }
    circle(x, y, w);
    fill(0); textSize(24); textAlign(CENTER);
    text(info, x, y+12);
  }
  
  boolean mouseDins(){
    float d = dist(mouseX, mouseY, x, y);
    return d<= w/2;
  }
  
}
