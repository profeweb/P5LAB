Fletxa f;

void setup(){
  size(800, 800);
}

void draw(){
  background(255);
  f = new Fletxa(200, 200, mouseX, mouseY);
  f.display(color(255, 0, 0));
  println(f.angle());
}
