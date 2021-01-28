color c1, c2, c3;

void setup(){
  size(800, 800);
  c1 = color(random(255), random(255), random(255));
  c2 = color(random(255), random(255), random(255));
}

void draw(){
  background(255);
  float h = height/(float)11;
  int n = 0;
  for(float i=0; i<1.1; i+=0.1){
    c3 = lerpColor(c1, c2, i);
    fill(c3); 
    rect(0, h*n, width, h);
    fill(0); text(i, width/2, h*(n+1) - h/2);
    n++;
  }
}

void mousePressed(){
  c1 = color(random(255), random(255), random(255));
  c2 = color(random(255), random(255), random(255));
}
