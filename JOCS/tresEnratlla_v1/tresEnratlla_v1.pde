Casella[][] t;

boolean guanya = false;
int numTirades = 0;

void setup(){
  size(800,800);
  creaTauler();
}

void draw(){
  background(255);
  dibuixaTauler();
  if(!guanya && numTirades<9){
    
  }
  else if(guanya){
    
  }
  else {
  }
}

void mousePressed(){
  escoltaTauler();
}
