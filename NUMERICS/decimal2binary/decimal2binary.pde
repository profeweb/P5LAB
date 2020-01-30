
// Número decimal a convertir
int numDecimal = 123;


// Número binari a calcular
int numBinary;

void setup(){
  
  size(800,800);
  
}


int calculateBinary(int numDec){
  
  int nd = numDec;
  int nb = 0;
  int pot10 = 1;
  
  do {
    
    int resta = nd % 2;
    
    nd = nd / 2;
    
    nb = resta*pot10 + nb;
    
    pot10 = pot10 * 10;
    
  } while(nd!=0);
  
  return nb;
}


void draw(){
  
  background(255);
  
  fill(255,0,0); textSize(48);
  text("Núm. Decimal: "+numDecimal, 100, height/3);
  
  // Calcula el número binari a partir del número decimal
  numBinary = calculateBinary(numDecimal);
  
  fill(0); textSize(48);
  text("Núm. Binari: "+numBinary, 100, 2*height/3);
  
}

void keyPressed(){
  
  // Incrementa el número decimal
  if(keyCode==UP){
    numDecimal++;
  }
  // Decrementa el número decimal
  else if(keyCode==DOWN){
    numDecimal--;
  }
}
