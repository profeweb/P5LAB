Boto[] botons;
int numBotons = 0;

color bgColor;

void setup(){
  size(800,800);
  botons = new Boto[5];
  bgColor = color(255);
}


void draw(){
  background(bgColor);
  for(int i=0; i<numBotons; i++){
    botons[i].display();
  }
  updateCursor();
}

void updateCursor(){
}

void keyPressed(){
  Boto b;
  if(random(1)<0.5){
    b = new BotoRectangular(random(width), random(height), 200, 100, String.valueOf(numBotons), color(255, 0, 0)); 
  }
  else{
    b = new BotoCircular(random(width), random(height), 200, 200, String.valueOf(numBotons), color(255, 255, 0)); 
  }
  botons[numBotons] = b;
  numBotons++;
}

void mousePressed(){
  /*
  if(bc.mouseOver() || br.mouseOver()){
    bgColor = color(random(255), random(255), random(255));
  }
  */
}
