int n = 100000;


void setup(){
  size(800,800);
  background(255);
  noLoop();
}


void draw(){
  
  for(int i=0; i<n; i++){
    float xr = random(0, width);
    float yr = random(0, height/2);
    stroke(255,0,0);
    point(xr, yr);
    
    float xg = map(randomGaussian(), -2, 2, 0, 1)*width;
    float yg = height/2 + map(randomGaussian(), -2, 2, 0, 1)*height/2;
    stroke(0,255,0);
    point(xg, yg);
  }
  
}
