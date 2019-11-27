

int timeLightOn = 150;

int numLeds = 6;

boolean showSequence = false;
boolean ok = false;
int maxLength = 8;
int sequenceLength = 2;

int[] sequence;
int[] userInput;
int numInputs=0;
int startFrame;


void setup(){
  size(800,800);
  sequence  = new int[maxLength];
  userInput = new int[maxLength];
  randomSequence();
}


void draw(){
  background(255);
  displayLedsOff();
  if(showSequence){
    displaySequence();
  }
  else {
    checkInputUser();
  }
}


void randomSequence(){
  for(int i=0; i<sequenceLength; i++){
    sequence[i] = (int)random(numLeds);
  }
  printArray(sequence);
}

void displaySequence(){
  int n = ((frameCount - startFrame) / timeLightOn);
  int x = frameCount - (startFrame + n*timeLightOn);
  if(n<sequenceLength && x > 6){
    displayItemSequence(n);
  }
  else if (n>=sequenceLength) {
    showSequence = false;
  }
}

void checkInputUser(){
  for(int i=0; i<numInputs; i++){
    int nLed = sequence[i];
    if(sequence[i] == userInput[i]){
      fill(0,255,0);
      ok = true;
    }
    else {
      fill(255,0,0);
      ok = false;
    }
    ellipse(100 + 100*nLed, height/2, 50, 50);
  }
  
  if(numInputs==sequenceLength && ok){
    println("RIGHT");
    nextLevel();
  }
  else if(numInputs==sequenceLength && !ok){
    println("WRONG");
    firstLevel();
  }
}


void displayItemSequence(int i){
  int numLed = sequence[i];
  fill(255,255,0);
  ellipse(100 + 100*numLed, height/2, 50, 50);
}

void displayLedsOff(){
  for(int i=0; i<numLeds; i++){
    noFill();
    ellipse(100 + 100*i, height/2, 50,50);
  }
}

void nextLevel(){
  sequenceLength++;
  randomSequence();
  startFrame = frameCount + 100;
  showSequence = true;
  numInputs = 0;
}

void firstLevel(){
  sequenceLength=2;
  randomSequence();
  startFrame = frameCount + 100;
  showSequence = true;
  numInputs = 0;
}


void keyPressed(){
  if(key=='s' || key=='S'){
    startFrame = frameCount;
    showSequence = true;
  }
}

void mousePressed(){
  if(!showSequence){
    for(int i=0; i<numLeds; i++){
      float xLed = 100 + 100*i;
      float yLed = height/2;
      if((dist(mouseX, mouseY, xLed, yLed)<25)  && (numInputs<sequenceLength)){
        userInput[numInputs] = i; 
        numInputs++;
      }
    }
  }
}
