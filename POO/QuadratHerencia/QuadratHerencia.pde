

Quadrat q1, q2;

void setup(){
  size(800, 800);
  
  q1 = new Quadrat(new Punt2D(500, 100), 100);
  q2 = new Quadrat(new Punt2D(100, 400), 300);
}

void draw(){
  background(255);
  q1.display(color(100, 200, 100));
  q2.display(color(200, 100, 100));
}
