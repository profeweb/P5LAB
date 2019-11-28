
int numPoints = 4;
int currentPoint = 0;

float x, y;

float[] xPoints = {400, 40, 400, 760};
float[] yPoints = {40, 400, 760, 400};

float startX, startY;
float stopX, stopY;

float step = 0.01;
float p = 0.0;

void setup(){
  size(800,800);
  frameRate(30);
  
  startX = xPoints[currentPoint]; 
  startY = yPoints[currentPoint];
  
  stopX  = xPoints[currentPoint + 1]; 
  stopY  = yPoints[currentPoint + 1];
}


void draw(){
  
  background(255);
  
  for(int i=0; i<xPoints.length; i++){
    fill(0);
    ellipse(xPoints[i], yPoints[i], 10, 10);
  }
  
  x = startX + (stopX - startX)*p;
  y = startY + (stopY - startY)*p;
  
  fill(255,0,0); strokeWeight(4);
  ellipse(x, y, 40, 40);
  
  if(p<=1){
    p+=step;
  }
  else {
    p=step;
    currentPoint++;
    currentPoint = currentPoint % numPoints;
    startX = xPoints[currentPoint]; startY = yPoints[currentPoint];
    stopX  = xPoints[(currentPoint + 1)%numPoints]; stopY  = yPoints[(currentPoint + 1)%numPoints];
    
    
  }
  
}
