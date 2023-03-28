class RectButton extends Button {

  int info;

  RectButton(float x, float y, float w, float h, color c, int t) {
    super(x, y, w, h, c);
    this.info = t;
  }

  void display() {
    fill(c);
    rectMode(CENTER);
    if(mouseDins()){
      strokeWeight(5);
    }
    else {
      strokeWeight(1);
    }
    rect(x, y, w, h);
    fill(0); 
    textSize(24); 
    textAlign(CENTER);
    text(info, x, y+12);
  }

  boolean mouseDins() {
    return (mouseX>= x-w/2 && mouseX<=x+w/2 && 
            mouseY>=y-h/2 && mouseY<=y+h/2);
  }
}
