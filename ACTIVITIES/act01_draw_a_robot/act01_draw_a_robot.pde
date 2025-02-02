int  x = 160; // x coordinate
int  y = 420; // y coordinate
int  bodyHeight = 110; // Body height
int  neckHeight = 40; // Neck height
int  radius = 45;   // Radius head
int  ny = y - bodyHeight - neckHeight - radius; // Neck Y


void setup() {
 size(300, 480);
 strokeWeight(2);
 ellipseMode(RADIUS);
}

void drawNeck(){
 // Neck
 stroke(102);
 line(x + 2, y - bodyHeight, x + 2, ny);
 line(x + 12, y - bodyHeight, x + 12, ny);
 line(x + 22, y - bodyHeight, x + 22, ny);
}

void drawAntenna(){
 // Antennae
 line(x + 12, ny, x - 18, ny - 43);
 line(x + 12, ny, x + 42, ny - 99);
 line(x + 12, ny, x + 78, ny + 15);
}

void drawBody(){
 // Body
 noStroke();
 fill(102);
 ellipse(x, y - 33, 33, 33);
 fill(0);
 rect(x - 45, y - bodyHeight, 90, bodyHeight - 33);
 fill(102);
 rect(x - 45, y - bodyHeight + 17, 90, 6);
}

void drawHead(){
 // Head
 fill(0);
 ellipse(x + 12, ny, radius, radius);
 fill(255);
 ellipse(x + 24, ny - 6, 14, 14);
 fill(0);
 ellipse(x + 24, ny - 6, 3, 3);
 fill(153);
 ellipse(x, ny - 8, 5, 5);
 ellipse(x + 30, ny - 26, 4, 4);
 ellipse(x + 41, ny + 6, 3, 3);
}

void drawRobot(){
 drawNeck();
 drawAntenna();
 drawBody();
 drawHead();
}

void draw() {
 background(204);
 drawRobot();
 
 fill(255, 0, 0);
 circle(x, y, 10);
}
