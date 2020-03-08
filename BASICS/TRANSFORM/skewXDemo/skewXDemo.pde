
int numPoints= 0;

float x1, y1;
float x2, y2;
float x3, y3;

float xt, yt;
float dx, dy;


float x1t, y1t;
float x2t, y2t;
float x3t, y3t;

boolean translatedPoints = false;

void setup(){
  size(1400,800);
  smooth(16);
  strokeCap(ROUND);
}

void draw(){
  background(255);
  displayGrid(20);
  showTextInfo();
  noStroke();
  
  
  
  
  if(numPoints>0){
    fill(0); stroke(0); strokeWeight(3);
    ellipse(x1,y1,20,20);
    text("A", x1+20, y1+20);
  }
  if(numPoints>1){
    ellipse(x2,y2,20,20);
    stroke(0); strokeWeight(3);
    line(x1,y1,x2,y2);
    text("B", x2+20, y2+20);
  }
  if(numPoints>2){
    ellipse(x3,y3,20, 20);
    text("C", x3+20, y3+20);
    stroke(0); strokeWeight(3);
    line(x2,y2,x3,y3);
    line(x3,y3,x1,y1);
  }
  if(numPoints>3){
    fill(255,0,0); stroke(255,0,0);
    ellipse(xt,yt,20, 20);
    text("Ct", xt+20, yt+20);
    stroke(0,255,0,100);
    line(x3,y3,xt,yt);
    
  }
  if(translatedPoints){
    fill(255,0,0); stroke(255,0,0);
    text("At", x1t+20, y1t+20);
    ellipse(x1t,y1t,20,20);
    text("Bt", x2t+20, y2t+20);
    ellipse(x2t,y2t,20,20);
    ellipse(x3t,y3t,20, 20);
    line(x1t,y1t,x2t,y2t);
    line(x2t,y2t,x3t,y3t);
    line(x3t,y3t,x1t,y1t);
    
    stroke(0,255,0,100);
    line(x1, y1, x1t,y1t);
    line(x2,y2,x2t,y2t);
  }
}


void showTextInfo(){
  fill(0); textSize(20);
  if(numPoints==0){
     text("Press on the screen to define the 1st point", 50, 50);
  }
  else if(numPoints==1){
     text("Press on screen to define 2nd point", 50, 50);
  }
  else if(numPoints==2){
     text("Press on the screen to define 3rd point", 50, 50);
  }
  else if(numPoints==3){
     text("Press on the screen to define translation point", 50, 50);
  }
  else if(numPoints==4 && !translatedPoints){
     text("Type 'T' to perform translation", 50, 50);
  }
  else if(translatedPoints){
    text("Points translated dX: "+dx+", dY: "+dy+".", 50, 50);
    text("Type 'R' to reset the transformation.", 50, 80);
  }
    
}


void displayGrid(float w){
  stroke(0,0,255, 50); strokeWeight(0.5);
  for(int i=0; i<width; i+=w){
    line(i,0,i,height);
  }
  for(int i=0; i<height; i+=w){
    line(0,i,width, i);
  }
}


void mousePressed(){
  if(numPoints==0){
    x1 = mouseX; y1 = mouseY; numPoints++;
  }
  else if(numPoints==1){
    x2 = mouseX; y2 = mouseY; numPoints++;
  }
  else if(numPoints==2){
    x3 = mouseX; y3 = mouseY; numPoints++;
  }
  else {
    xt = mouseX; yt = mouseY; numPoints++;
    dx = xt - x3; dy = yt - y3;
  }
  
}

void keyPressed(){
  if(key=='t' || key=='T'){
    println("Skewing original triangle. dX: "+dx+".");
    translatedPoints = true;
    x1t = x1 + dx; y1t = y1 ;
    x2t = x2 + dx; y2t = y2 ;
    x3t = x3 + dx; y3t = y3 ;
  }
  else if(key=='r' || key=='R'){
    translatedPoints = false;
    numPoints=0;
  }
}
