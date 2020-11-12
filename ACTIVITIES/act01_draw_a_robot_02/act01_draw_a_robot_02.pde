int  x = 400;    // x coordinate
int  y = 400;    // y coordinate

int bodyHeight = 300;
int bodyWidth  = 100;

int headRadius = 50;
int neckHeight = 50;

void setup() {
 size(800, 800);
}

void draw() {
 background(204);
 drawRobot();
}

void drawRobot(){
  fill(0);
  rectMode(CENTER);
  rect(x, y, bodyWidth, bodyHeight);
  line(x, y - bodyHeight/2, x, y- bodyHeight/2 - neckHeight);
}
