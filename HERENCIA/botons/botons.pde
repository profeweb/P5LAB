BotoCircular bc;

void setup(){
  size(800,800);
  bc = new BotoCircular(400,400, 100, 100, "OK", color(255, 0, 0));
}


void draw(){
  background(255);
  bc.display();
}
