
// Original Message Array
char[] message = {'h', 'e', 'l', 'l', 'o', ' ', 'p','e','o','p','l','e', '!'};

// Ciphered Message Array
char[] coded;

 // Shift value
int shift = 4; 

void setup(){
  size(800,800);
  background(0);
  
  // Creates the coded message array
  coded = new char[message.length];
  
}

void draw(){
  background(0);
  
  // Sets the shift value depending on mouse X position
  shift = (int)map(mouseX, 0, width, 0, 10);
  
  // Code message
  codeMessage(shift);
  
  // Displays the shift on the screen
  displayShift(shift);
  
  // Display original message
  displayMessage(message, 100,height/3);
  
  // Display ciphered message
  displayMessage(coded, 100,2*height/3);
}


// Displays the shift on the screen
void displayShift(int s){
  fill(255,0,0);
  ellipse(width/2, height/2, 50, 50);
  fill(255);
  textSize(30);
  text(s, width/2-10, height/2+10);
}


// Display the message m at the corresponding location
void displayMessage(char[] m, float x, float y){
  textAlign(LEFT);
  textSize(60);
  for(int i=0; i<m.length; i++){
    text(m[i], x + 40*i, y);
  }
}

// Code a message using a shift
void codeMessage(int shift){
  for(int i=0; i<message.length; i++){
    coded[i] = (char)codeChar(message[i], shift);
  }
}

// Returns the codec char for an input char and the shift
int codeChar(char c, int shift){
  
  int cc = (int)c;
  
  // Valid range value to encode: 97 - 123 (a-z)
  if(cc<97 || cc>123){
    return cc;
  }
  else {
    int index = c + shift;
    if(index>123){
      index = 97 + (index - 123);
    }
    return index;
  }
}
