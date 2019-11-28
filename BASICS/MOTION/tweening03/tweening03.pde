
int numPoints = 0;
int numMaxPoints = 10;
int currentPoint = 0;

float x, y;
float[] xPoints;
float[] yPoints;

float startX, startY;
float stopX, stopY;

boolean startMotion = false;
float step = 0.01;
float p = 0.0;

void setup(){
  size(800,800);
  frameRate(30);
  
  xPoints = new float[numMaxPoints];
  yPoints = new float[numMaxPoints];
  
  
}


void draw(){
  
  background(255);
  
  for(int i=0; i<numPoints; i++){
    fill(0);
    ellipse(xPoints[i], yPoints[i], 10, 10);
    text(i, xPoints[i] + 20, yPoints[i] + 20);
  }
  
  
  
  fill(255,0,0); strokeWeight(4);
  ellipse(x, y, 40, 40);
  
  if(startMotion){
    
    x = startX + (stopX - startX)*p;
    y = startY + (stopY - startY)*p;
  
    if(p<=1){
      p+=step;
    }
    else {
      p=step;
      currentPoint++;
      currentPoint = currentPoint % numPoints;
      startX = xPoints[currentPoint]; 
      startY = yPoints[currentPoint];
      stopX  = xPoints[(currentPoint + 1)%numPoints]; 
      stopY  = yPoints[(currentPoint + 1)%numPoints];     
    }
  }
}

void mouseReleased(){
  if(numPoints<numMaxPoints){
    xPoints[numPoints] = mouseX;
    yPoints[numPoints] = mouseY;
    numPoints++;
  }
}
  


void keyPressed(){
  if(key=='s' || key=='S'){
    startMotion = true;
    
    startX = xPoints[currentPoint]; 
    startY = yPoints[currentPoint];
  
    stopX  = xPoints[currentPoint + 1]; 
    stopY  = yPoints[currentPoint + 1];
  }
}
