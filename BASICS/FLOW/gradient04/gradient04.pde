void setup(){
  size(800,800);
  background(255);
  colorMode(HSB, 255);
  strokeWeight(8);
  noFill();
}

void draw(){
  float angleStep = 0.01;
  float radius = 300;
  for(float angle=0.0; angle<=TWO_PI; angle+=angleStep){
    
    float x = width/2 + radius*cos(angle);
    float y = height/2 + radius*sin(angle);
    
    float nextX = width/2 + radius*cos(angle+angleStep);
    float nextY = height/2 + radius*sin(angle+angleStep);
    
    stroke(angle/TWO_PI*255.0, 255, 255);
    line(x, y, nextX, nextY); 
  }
}
