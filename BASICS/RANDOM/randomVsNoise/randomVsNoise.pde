
void setup(){
  size(1600,800);
  background(255);
  strokeWeight(2);
  fill(0);
  noLoop();
}


void draw(){
  background(255,50,100);
  
  textSize(18); fill(0);
  text("RANDOM", 10, 40);
  fill(220,50); noStroke();
  rect(0, height/12, width, height/3);
  
  // RANDOM
  float xr0 = 0; 
  float yr0 = height/3;
  for(float xr=0; xr<=width; xr+=10){
    float yr = height/4 + random(-1, 1)*height/6;
    stroke(0); 
    line(xr, yr, xr0, yr0);
    xr0 = xr; yr0 = yr;
  }
  
  fill(0);
  text("NOISE", 10, height-100);
  fill(220,50); noStroke();
  rect(0, 6*height/12, width, height/3);
  
  // NOISE
  float xn0 = 0;
  float yn0 = 2*height/3;
  float xoff = random(100);
  for(float xn=0; xn<=width; xn+=10){
    float yn = 3*height/6 + noise(xoff)*height/3;
    stroke(0);
    line(xn,  yn, xn0, yn0);
    xn0 = xn; yn0 = yn;
    xoff = xoff + 0.1;
  }
  
  noLoop();
}


void mousePressed(){
  redraw();
}
