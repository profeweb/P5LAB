int numItems = 160; // Number of Items in a Generation

int numGeneration = 0;  // Number of the Current Generation

int[] currGen;  // Array to store values for Current Generation
int[] nextGen;  // Array to store values for Next Generation

int[] rule = {0,1,1,0,1,1,0,1};  // Cellular Automata Rule (rule 182)

float cellWidth;  // Width of the Cells
float cellHeight;  // Height of the Cells

void setup(){
  size(1600,800);
  
  // Calculates the width and height of the cells depending on the number of Items in a Generation
  cellWidth = width / (float) numItems;
  cellHeight = cellWidth;
  
  // Creates array to store values for Current Generation
  currGen = new int[numItems];
  
  // Creates array to store values for Next Generation
  nextGen = new int[numItems];
  
  // Sets the cell in the middle with a value = 1
  currGen[numItems/2] = 1;
}


// Resets all cells of the Current Generation to value 0
void resetGeneration(){
  for(int i=0; i<currGen.length; i++){
    currGen[i]=0;
  }
}


// Sets a random new rule
void newRule(){
  for(int i=0; i<rule.length; i++){
    rule[i] = (int)random(2);  //  0 or 1
  }
}


void draw(){
  
  // Draws the array of the Current Generation at corresponding y position
  displayGeneration(numGeneration*cellHeight);
  
  // Calculates the values of the Next Generation
  calculateNextGeneration();
  
  // Sawps the values of Arrays
  swapArrays();
  
  // Move to the next generation
  numGeneration++;
  
  
  // When all the height of the screen is filled, reset all
  if(numGeneration>80){
    // Starts again with generation zero
    numGeneration = 0;
    // Resets the vaues of the array Current Generation (all to zero)
    resetGeneration();
    // Sets the cell in the middle with a value = 1
    currGen[numItems/2] = 1;
    // Sets a random new rule
    newRule();
    // Repaints the screen
    background(255);
  }
}


// Calculates the values for the array Next Generation
void calculateNextGeneration(){
  for(int i=0; i<numItems; i++){
    nextGen[i] = calculateCellValue(i);
  }
}


// Copies the values of the array Next Generation to the array Current Generation
void swapArrays(){
  for(int i=0; i<numItems; i++){
    currGen[i] = nextGen[i];
  }
}


// Calculates the value of a cell depending on the values of previous generation
int calculateCellValue(int n){
  
  int l, c, r; // left, center and right values.
  
  if(n>0){
    l = currGen[n-1];
  }
  else {
    l = currGen[numItems-1];
  }
  
  c = currGen[n];
  
  if(n<numItems-1){
    r = currGen[n+1];
  }
  else {
    r = currGen[0];
  }
  
  int b = l*4 + c*2 + r;  // binary conversion
  
  return rule[b];
  
}


// Displays the current Generation at the corresponding Y position
void displayGeneration(float y){
  for(int i=0; i<currGen.length; i++){
    int value = currGen[i];
    float x = i*cellWidth;
    displayCell(x, y, value, cellWidth, cellHeight);
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
