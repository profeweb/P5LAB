int n = 100000;


void setup(){
  size(800,800);
  background(255);
  noLoop();
}


void draw(){
  
  for(int i=0; i<n; i++){
    float xr = random(0, width);
    float yr = random(0, height);
    stroke(255,0,0);
    point(xr, yr);
  }
  
}
