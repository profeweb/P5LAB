


void setup(){
  size(600,600);
  strokeWeight(3);
  background(255);
  noFill();
}

void draw(){
  
  float c1x = width/2;
  float c1y = height/2 - 20*sqrt(2);

  float c2x = width/2 + 20*sqrt(2);
  float c2y = height/2 + 20*sqrt(2);

  float c3x = width/2 - 20*sqrt(2);
  float c3y = height/2 + 20*sqrt(2);

  int step = 20;
  
  for(int t =0; t<50; t++){
    triangle(c1x, c1y, c2x, c2y, c3x, c3y); 
    c1y -= step;
    c2x += step; c2y += step;
    c3x -= step; c3y += step;
  }
  
}
