Monigote m1, m2;

void setup() {
  size(800, 800);
  m1 = new Monigote();
  m2 = new Monigote();
}

void draw() {
  background(255);
  m1.dibuixa();
  m2.dibuixa();
  
  fill(0); textSize(36); text(m1.numFrame, 50, 50);
  m1.mou();
  m2.mou();

}

void keyPressed() {
  if (key=='m' || key=='M') {
    m1.motionEnabled = !m1.motionEnabled;
  }
  else if (key=='p' || key=='P') {
    m2.motionEnabled = !m2.motionEnabled;
  }
  else if(keyCode==LEFT){
    m1.x-=10;
  }
  else if(keyCode==RIGHT){
    m1.x+=10;
  }
  else if(keyCode==UP){
    m2.x-=10;
  }
  else if(keyCode==DOWN){
    m2.x+=10;
  }
}
