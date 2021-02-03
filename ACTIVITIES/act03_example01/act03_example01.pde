float r;
float t;
float h;

void setup(){
 size(800,800);
 background(0);
 colorMode(HSB);
}

void draw(){
  translate(width/2, height/2);
  rotate(r);
  
  h = map(r%TWO_PI, 0, TWO_PI, 0, 255);
  fill(h, 255, 255);
  strokeWeight(2);
  rect(0, 0, t, t);
  
  r+= 0.1;
  t+= 0.5;
}
