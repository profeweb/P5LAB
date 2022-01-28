void setup() {
  size(800, 800);
  background(255);
  colorMode(HSB, 255);
}

void draw() {
  background(255);
  noStroke();
  for(float angle=0; angle<TWO_PI; angle+=0.01){
    float x = width/2 + 300*cos(angle);
    float y = height/2 + 300*sin(angle);
    float h = ((angle / TWO_PI)*255 + frameCount)%255;
    fill(h, 255, 255);
    ellipse(x, y, 50, 50);
  }
}
