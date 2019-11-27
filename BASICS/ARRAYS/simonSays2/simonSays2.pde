

PShape[] img;

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
String message;

void setup(){
  size(800,800);
  sequence  = new int[maxLength];
  userInput = new int[maxLength];
  randomSequence();
  
  img = new PShape[4];
  img[0] = loadShape("lightOff.svg");
  img[1] = loadShape("lightOn.svg");
  img[2] = loadShape("ok.svg");
  img[3] = loadShape("wrong.svg");
}


void draw(){
  background(248, 190, 1);
  displayLedsOff();
  if(showSequence){
    displaySequence();
    message = "Remember the sequence of lights!!";
  }
  else {
    checkInputUser();
    message = "Please, try to repeat the sequence.";
  }
  textSize(30); textAlign(CENTER); fill(0);
  text(message, width/2, height-100);
  textSize(20);
  text("Level: "+sequenceLength, width/2, height - 50);
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
  if(n<sequenceLength && x > 60){
    displayItemSequence(n);
  }
  else if (n>=sequenceLength) {
    showSequence = false;
  }
}

void checkInputUser(){
  for(int i=0; i<numInputs; i++){
    int nLed = sequence[i];
    PShape s;
    if(sequence[i] == userInput[i]){
      s = img[2];
      ok = true;
    }
    else {
      s = img[3];
      ok = false;
    }
    //ellipse(150 + 100*nLed, height/2, 50, 50);
    shape(s, 100 + 100*nLed, height/2 - 100);
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
  shape(img[1], 100 + 100*numLed, 0);
}

void displayLedsOff(){
  for(int i=0; i<numLeds; i++){
    noFill();
    //ellipse(150 + 100*i, height/2 - 140, 50,50);
    shape(img[0], 100 + 100*i, 0);
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
      float xLed = 150 + 100*i;
      float yLed = height/2 - 140;
      if((dist(mouseX, mouseY, xLed, yLed)<25)  && (numInputs<sequenceLength)){
        userInput[numInputs] = i; 
        numInputs++;
      }
    }
  }
}
