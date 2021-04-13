int numItems = 60; // Number of Items in a Generation
int numGeneration = 0;  // Number of the Current Generation

int[] currGen;  // Array to store values for Current Generation


float cellWidth;   // Width of the Cells
float cellHeight;  // Height of the Cells

void setup(){
  size(1600,800);
  
  cellWidth = width / (float) numItems;
  cellHeight = cellWidth;
  
  // Creates array to store values for Current Generation
  currGen = new int[numItems];
  
  // Random values for currGen
  randomValues();
}


void draw(){
  
  background(255);
  
  // Draws the array of the Current Generation at corresponding y position
  displayGeneration(numGeneration*cellHeight);
  
}

// Displays the current Generation at the corresponding Y position
void displayGeneration(float y){
  for(int i=0; i<currGen.length; i++){
    int value = currGen[i];
    float x = i*cellWidth;
    displayCell(x, y, value, cellWidth, cellHeight);
  }
}

// Set random values (0,1) for the array currGen
void randomValues(){
  for(int i=0; i<currGen.length; i++){
    currGen[i] = (int)random(0, 2);
  }
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
