

//float scaleFactor = 20.0;
int numStudents = 10000;
int[] marks;

int[] freqs;
int maxValue = 0;


void setup(){
  
  size(1400,800);
  marks = new int[numStudents];
  setPseudoRandomMarks();
  
  freqs = new int[11];
  calculateFreqs();
}


void draw(){
  background(255);
  textSize(40);
  text("HISTOGRAM", width/2, 100);
  displayHistogram(150, height-100, 100, 500);
}

void setRandomMarks(){
  for(int i=0; i<numStudents; i++){
      marks[i] = (int)random(11);
  }
}


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


void calculateFreqs(){
  for(int i=0; i<marks.length; i++){
    int m = marks[i];
    freqs[m]++;
  }
  
  maxValue =0;
  for(int i=0; i<freqs.length; i++){
    if(freqs[i]>maxValue){
      maxValue = freqs[i];
    }
  }
}

void resetData(){
  setPseudoRandomMarks();
  resetFreqs();
  calculateFreqs();
}

void resetFreqs(){
  maxValue = 0;
  for(int i=0; i<freqs.length; i++){
    freqs[i] = 0;
  }
}

void displayHistogram(float xBase, float yBase, float widthColumn, float maxHeight){
  float scaleFactor = maxHeight/maxValue;
  textSize(18); textAlign(CENTER);
  for(int i=0; i<freqs.length; i++){
    fill(lerpColor(color(255,0,0), color(0, 0, 255), (float)i/freqs.length));
    rect(xBase + i*widthColumn, yBase - freqs[i]*scaleFactor, widthColumn, freqs[i]*scaleFactor);
    fill(0);
    text(freqs[i], xBase + i*widthColumn + widthColumn/2, yBase - freqs[i]*scaleFactor - 20); 
    text(i, xBase + i*widthColumn + widthColumn/2, yBase + 20);
  }
  
  text("Marks", xBase, yBase + 50);
  text("Freqs", xBase, yBase - maxHeight - 20);
}


void keyPressed(){
  if(key=='r' || key=='R'){
    resetData();
  }
}
