enum CICLE {ANADA, TORNADA};

class PressioVolum {

  int num;
  CICLE cicle;
  float pressio;
  float volum;
  
  boolean mouseOver = false;

  PressioVolum(int n, float v, float p, CICLE c) {
    this.num = n;
    this.volum = v;
    this.pressio = p;
    this.cicle = c;
  }
  
  void display(float sX, float sY) {
    pushMatrix();
    translate(volum*sX, -pressio*sY);
    pushStyle();
    if(this.cicle == CICLE.ANADA){
      fill(255, 0, 0);
    }
    else {
      fill(0, 0, 255);
    }
    if(mouseOver){
      fill(0);
    }
    ellipse(0, 0, 10, 10);
    textAlign(CENTER);
    text(toString(), 20, 0);
    popStyle();
    popMatrix();
  }

  void displayLine(PressioVolum altre, float sX, float sY) {
    pushMatrix();
    stroke(255, 0, 0);
    line(this.volum*sX, -this.pressio*sY, altre.volum*sX, -altre.pressio*sY);
    popMatrix();
  }
  
  String toString(){
    return "P"+num+"\n("+pressio+", "+volum+")";
  }
  
  boolean mouseOver(float x0, float y0, float sX, float sY){
    return dist(x0 + this.volum*sX, y0 -this.pressio*sY, mouseX, mouseY)<50;
  }
}
