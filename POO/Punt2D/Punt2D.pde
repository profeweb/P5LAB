Punt p1, p2;
color c1, c2;

void setup(){
  
  size(800,800);
  
  p1 = new Punt("A", 400, 250);
  p1.setX(350);
  p1.setNom("a");
  p1.print();

  p2 = new Punt("B", 500, 650);
  p2.print();
  
  c1 = color(255, 0, 0);
  c2 = color(0, 0, 255);
}


void draw(){
  background(255);
  p1.display(c1);
  p2.display(c2);
}

void keyPressed(){
  if(keyCode==LEFT){
    float x = p1.getX() - 10;
    p1.setX(x);
  }
  else if(keyCode==RIGHT){
    float x = p1.getX() + 10;
    p1.setX(x);
  }
}
