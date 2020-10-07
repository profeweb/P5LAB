

int numDataBits = 7;
float error = 0.5;
String mode = "PAR";

int[] messageSender;
int[] messageReceiver;


void setup(){
  size(800,800);
  textAlign(CENTER); textSize(48); fill(0);
  
  randomData();
  calculateParity(mode);
  transmission(error);
}


void draw(){
  background(200);
  fill(0);
  text("SENDER", width/2, height/4 - 100); 
  displaySenderMessage(width/4, height/4);
  
  fill(255,0,0);
  text("ERROR:"+error*100.0+"%", width/2, height/2);
  
  fill(0);
  text("RECEIVER", width/2, 3*height/4 + 100);
  displayReceiverMessage(width/4, 3*height/4);
}


void randomData(){
  messageSender = new int[numDataBits+1];
  for(int i=0; i<numDataBits; i++){
    messageSender[i] = (int)random(2);
  }
}

String getMessage(int[] message){
  String m="";
  for(int i=0; i<message.length; i++){
    m += message[i];
  }
  return m;
}

int getSenderParityBit(){
  return messageSender[numDataBits];
}

boolean checkParity(){
  return messageSender[numDataBits]==messageReceiver[numDataBits];
}

void calculateParity(String mode){
  int pb;
  int numOnes = 0;
  for(int i=0; i<numDataBits; i++){
    if(messageSender[i]==1){
      numOnes++;
    }
  }
  if(mode.equals("PAR")){
    pb =  (numOnes%2);
  }
  else {
    pb = ((numOnes%2)+1)%2;
  }
  messageSender[numDataBits] = pb;
}

void transmission(float error){
  messageReceiver = new int[numDataBits+1];
  for(int i=0; i<numDataBits+1; i++){
    messageReceiver[i] = messageSender[i];
    if(random(1)<error){
      messageReceiver[i] = errorBit(messageSender[i]);
    }
  }
}

int errorBit(int b){
  if(b==0) {
    return 1;
  }
  else {
    return 0;
  }
}


void displaySenderMessage(float x, float y){
  float xPos = x;
  for(int i=0; i<messageSender.length; i++){
    fill(0);
    if(i==messageSender.length-1){
      fill(0,0,255);
    }
    text(messageSender[i], xPos, y);
    xPos += 50;
  }
}

void displayReceiverMessage(float x, float y){
  float xPos = x;
  for(int i=0; i<messageReceiver.length; i++){
    fill(0);
    if(messageReceiver[i]!=messageSender[i]){
      fill(255,0,0);
    }
    text(messageReceiver[i], xPos, y);
    xPos += 50;
  }
}

void mousePressed(){
  error = map(mouseX, 0, width, 0, 1);
  randomData();
  calculateParity(mode);
  transmission(error);
}
