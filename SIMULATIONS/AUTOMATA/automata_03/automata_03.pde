int numItems = 60; // Number of Items in a Generation
int numGeneration = 0;  // Number of the Current Generation


int[] currGen;  // Array to store values for Current Generation
int[] nextGen;  // Array to store values for Next Generation


float cellWidth;   // Width of the Cells
float cellHeight;  // Height of the Cells

void setup(){
  size(1600,800);
  
  cellWidth = width / (float) numItems;
  cellHeight = cellWidth;
  
  // Creates array to store values for Current Generation
  currGen = new int[numItems];
  
  // Creates array to store values for Next Generation
  nextGen = new int[numItems];
  
  // Random values for currGen
  randomValues();
}


void draw(){
  
  //background(255);
  
  // Draws the array of the Current Generation at corresponding y position
  displayGeneration(numGeneration*cellHeight);
  
  // Calculates the values of the Next Generation
  calculateNextGeneration();
  
  // Sawps the values of Arrays
  swapArrays();
  
  // Move to the next generation
  numGeneration++;
}

// Calculates the values for the array Next Generation
void calculateNextGeneration(){
  for(int i=0; i<nextGen.length; i++){
    nextGen[i] = (int)random(0,2);
  }
}

// Copies the values of the array Next Generation to the array Current Generation
void swapArrays(){
  for(int i=0; i<numItems; i++){
    currGen[i] = nextGen[i];
  }
}

// Resets all cells of the Current Generation to value 0
void resetGeneration(){
  for(int i=0; i<currGen.length; i++){
    currGen[i]=0;
  }
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
