
float minSize = 50;
float maxSize = 200;

void setup() {
  size(800, 800);
  background(255,0,0);
  noStroke();
  noLoop();
}

void draw() {
  for(int i=0; i<80; i++){
    float x = random(width);
    float y = random(height);
    int s = (int)random(minSize, maxSize);
    color c = lerpColor(color(0), color(255), (s-minSize)/((float)maxSize-minSize));
    drawCircle(x, y, s, c);
  }
}


float areaCircle(float radius){
  float a = PI*radius*radius;
  return a;
}

void drawCircle(float xloc, float yloc, float r, color c) {
  fill(c);
  ellipse(xloc, yloc, r, r);
}
