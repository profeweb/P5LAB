

// Number of Students
int numStudents = 10000;

// Array of student's marks
int[] marks;

// Array of frequencies
int[] freqs;

// Maximum value for freqs array
int maxValue = 0;


void setup(){
  
  size(1400,800);
  
  // Creates the array of marks
  marks = new int[numStudents];
  
  // Fill in the array of marks with pseudo-random numbers [0, 10]
  setPseudoRandomMarks();
  
  // Creates the array of frequencies
  freqs = new int[11];
  
  // Calculates the values for the array of frequencies
  calculateFreqs();
}


void draw(){
  background(255);
  textSize(40);
  text("HISTOGRAM", width/2, 100);
  
  // Display the histogram 
  displayHistogram(150, height-100, 100, 500);
}


// Fill in the array marks with random numbers [0, 10]
void setRandomMarks(){
  for(int i=0; i<numStudents; i++){
      marks[i] = (int)random(11);
  }
}


// Fill in the array marks with pseudo-random numbers [0, 10]
void setPseudoRandomMarks(){
  for(int i=0; i<numStudents; i++){
    float r = random(1);
    if(r<0.6){
      marks[i] = (int)random(4, 9);
    }
    else if(r<0.9) {
      marks[i] = (int)random(0,4);
    }
    else {
      marks[i] = (int)random(9, 11);
    }
  }
}


// Calculate the values for the array freqs
void calculateFreqs(){
  for(int i=0; i<marks.length; i++){
    int m = marks[i];
    freqs[m]++;
  }
  
  int maxValue =0;
  for(int i=0; i<freqs.length; i++){
    if(freqs[i]>maxValue){
      maxValue = freqs[i];
    }
  }
}


// Reset the data
void resetData(){
  setPseudoRandomMarks();
  resetFreqs();
  calculateFreqs();
}

// Reset all freqs to zero
void resetFreqs(){
  maxValue = 0;
  for(int i=0; i<freqs.length; i++){
    freqs[i] = 0;
  }
}


// Display the histogram
void displayHistogram(float xBase, float yBase, float widthColumn, float maxHeight){
  
  // Calculates the scale factor
  float scaleFactor = maxHeight/maxValue;
  
  for(int i=0; i<freqs.length; i++){
    
    // Displays the rect
    fill(lerpColor(color(255,0,0), color(0, 0, 255), (float)i/freqs.length));
    rect(xBase + i*widthColumn, yBase - freqs[i]*scaleFactor, widthColumn, freqs[i]*scaleFactor);
    
    // Displays the text for value and label
    fill(0);textSize(18); textAlign(CENTER);
    text(freqs[i], xBase + i*widthColumn + widthColumn/2, yBase - freqs[i]*scaleFactor - 20); 
    text(i, xBase + i*widthColumn + widthColumn/2, yBase + 20);
  }
  
  // Displays texts for axes
  text("Marks", xBase, yBase + 50);
  text("Freqs", xBase, yBase - maxHeight - 20);
}


void keyPressed(){
  if(key=='r' || key=='R'){
    resetData();
  }
}
