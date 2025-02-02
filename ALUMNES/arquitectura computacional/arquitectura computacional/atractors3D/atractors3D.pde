import peasy.*;

PeasyCam cam;

// initial parameters
int xCount = 51;
int yCount = 51;
float gridSize = 600;

// nodes array 
Node[][] myNodes = new Node[xCount][yCount];

// attractor
Attractor myAttractor;


void setup() {  
  size(1920, 800, P3D); 
  cam = new PeasyCam(this, 1200);
  smooth();
  noStroke();
  fill(0);

  background(255); 

  cursor(CROSS);

  // setup node grid
  initGrid();

  // setup attractor
  myAttractor = new Attractor(0, 0);
  myAttractor.strength = -10;
  myAttractor.ramp = 1;
}

void draw() {

  background(255);
  lights();

  myAttractor.x = mouseX;
  myAttractor.y = mouseY;

  cam.beginHUD();
  for (int c = 0; c < myNodes.length; c++) {
    for (int r = 0; r < myNodes[c].length; r++) {
      if (mousePressed) {
        myAttractor.attract(myNodes[c][r]);
      }
      myNodes[c][r].update();
      line(myNodes[c][r].x-5, myNodes[c][r].y, myNodes[c][r].x+5, myNodes[c][r].y);
      line(myNodes[c][r].x, myNodes[c][r].y-5, myNodes[c][r].x, myNodes[c][r].y+5);
    }
  }
  cam.endHUD();
  
  
  pushMatrix();
  translate(-width/6, -height/2, 0);
  rotateX(PI/4);
  scale(1.5);
  stroke(1); fill(100);
  for (int c = 0; c < myNodes.length-1; c++) {
    //beginShape(TRIANGLE_STRIP);
    beginShape(QUAD_STRIP);
    for (int r = 0; r < myNodes[c].length-1; r++) {
      vertex(myNodes[c][r].x, myNodes[c][r].y, myNodes[c][r].z); 
      vertex(myNodes[c+1][r].x, myNodes[c+1][r].y, myNodes[c+1][r].z);
     }
     endShape();
  }
  popMatrix();
}


void initGrid() {
  int i = 0; 
  for (int y = 0; y < yCount; y++) {
    for (int x = 0; x < xCount; x++) {
      float xPos = x*(gridSize/(xCount-1)) + 50; //+(width-gridSize)/2;
      float yPos = y*(gridSize/(yCount-1)) + 100; //+(height-gridSize)/2;
      myNodes[x][y] = new Node(xPos, yPos);
      //myNodes[i].setBoundary(0, 0, width, height);
      myNodes[x][y].setDamping(0.8);  //// 0.0 - 1.0
      i++;
    }
  }
}


void keyPressed() {
  if (key=='r' || key=='R') {
    initGrid();
  }
}
