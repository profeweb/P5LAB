
int n = 1000;

void setup(){
  size(1600,800);
  background(255);
  strokeWeight(0.5);
  noLoop();
}


void draw(){
  
  for(int i=0; i<n; i++){
    float r = random(0, width);
    stroke(0);
    line(r, 0, r, height/2);
    
    float g = map(randomGaussian(), -2, 2, 0, 1)*width;
    stroke(0,255,0);
    line(g, height/2, g, height);
  }
  
  
}
