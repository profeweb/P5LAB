

float cellWidth;   // Width of the Cells
float cellHeight;  // Height of the Cells

void setup(){
  size(1600,800);
  
  // Width and height of the cells
  cellWidth  = 20;
  cellHeight = 20;
}


void draw(){
  
  background(255);
  
  // Draws a cell at (50, 50) with value = 0
  displayCell(50, 50, 0, cellWidth, cellHeight);
  
  // Draws a cell at (250, 150) with value = 1
  displayCell(250, 150, 1, cellWidth, cellHeight);
  
}

// Displays a cell at the corresponding position, size and color
void displayCell(float x, float y, int v, float w, float h){
  stroke(0);
  if(v==0){
    fill(255);
  }
  else {
     fill(0);
  }
  rect(x,y, w, h);
}
