void setup(){
  size(800, 800);
  stroke(0); 
}

void draw(){
  background(255);
  branca(width/2, height-100, 100, 270);
}

void branca(float x, float y, float l, float ang){
  float x2 = x + l*cos(radians(ang));
  float y2 = y + l*sin(radians(ang));
  line(x, y, x2, y2);
  if(l>40){
    float a = map(mouseX, 0, width, 0, 90);
    branca(x2, y2, l - 10, ang - a);
    branca(x2, y2, l - 10, ang + a);
  }
}
