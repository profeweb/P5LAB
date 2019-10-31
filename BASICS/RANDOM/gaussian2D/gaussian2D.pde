int n = 100000;


void setup(){
  size(800,800);
  background(255);
  noLoop();
}


void draw(){
  
  for(int i=0; i<n; i++){  
    float xg = map(randomGaussian(), -2, 2, 0, 1)*width;
    float yg = map(randomGaussian(), -2, 2, 0, 1)*height;
    stroke(0,255,0);
    point(xg, yg);
  }
  
}
