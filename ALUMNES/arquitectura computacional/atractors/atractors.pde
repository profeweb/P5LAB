

// initial parameters
int xCount = 121;
int yCount = 121;
float gridSize = 600;

// nodes array 
Node[][] myNodes = new Node[xCount][yCount];

// attractor
Attractor myAttractor;


void setup() {  
  size(800, 800); 
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

  myAttractor.x = mouseX;
  myAttractor.y = mouseY;

  for (int c = 0; c < myNodes.length; c++) {
    for (int r = 0; r < myNodes[c].length; r++) {
      if (mousePressed) {
        myAttractor.attract(myNodes[c][r]);
      }
      myNodes[c][r].update();
  
      // draw nodes
  
        rect(myNodes[c][r].x, myNodes[c][r].y, 1, 1);
    }
  }
  
  for (int c = 0; c < myNodes.length-1; c++) {
    for (int r = 0; r < myNodes[c].length-1; r++) {
      stroke(1);
      line(myNodes[c][r].x, myNodes[c][r].y, myNodes[c+1][r].x, myNodes[c+1][r].y);
      //line(myNodes[c][r].x, myNodes[c][r].y, myNodes[c][r+1].x, myNodes[c][r+1].y);
    }
  }
}


void initGrid() {
  int i = 0; 
  for (int y = 0; y < yCount; y++) {
    for (int x = 0; x < xCount; x++) {
      float xPos = x*(gridSize/(xCount-1))+(width-gridSize)/2;
      float yPos = y*(gridSize/(yCount-1))+(height-gridSize)/2;
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
