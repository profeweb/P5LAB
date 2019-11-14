
int numChars = 500;
char [] chars;

void setup(){
  
  size(800,800);
  chars = new char[numChars];
  
  for(int i=0; i<chars.length; i++){
    chars[i] = (char) int(random(97, 123));
  }
}

void draw(){
  
  background(255);
  
  String message ="";
  
  for(int i=0; i<chars.length; i++){
    char c = chars[i];
    message += c;
    if(i%30==29) {
      message+="\n";
    }
  }
  
  fill(0);
  textSize(30);
  text(message,10,40);
  
}


void mousePressed(){
  for(int i=0; i<chars.length; i++){
    chars[i] = (char) int(random(97, 123));
  }
}
