
int numPoints= 0;

float x1, y1;    // Original A coordinates
float x2, y2;    // Original B coordinates
float x3, y3;    // Original C coordinates

float xr, yr;    // Pivot point coordinates
float a= 0;      // Rotation angle


float x1r, y1r;  // Rotated A coordinates
float x2r, y2r;  // Rotated B coordinates
float x3r, y3r;  // Rotated C coordinates

boolean rotationEnabled = false;

void setup(){
  size(1400,800);
  smooth(16);
  strokeCap(ROUND);
}

void draw(){
  
  background(255);
  displayGrid(20);
  displayAxis();
  showTextInfo();
  
  if(numPoints>0){
    // Display position of original point A
    fill(0); stroke(0); strokeWeight(3);
    ellipse(x1,y1,20,20);
    text("A", x1+20, y1+20);
  }
  if(numPoints>1){
    // Display position of original point B
    // and line between A and B
    ellipse(x2,y2,20,20);
    stroke(0); strokeWeight(3);
    line(x1,y1,x2,y2);
    text("B", x2+20, y2+20);
  }
  if(numPoints>2){
    // Display position of original point C
    // and lines between A and C, B and C.
    ellipse(x3,y3,20, 20);
    text("C", x3+20, y3+20);
    stroke(0); strokeWeight(3);
    line(x2,y2,x3,y3);
    line(x3,y3,x1,y1);
  }
  if(numPoints>3){
    // Display position of pivot point
    fill(0,0,255); stroke(0,0,255);
    ellipse(xr,yr,20, 20);
    text("PIVOT", xr+20, yr+20);
    
  }
  
  if(rotationEnabled){
    
    // Get current rotation angle 
    
    a = map(mouseX, 0, width, 0, TWO_PI);  
    
    // Calculate rotated coordinates for A, B and C. 
    
    x1r = xr + (x1-xr)*cos(a) - (y1-yr)*sin(a);
    y1r = yr + (x1-xr)*sin(a) + (y1-yr)*cos(a);
    
    x2r = xr + (x2-xr)*cos(a) - (y2-yr)*sin(a);
    y2r = yr + (x2-xr)*sin(a) + (y2-yr)*cos(a);
    
    x3r = xr + (x3-xr)*cos(a) - (y3-yr)*sin(a);
    y3r = yr + (x3-xr)*sin(a) + (y3-yr)*cos(a);
    
    
    // Display rotated coordinates for A, B and C.
    
    fill(255,0,0); stroke(255,0,0);
    text("At", x1r+20, y1r+20);
    ellipse(x1r,y1r,20,20);
    text("Bt", x2r+20, y2r+20);
    ellipse(x2r,y2r,20,20);
    text("Ct", x3r+20, y3r+20);
    ellipse(x3r,y3r,20, 20);
    
    // Lines between rotated coordinates
    line(x1r,y1r,x2r,y2r);
    line(x2r,y2r,x3r,y3r);
    line(x3r,y3r,x1r,y1r);
    
    // Lines between original and rotated points.
    stroke(0,255,0,100);
    line(x1, y1, x1r,y1r);
    line(x2,y2,x2r,y2r);
    line(x3,y3,x3r,y3r);
    
    // Angle arc
    
    noStroke();
    arc(100, 150, 50, 50, 0, a);
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
     text("Press on the screen to define pivot point", 50, 50);
  }
  else if(numPoints==4 && !rotationEnabled){
     text("Type 'R' to perform rotation", 50, 50);
  }
  else if(rotationEnabled){
    String dg = nf(degrees(a), 3, 2);
    text("Points rotated ANGLE: "+dg+" degrees.", 50, 50);
    text("Type 'A' to reset the transformation.", 50, 80);
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

void displayAxis(){
  stroke(255,0,0);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
}


void mousePressed(){
  if(numPoints==0){
    x1 = mouseX; y1 = mouseY; 
  }
  else if(numPoints==1){
    x2 = mouseX; y2 = mouseY;
  }
  else if(numPoints==2){
    x3 = mouseX; y3 = mouseY;
  }
  else {
    xr = mouseX; yr = mouseY;
  }
  numPoints++;
}

void keyPressed(){
  if(key=='r' || key=='R'){
    rotationEnabled = true;
  }
  else if(key=='a' || key=='A'){
    rotationEnabled = false;
    numPoints=0;
  }
}
