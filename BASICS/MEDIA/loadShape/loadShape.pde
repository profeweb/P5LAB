PShape s;

void setup(){
  size(800,800);
  s = loadShape("monster.svg");
}


void draw(){
  float v = map(mouseX, 0, width, 0, 255);
  background(v, 100, 50);
  shape(s, 0, 0, width, height);
}
