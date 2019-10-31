
int numPoints= 0;

float x1, y1;    // Original A coordinates
float x2, y2;    // Original B coordinates
float x3, y3;    // Original C coordinates

float xr, yr;    // Pivot point coordinates

float x1r, y1r;  // Reflected A coordinates
float x2r, y2r;  // Reflected B coordinates
float x3r, y3r;  // Reflected C coordinates

boolean reflectionEnabled = false;
int reflectionMode = 0;  // 0: reflect X, 1: reflect Y, 2: reflect Y=X

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
    // Display position of reflection axis
    fill(0,0,255); stroke(0,0,255);
    if(reflectionMode==0){
      line(xr,0,xr, height);
      text("REFLECTION AXIS Y", xr+20, yr+20);
    }
    else if(reflectionMode==1){
      line(0,yr,width, yr);
      text("REFLECTION AXIS X", xr+20, yr+20);
    }
    else if(reflectionMode==2){
      line(xr + width*cos(radians(135)), yr + width*sin(radians(135)),xr + width*cos(radians(315)), yr + width*sin(radians(315)));
      text("REFLECTION AXIS Y=X", xr+20, yr+20);
    }
    
  }
  
  if(reflectionEnabled){
    
   
    // Calculate reflected coordinates for A, B and C. 
    
    // Reflection Y
    if(reflectionMode==0){
      x1r = x1 + (xr-x1)*2;
      y1r = y1;
      x2r = x2 + (xr-x2)*2;
      y2r = y2;
      x3r = x3 + (xr-x3)*2;
      y3r = y3;
    }
    // Reflection X
    else if(reflectionMode==1){
      x1r = x1;
      y1r = y1 + (yr-y1)*2;
      x2r = x2;
      y2r = y2 + (yr-y2)*2;
      x3r = x3;
      y3r = y3 + (yr-y3)*2;
    }
    // Reflection Y = X
    else if(reflectionMode==2){
      x1r = x1 + 2*(xr - x1);
      y1r = y1 + 2*(yr - y1);
      x2r = x2 + 2*(xr - x2);
      y2r = y2 + 2*(yr - y2);
      x3r = x3 + 2*(xr - x3);
      y3r = y3 + 2*(yr - y3);
    }
    
    
    // Display scaled coordinates for A, B and C.
    
    fill(255,0,0); stroke(255,0,0);
    text("As", x1r+20, y1r+20);
    ellipse(x1r,y1r,20,20);
    text("Bs", x2r+20, y2r+20);
    ellipse(x2r,y2r,20,20);
    text("Cs", x3r+20, y3r+20);
    ellipse(x3r,y3r,20, 20);
    
    // Lines between scaled coordinates
    line(x1r,y1r,x2r,y2r);
    line(x2r,y2r,x3r,y3r);
    line(x3r,y3r,x1r,y1r);
    
    // Lines between original and scaled points.
    stroke(0,255,0,100);
    line(x1, y1, x1r,y1r);
    line(x2,y2,x2r,y2r);
    line(x3,y3,x3r,y3r);
    
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
  else if(numPoints==4 && !reflectionEnabled){
     text("Type 'R' to perform reflection", 50, 50);
  }
  else if(reflectionEnabled){
    text("Press on the screen to define the reflection axis.\nType 'A' to reset the transformation.", 50, 50);
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
    reflectionEnabled = true;
  }
  else if(key=='a' || key=='A'){
    reflectionEnabled = false;
    numPoints=0;
  }
  else if(key=='m' || key=='M'){
    reflectionMode = (reflectionMode+1)%3;
  }
}
