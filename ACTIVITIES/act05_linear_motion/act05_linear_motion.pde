int x, y;
int xStep = 1;
float direction = 1.0;

PImage img;

void setup() {
  size(800, 500);
  img = loadImage("duck.png");
  x=width/2; y =height/2;
}

void draw() {
  background(50,50,255);
  noFill();
  rect(0,0,width-1, height-1);
  strokeWeight(3); stroke(255,200);
  line(0, height/2+100, width, height/2+100);
  resetPosition();
  updatePosition();
  drawDuck();
}

void drawDuck(){
  translate(x, y);
  scale(-0.5*direction,0.5);
  image(img, 0, 0);
}

void updatePosition(){
  x+= xStep*direction;
  if(x>width){
    x=width-150;
    direction=-1.0;
  }
  else if(x<0){
    x=150;
    direction=1.0;
  }
}  

void mousePressed(){
  resetPosition();
}
    


void resetPosition(){
    x = mouseX;
    y = mouseY;
}
